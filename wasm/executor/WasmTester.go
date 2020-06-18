package executor

import (
	"encoding/json"
	"errors"
	"fmt"
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executor/context"
	"github.com/iotaledger/wart/wasm/executor/context/spec"
	"github.com/iotaledger/wart/wasm/executor/context/tester"
	"github.com/iotaledger/wart/wasm/instruction"
	"github.com/iotaledger/wart/wasm/wasm"
	"io/ioutil"
	"math"
	"os"
	"strconv"
	"strings"
)

const DEBUG_MODULE = "xxx.wasm"

var TotalNrOfTests int
var TotalNrFailed int

var zero wasm.Variable
var uses = map[string]string{
	"i32.Max":  "0x7fffffff",
	"i32.Min":  "0x80000000",
	"i32.uMax": "0xffffffff",

	"i64.Max":  "0x7fffffffffffffff",
	"i64.Min":  "0x8000000000000000",
	"i64.uMax": "0xffffffffffffffff",

	"f32.Inf":   "0x7f800000",
	"f32.Max":   "0x7f7fffff",
	"f32.Min":   "0xff7fffff",
	"f32.NaN":   "0x7fbfffff",
	"f32.Pi":    "0x40490fdb",
	"f32.Zero":  "0x00000000",
	"f32.+Tiny": "0x00800000",
	"f32.-Tiny": "0x80800000",
	"f32.+Inf":  "0x7f800000",
	"f32.-Inf":  "0xff800000",
	"f32.+Zero": "0x00000000",
	"f32.-Zero": "0x80000000",

	"f64.Inf":   "0x7ff0000000000000",
	"f64.Max":   "0x7fefffffffffffff",
	"f64.Min":   "0xffefffffffffffff",
	"f64.NaN":   "0x7ff7ffffffffffff",
	"f64.Pi":    "0x400921fb54442d18",
	"f64.Zero":  "0x0000000000000000",
	"f64.+Tiny": "0x0010000000000000",
	"f64.-Tiny": "0x8010000000000000",
	"f64.+Inf":  "0x7ff0000000000000",
	"f64.-Inf":  "0xfff0000000000000",
	"f64.+Zero": "0x0000000000000000",
	"f64.-Zero": "0x8000000000000000",
}

// WasmReader is an executor that reads a tests.json file and uses its data
// to run a series of unit tests on Wasm modules in the same folder.
type WasmTester struct {
	Error      error
	folder     *tester.FolderTest
	funcTest   *tester.FuncTest
	function   *wasm.Function
	isSpecTest bool
	m          *wasm.Module
	modTest    *tester.ModuleTest
	modulePath string
	modules    map[string]*spec.SpecModule
	nrFailed   int
	nrOfTests  int
	path       string
	source     *spec.SpecSource
	test       *tester.RunTest
	vm         *context.Runner
}

func NewWasmTester(path string, isSpecTest bool) *WasmTester {
	ctx := &WasmTester{path: path, isSpecTest: isSpecTest}
	ctx.modules = make(map[string]*spec.SpecModule)
	return ctx
}

func (ctx *WasmTester) fail(format string, a ...interface{}) {
	fmt.Printf("\n%s %s(", ctx.modTest.File, ctx.funcTest.Name)
	sep := ""
	for i, param := range ctx.function.Type.ParamTypes {
		fmt.Printf("%s%s", sep, ctx.test.In[i].Field(param))
		sep = ", "
	}
	fmt.Print("): ")
	fmt.Printf(format, a...)
	fmt.Println()
}

func (ctx *WasmTester) getValueTest(valueTest *tester.ValueTest, param value.Type) *tester.ValueTest {
	if valueTest.Use == "" {
		return valueTest
	}
	if !strings.HasPrefix(valueTest.Use, param.String()+".") {
		ctx.fail("Invalid use name prefix: \"%s\" must start with \"%s\"", valueTest.Use, param.String()+".")
		return nil
	}
	use, ok := ctx.folder.Uses[valueTest.Use]
	if !ok {
		ctx.fail("Undefined use value: \"%s\"", valueTest.Use)
		return nil
	}
	return use
}

func (ctx *WasmTester) initExprValue(val *wasm.Variable, expr []wasm.Instruction, vt value.Type) {
	if len(expr) == 0 {
		return
	}
	init := expr[0]
	switch init.Opcode() {
	case op.I32_CONST, op.I64_CONST, op.F32_CONST, op.F64_CONST:
		val.Copy(&init.(*instruction.Const).Value, vt)
	case op.GLOBAL_GET:
		imported := &ctx.vm.Globals[init.(*instruction.Var).Index]
		val.Copy(imported, vt)
	default:
		panic("non-constant initializer expression")
	}
}

func (ctx *WasmTester) initVM() error {
	ctx.vm = context.NewRunner(ctx.m)
	if ctx.m.Name != "" {
		mod, ok := ctx.modules[ctx.m.Name]
		if ok {
			mod.VM = ctx.vm
		}
	}

	for i, global := range ctx.m.External.Globals {
		if global.Module == "" {
			continue
		}
		mod, ok := ctx.modules[global.Module]
		if !ok {
			continue
		}
		for _, export := range mod.Module.Exports {
			if export.Type == desc.GLOBAL && export.Name == global.Name {
				imported := mod.Module.Internal.Globals[export.Index]
				if imported.Type != global.Type {
					return errors.New("incompatible import type")
				}
				ctx.m.External.Globals[i] = imported
				ctx.m.Internal.Globals[i] = imported
				break
			}
		}
	}

	for i, function := range ctx.m.External.Functions {
		if function.Module == "" {
			continue
		}
		mod, ok := ctx.modules[function.Module]
		if !ok {
			continue
		}
		for _, export := range mod.Module.Exports {
			if export.Type == desc.FUNC && export.Name == function.Name {
				imported := mod.Module.Internal.Functions[export.Index]
				if !imported.Type.IsSameAs(function.Type) {
					return errors.New("incompatible import type")
				}
				ctx.m.External.Functions[i] = imported
				ctx.m.Internal.Functions[i] = imported
				break
			}
		}
	}

	for i, function := range ctx.m.External.Memories {
		if function.Module == "" {
			continue
		}
		mod, ok := ctx.modules[function.Module]
		if !ok {
			continue
		}
		for _, export := range mod.Module.Exports {
			if export.Type == desc.MEM && export.Name == function.Name {
				imported := mod.Module.Internal.Memories[export.Index]
				ctx.m.External.Memories[i] = imported
				ctx.m.Internal.Memories[i] = imported
				break
			}
		}
	}

	for i, function := range ctx.m.External.Tables {
		if function.Module == "" {
			continue
		}
		mod, ok := ctx.modules[function.Module]
		if !ok {
			continue
		}
		for _, export := range mod.Module.Exports {
			if export.Type == desc.TABLE && export.Name == function.Name {
				imported := mod.Module.Internal.Tables[export.Index]
				ctx.m.External.Tables[i] = imported
				ctx.m.Internal.Tables[i] = imported
				break
			}
		}
	}

	offsetValue := &wasm.Variable{}
	for _, element := range ctx.m.Elements {
		table := ctx.m.Internal.Tables[element.TableIndex]
		ctx.initExprValue(offsetValue, element.Offset, value.I32)
		start := offsetValue.I32
		if start < 0 || uint32(start)+uint32(len(element.FuncIndexes)) > table.Min {
			return errors.New("elements segment does not fit")
		}
		for _, funcIndex := range element.FuncIndexes {
			if /* funcIndex < 0 || */ funcIndex > uint32(len(ctx.m.Internal.Functions)) {
				return errors.New("Invalid function index")
			}
			table.Functions[start] = ctx.m.Internal.Functions[funcIndex]
			start++
		}
	}

	//todo more init globals and memory
	ctx.vm.Globals = make([]wasm.Variable, ctx.m.MaxGlobals())
	for i, global := range ctx.m.Internal.Globals {
		globalValue := &ctx.vm.Globals[i]
		ctx.initExprValue(globalValue, global.Init, global.Type)
	}

	for _, memory := range ctx.m.Internal.Memories {
		if memory.Nr != 0 {
			return errors.New("Multiple memories not yet supported")
		}
		ctx.vm.Memory = make([]byte, memory.Min*context.PAGE_SIZE)
		ctx.vm.MaxPages = 0x8000
		if memory.Max < ctx.vm.MaxPages && memory.Max != value.UNDEFINED {
			ctx.vm.MaxPages = memory.Max
		}
	}

	addrValue := &wasm.Variable{}
	for _, data := range ctx.m.Datas {
		ctx.initExprValue(addrValue, data.Offset, value.I32)
		addr := uint32(addrValue.I32)
		end := addr + uint32(len(data.Data))
		//  be careful not to wrap around the uint32
		if end < addr || end > uint32(len(ctx.vm.Memory)) {
			return errors.New("data segment does not fit")
		}
		copy(ctx.vm.Memory[addr:], data.Data)
	}

	if ctx.m.Start == value.UNDEFINED {
		return nil
	}

	startFunction := ctx.m.Internal.Functions[ctx.m.Start]
	ctx.vm.Frame = make([]wasm.Variable, startFunction.MaxLocalIndex()+startFunction.FrameSize)
	err := instruction.RunBlock(ctx.vm, startFunction.Body)
	if err != nil {
		return err
	}

	if ctx.m.Name != "" {
		ctx.modules[ctx.m.Name].VM = ctx.vm
	}
	return nil
}

func (ctx *WasmTester) loadModule(filename string) error {
	data, err := ioutil.ReadFile(ctx.modulePath + filename)
	if err != nil {
		return err
	}

	ctx.vm = nil
	ctx.m = wasm.NewModule()
	ctx.m.Debug = filename == DEBUG_MODULE
	reader := NewWasmReader(ctx.m, data)
	err = reader.Read()
	if err != nil {
		return err
	}

	analyzer := NewWasmAnalyzer(ctx.m)
	return analyzer.Analyze()
}

func (ctx *WasmTester) parseInputs(cmd *spec.SpecCommand) error {
	ctx.funcTest = ctx.modTest.Funcs[0]
	ctx.funcTest.Name = cmd.Action.Field
	ctx.test = ctx.funcTest.Tests[0]
	ctx.test.Err = cmd.Text
	ctx.test.In = make([]*tester.ValueTest, len(cmd.Action.Args))
	for i, specIn := range cmd.Action.Args {
		in := &tester.ValueTest{}
		err := parseValue(in, specIn.Type, specIn.Value)
		if err != nil {
			return err
		}
		ctx.test.In[i] = in
	}
	if cmd.Text != "" {
		// should be a trap error
		ctx.test.Out = nil
		return nil
	}
	ctx.test.Out = make([]*tester.ValueTest, len(cmd.Expected))
	for i, specOut := range cmd.Expected {
		out := &tester.ValueTest{}
		err := parseValue(out, specOut.Type, specOut.Value)
		if err != nil {
			return err
		}
		ctx.test.Out[i] = out
	}
	return nil
}

func parseInt(v string) (uint64, error) {
	if v == "" {
		return 0, errors.New("Empty value: " + v)
	}
	if v == "0" {
		return 0, nil
	}
	if v[0] == '0' {
		return 0, errors.New("Leading zeroes: " + v)
	}
	val := uint64(0)
	for i := 0; i < len(v); i++ {
		c := v[i]
		if c < '0' || c > '9' {
			return 0, errors.New("Invalid value: " + v)
		}
		val = val*10 + uint64(c-'0')
	}
	return val, nil
}

func parseValue(in *tester.ValueTest, field string, value string) error {
	switch field {
	case "f32":
		if value == "nan:canonical" {
			in.F32 = math.Float32frombits(0x7fbfffff)
			return nil
		}
		if value == "nan:arithmetic" {
			in.F32 = math.Float32frombits(0xffbfffff)
			return nil
		}
	case "f64":
		if value == "nan:canonical" {
			in.F64 = math.Float64frombits(0x7ff7ffffffffffff)
			return nil
		}
		if value == "nan:arithmetic" {
			in.F64 = math.Float64frombits(0xfff7ffffffffffff)
			return nil
		}
	}

	val, err := parseInt(value)
	if err != nil {
		return err
	}

	switch field {
	//@formatter:off
	case "i32": in.I32 = int32(val)
	case "i64": in.I64 = int64(val)
	case "f32": in.F32 = math.Float32frombits(uint32(val))
	case "f64": in.F64 = math.Float64frombits(val)
	//@formatter:on
	default:
		return errors.New("Invalid arg type: " + field)
	}
	return nil
}

func (ctx *WasmTester) specAction(cmd *spec.SpecCommand) {
	ctx.specAssertReturn(cmd)
}

func (ctx *WasmTester) specAssertExhaustion(cmd *spec.SpecCommand) {
	ctx.specAssertTrap(cmd)
}

func (ctx *WasmTester) specAssertInvalid(cmd *spec.SpecCommand) {
	if cmd.Type != "binary" {
		return
	}
	// todo fmt.Println(cmd.Type)
}

func (ctx *WasmTester) specAssertMalformed(cmd *spec.SpecCommand) {
	if cmd.Type != "binary" {
		return
	}
	data, err := ioutil.ReadFile(ctx.modulePath + cmd.Filename)
	if err != nil {
		ctx.fail("Cannot read: %s", ctx.modulePath+cmd.Filename)
		return
	}

	ctx.nrOfTests++
	ctx.m = wasm.NewModule()
	reader := NewWasmReader(ctx.m, data)
	err = reader.Read()
	if err != nil {
		if err.Error() != cmd.Text {
			// the error was unexpected
			ctx.nrFailed++
			expected := "no error"
			if cmd.Text != "" {
				expected = "'" + cmd.Text + "'"
			}
			ctx.fail("Unexpected error: '%s', expected %s", err, expected)
		}
		return
	}

	if cmd.Text != "" {
		// an error was expected
		ctx.nrFailed++
		ctx.fail("Expected error: %s", cmd.Text)
		return
	}

	ctx.fail("No malformed binary found")
}

func (ctx *WasmTester) specAssertReturn(cmd *spec.SpecCommand) {
	if ctx.m == nil {
		return
	}
	if ctx.vm == nil {
		err := ctx.initVM()
		if err != nil {
			fmt.Printf("VM init error: %v\n", err)
			return
		}
	}
	saved := &spec.SpecModule{}
	saved.Module = ctx.m
	saved.VM = ctx.vm
	if cmd.Action.Module != "" {
		mod, ok := ctx.modules[cmd.Action.Module]
		if !ok {
			fmt.Printf("Cannot find module: %s\n", cmd.Action.Module)
			return
		}
		ctx.m = mod.Module
		ctx.vm = mod.VM
	}
	switch cmd.Action.Type {
	case "get":
		ctx.specAssertReturnGet(cmd)
	case "invoke":
		ctx.specAssertReturnInvoke(cmd)
	default:
		fmt.Printf("Unknown action type: %s\n", cmd.Action.Type)
	}
	ctx.m = saved.Module
	ctx.vm = saved.VM
}

func (ctx *WasmTester) specAssertReturnGet(cmd *spec.SpecCommand) {
	if len(cmd.Expected) != 1 {
		fmt.Printf("Missing expected value\n")
		return
	}
	expected := cmd.Expected[0]
	out := &tester.ValueTest{}
	err := parseValue(out, expected.Type, expected.Value)
	if err != nil {
		fmt.Printf("Parse error: %v\n", err)
		return
	}
	ctx.nrOfTests++
	for _, export := range ctx.m.Exports {
		if export.Name != cmd.Action.Field {
			continue
		}
		if export.Type != desc.GLOBAL {
			fmt.Printf("Not a global: %s\n", export.Name)
			return
		}
		global := ctx.m.Internal.Globals[export.Index]
		got := ctx.vm.Globals[export.Index]
		gotValue := got.Field(global.Type)
		expValue := out.Field(global.Type)
		if gotValue != expValue {
			// the value was unexpected
			ctx.nrFailed++
			fmt.Printf("Expected value: %s, got: %s\n", expValue, gotValue)
		}
		return
	}
}

func (ctx *WasmTester) specAssertReturnInvoke(cmd *spec.SpecCommand) {
	err := ctx.parseInputs(cmd)
	if err != nil {
		fmt.Printf("Parse error: %v\n", err)
		return
	}
	ctx.testFunction()
}

func (ctx *WasmTester) specAssertTrap(cmd *spec.SpecCommand) {
	ctx.specAssertReturn(cmd)
}

func (ctx *WasmTester) specAssertUninstantiable(cmd *spec.SpecCommand) {
	fmt.Println(cmd.Type)
}

func (ctx *WasmTester) specAssertUnlinkable(cmd *spec.SpecCommand) {
	ctx.specModuleLoad(cmd)
	if ctx.Error == nil {
		ctx.Error = ctx.initVM()
	}
	if ctx.Error != nil {
		if ctx.Error.Error() != cmd.Text {
			// the error was unexpected
			ctx.nrFailed++
			expected := "no error"
			if cmd.Text != "" {
				expected = "'" + cmd.Text + "'"
			}
			fmt.Printf("Unexpected error: '%s', expected %s\n", ctx.Error, expected)
		}
		return
	}

	if cmd.Text != "" {
		// an error was expected
		ctx.nrFailed++
		fmt.Printf("Expected error: %s\n", cmd.Text)
	}
}

func (ctx *WasmTester) specModule(cmd *spec.SpecCommand) {
	ctx.specModuleLoad(cmd)
	if ctx.Error != nil {
		fmt.Printf("Error loading %s: %v\n", cmd.Filename, ctx.Error)
	}
}

func (ctx *WasmTester) specModuleLoad(cmd *spec.SpecCommand) {
	ctx.nrOfTests++
	funcTest := &tester.FuncTest{}
	funcTest.Tests = make([]*tester.RunTest, 1)
	funcTest.Tests[0] = &tester.RunTest{}
	ctx.modTest = &tester.ModuleTest{}
	ctx.modTest.File = cmd.Filename
	ctx.modTest.Funcs = make([]*tester.FuncTest, 1)
	ctx.modTest.Funcs[0] = funcTest
	ctx.Error = ctx.loadModule(cmd.Filename)
	if ctx.Error != nil {
		ctx.nrFailed++
		ctx.vm = nil
		ctx.m = nil
		return
	}

	if cmd.Name != "" {
		ctx.m.Name = cmd.Name
		mod := &spec.SpecModule{}
		mod.Module = ctx.m
		ctx.modules[ctx.m.Name] = mod
	}
}

func (ctx *WasmTester) specRegister(cmd *spec.SpecCommand) {
	if ctx.vm == nil {
		err := ctx.initVM()
		if err != nil {
			fmt.Printf("VM init error: %v\n", err)
			return
		}
	}
	if cmd.Name == "" {
		ctx.m.Name = cmd.As
		mod := &spec.SpecModule{}
		mod.Module = ctx.m
		mod.VM = ctx.vm
		ctx.modules[cmd.As] = mod
		return
	}

	mod, ok := ctx.modules[cmd.Name]
	if !ok {
		fmt.Printf("Cannot register module %s as %s\n", cmd.Name, cmd.As)
		return
	}

	ctx.modules[cmd.As] = mod
}

func (ctx *WasmTester) specTest() {
	file, err := os.Open(ctx.path)
	if err != nil {
		panic(err)
	}
	defer file.Close()

	err = json.NewDecoder(file).Decode(&ctx.source)
	if err != nil {
		panic(err)
	}
	fmt.Printf("Source: %s\n", ctx.source.Filename)
	for _, cmd := range ctx.source.Commands {
		switch cmd.Type {
		//@formatter:off
		case "action"               : ctx.specAction(cmd)
		case "assert_exhaustion"    : ctx.specAssertExhaustion(cmd)
		case "assert_invalid"       : ctx.specAssertInvalid(cmd)
		case "assert_malformed"     : ctx.specAssertMalformed(cmd)
		case "assert_return"        : ctx.specAssertReturn(cmd)
		case "assert_trap"          : ctx.specAssertTrap(cmd)
		case "assert_uninstantiable": ctx.specAssertUninstantiable(cmd)
		case "assert_unlinkable"    : ctx.specAssertUnlinkable(cmd)
		case "module"               : ctx.specModule(cmd)
		case "register"             : ctx.specRegister(cmd)
		//@formatter:on
		default:
			panic("Unknown command: " + cmd.Type)
		}
	}
	fmt.Printf("\n%d tests executed, %d failed.\n", ctx.nrOfTests, ctx.nrFailed)
	TotalNrOfTests += ctx.nrOfTests
	TotalNrFailed += ctx.nrFailed
	ctx.nrOfTests = 0
	ctx.nrFailed = 0
}

func (ctx *WasmTester) Test() {
	if ctx.isSpecTest {
		ctx.modulePath = "../input/spec/"
		ctx.specTest()
		return
	}

	file, err := os.Open(ctx.path)
	if err != nil {
		panic(err)
	}
	defer file.Close()

	err = json.NewDecoder(file).Decode(&ctx.folder)
	if err != nil {
		panic(err)
	}

	// set default uses
	if ctx.folder.Uses == nil {
		ctx.folder.Uses = make(map[string]*tester.ValueTest)
	}
	for name, use := range uses {
		valueTest := tester.NewValueTest()
		valueTest.Use = use
		ctx.folder.Uses[name] = valueTest
	}

	for _, use := range ctx.folder.Uses {
		if strings.HasPrefix(use.Use, "0x") {
			v, err := strconv.ParseUint(use.Use[2:], 16, 64)
			if err != nil {
				fmt.Printf("Cannot parse hex value: %v\n", err)
				return
			}
			use.I32 = int32(v)
			use.I64 = int64(v)
			use.F32 = math.Float32frombits(uint32(v))
			use.F64 = math.Float64frombits(v)
		}
	}

	for _, mod := range ctx.folder.Modules {
		ctx.modTest = mod
		err = ctx.testModule()
		if err != nil {
			fmt.Printf("%s: %v\n", mod.File, err)
		}
	}
	fmt.Printf("\n%d tests executed, %d failed.\n", ctx.nrOfTests, ctx.nrFailed)
	TotalNrOfTests += ctx.nrOfTests
	TotalNrFailed += ctx.nrFailed
	ctx.nrOfTests = 0
	ctx.nrFailed = 0
}

func (ctx *WasmTester) testFunction() {
	fmt.Print(".")
	ctx.function = nil
	for _, export := range ctx.m.Exports {
		if export.Type == desc.FUNC && export.Name == ctx.funcTest.Name {
			ctx.function = ctx.m.Internal.Functions[export.Index]
			break
		}
	}
	if ctx.function == nil {
		fmt.Printf("\nError: %s missing function export for: %s\n", ctx.modTest.File, ctx.funcTest.Name)
		return
	}

	// allocate a (reusable) stack frame for this function
	// all tests on this function will reuse this same stack frame
	ctx.vm.Frame = make([]wasm.Variable, ctx.function.MaxLocalIndex()+ctx.function.FrameSize)
	for _, run := range ctx.funcTest.Tests {
		ctx.test = run
		ctx.testRun()
	}
}

func (ctx *WasmTester) testModule() error {
	fmt.Printf("\nModule %s\n", ctx.modTest.File)
	ctx.modulePath = ctx.path[:len(ctx.path)-len("tests.json")]
	err := ctx.loadModule(ctx.modTest.File)
	if err != nil {
		return err
	}
	err = ctx.initVM()
	if err != nil {
		return err
	}
	for _, fun := range ctx.modTest.Funcs {
		ctx.funcTest = fun
		ctx.testFunction()
	}
	return nil
}

func (ctx *WasmTester) testRun() {
	if len(ctx.test.In) != len(ctx.function.Type.ParamTypes) {
		fmt.Printf("\n%s %s(): param length mismatch\n", ctx.modTest.File, ctx.funcTest.Name)
		return
	}

	// copy function call parameters to reusable stack frame
	for i, paramType := range ctx.function.Type.ParamTypes {
		valueTest := ctx.getValueTest(ctx.test.In[i], paramType)
		if valueTest == nil {
			return
		}
		ctx.vm.Frame[i].Copy(&valueTest.Variable, paramType)
	}

	// reset the local variables to zero in case they were used
	offset := len(ctx.function.Type.ParamTypes)
	for i, local := range ctx.function.Locals {
		ctx.vm.Frame[offset+i].Copy(&zero, local.Type)
	}

	ctx.nrOfTests++
	err := instruction.RunBlock(ctx.vm, ctx.function.Body)
	if err != nil {
		if err.Error() != ctx.test.Err {
			// the error was unexpected
			ctx.nrFailed++
			expected := "no error"
			if ctx.test.Err != "" {
				expected = "'" + ctx.test.Err + "'"
			}
			ctx.fail("Unexpected error: '%s', expected %s", err, expected)
		}
		return
	}

	if ctx.test.Err != "" {
		// an error was expected
		ctx.nrFailed++
		ctx.fail("Expected error: %v", ctx.test.Err)
		return
	}

	for i, resultType := range ctx.function.Type.ResultTypes {
		out := ctx.getValueTest(ctx.test.Out[i], resultType)
		if out == nil {
			return
		}
		got := ctx.vm.Frame[ctx.vm.SP+i]
		gotValue := got.Field(resultType)
		expValue := out.Field(resultType)
		if gotValue != expValue {
			// the value was unexpected
			ctx.nrFailed++
			ctx.fail("Expected value: %s, got: %s", expValue, gotValue)
		}
	}
}
