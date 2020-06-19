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

var exports = []string{
	"print_i32", "print_i64", "print_f32", "print_f64",
	"print_i32_f32", "print_f64_f64",
	"global_i32", "global_i64", "global_f32", "global_f64"}
var globals = []byte{
	op.I32_CONST, op.I64_CONST, op.F32_CONST, op.F64_CONST}
var params = [][]value.Type{
	{value.I32}, {value.I64}, {value.F32}, {value.F64},
	{value.I32, value.F32}, {value.F64, value.F64}}
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
	nrFailed   int
	nrOfTests  int
	path       string
	source     *spec.SpecSource
	test       *tester.RunTest
	vm         *context.Runner
}

func NewWasmTester(path string, isSpecTest bool) *WasmTester {
	return &WasmTester{path: path, isSpecTest: isSpecTest}
}

func (tst *WasmTester) createSpecTestModule() {
	//  (import "spectest" "print_i32" (func (param i32)))
	//  (import "spectest" "print_i64" (func (param i64)))
	//  (import "spectest" "print_f32" (func (param f32)))
	//  (import "spectest" "print_f64" (func (param f64)))
	//  (import "spectest" "print_i32_f32" (func (param i32 f32)))
	//  (import "spectest" "print_f64_f64" (func (param f64 f64)))
	//  (import "spectest" "global_i32" (global i32))
	//  (import "spectest" "global_i64" (global i64))
	//  (import "spectest" "global_f32" (global f32))
	//  (import "spectest" "global_f64" (global f64))
	//  (import "spectest" "memory" (memory 1))
	//  (import "spectest" "table" (table 10 funcref))

	tst.m = wasm.NewModule()
	tst.m.Name = "spectest"

	tst.m.Start = value.UNDEFINED
	tst.m.Exports = make([]*wasm.Export, 12)

	tst.m.FuncTypes = make([]*wasm.FuncType, 6)
	tst.m.Internal.Functions = make([]*wasm.Function, 6)
	for i := 0; i < 6; i++ {
		funcType := wasm.NewFuncType()
		funcType.ParamTypes = params[i]
		tst.m.FuncTypes[i] = funcType
		function := wasm.NewFunction()
		function.Type = funcType
		function.Body = []wasm.Instruction{instruction.CreateInstruction(op.END)}
		tst.m.Internal.Functions[i] = function
		export := wasm.NewExport()
		export.Index = uint32(i)
		export.Type = desc.FUNC
		export.Name = exports[i]
		tst.m.Exports[i] = export
	}

	tst.m.Internal.Globals = make([]*wasm.Global, 4)
	for i := 0; i < 4; i++ {
		global := wasm.NewGlobal()
		global.Type = params[i][0]
		global.Init = make([]wasm.Instruction, 2)
		global.Init[0] = instruction.CreateInstruction(globals[i])
		global.Init[1] = instruction.CreateInstruction(op.END)
		global.Init[0].(*instruction.Const).Value.I32 = 666
		tst.m.Internal.Globals[i] = global
		export := wasm.NewExport()
		export.Index = uint32(i)
		export.Type = desc.GLOBAL
		export.Name = exports[i+6]
		tst.m.Exports[i+6] = export
	}

	tst.m.Internal.Memories = make([]*wasm.Memory, 1)
	memory := wasm.NewMemory()
	memory.Min = 1
	memory.Max = 2
	tst.m.Internal.Memories[0] = memory
	export := wasm.NewExport()
	export.Index = 0
	export.Type = desc.MEM
	export.Name = "memory"
	tst.m.Exports[10] = export

	tst.m.Internal.Tables = make([]*wasm.Table, 1)
	table := wasm.NewTable()
	table.ElemType = 0x70
	table.Min = 10
	table.Max = 20
	tst.m.Internal.Tables[0] = table
	export = wasm.NewExport()
	export.Index = 0
	export.Type = desc.TABLE
	export.Name = "table"
	tst.m.Exports[11] = export

	a := NewWasmAnalyzer(tst.m)
	err := a.Analyze()
	if err != nil {
		panic("WTF?")
	}

	err = tst.initVM()
	if err != nil {
		panic("WTF?")
	}

	tst.m = nil
	tst.vm = nil
}

func (tst *WasmTester) fail(format string, a ...interface{}) {
	fmt.Printf("\n%s %s(", tst.modTest.File, tst.funcTest.Name)
	sep := ""
	for i, param := range tst.function.Type.ParamTypes {
		fmt.Printf("%s%s", sep, tst.test.In[i].Field(param))
		sep = ", "
	}
	fmt.Print("): ")
	fmt.Printf(format, a...)
	fmt.Println()
}

func (tst *WasmTester) getValueTest(valueTest *tester.ValueTest, param value.Type) *tester.ValueTest {
	if valueTest.Use == "" {
		return valueTest
	}
	if !strings.HasPrefix(valueTest.Use, param.String()+".") {
		tst.fail("Invalid use name prefix: \"%s\" must start with \"%s\"", valueTest.Use, param.String()+".")
		return nil
	}
	use, ok := tst.folder.Uses[valueTest.Use]
	if !ok {
		tst.fail("Undefined use value: \"%s\"", valueTest.Use)
		return nil
	}
	return use
}

func (tst *WasmTester) initVM() error {
	linker := NewWasmLinker(tst.m)
	err := linker.Link()
	if err != nil {
		return err
	}
	tst.vm = linker.vm
	return nil
}

func (tst *WasmTester) loadModule(filename string) error {
	data, err := ioutil.ReadFile(tst.modulePath + filename)
	if err != nil {
		return err
	}

	tst.vm = nil
	tst.m = wasm.NewModule()
	tst.m.Debug = filename == DEBUG_MODULE
	reader := NewWasmReader(tst.m, data)
	err = reader.Read()
	if err != nil {
		return err
	}

	analyzer := NewWasmAnalyzer(tst.m)
	return analyzer.Analyze()
}

func (tst *WasmTester) parseInputs(cmd *spec.SpecCommand) error {
	tst.funcTest = tst.modTest.Funcs[0]
	tst.funcTest.Name = cmd.Action.Field
	tst.test = tst.funcTest.Tests[0]
	tst.test.Err = cmd.Text
	tst.test.In = make([]*tester.ValueTest, len(cmd.Action.Args))
	for i, specIn := range cmd.Action.Args {
		in := &tester.ValueTest{}
		err := parseValue(in, specIn.Type, specIn.Value)
		if err != nil {
			return err
		}
		tst.test.In[i] = in
	}
	if cmd.Text != "" {
		// should be a trap error
		tst.test.Out = nil
		return nil
	}
	tst.test.Out = make([]*tester.ValueTest, len(cmd.Expected))
	for i, specOut := range cmd.Expected {
		out := &tester.ValueTest{}
		err := parseValue(out, specOut.Type, specOut.Value)
		if err != nil {
			return err
		}
		tst.test.Out[i] = out
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

func (tst *WasmTester) specAction(cmd *spec.SpecCommand) {
	tst.specAssertReturn(cmd)
}

func (tst *WasmTester) specAssertExhaustion(cmd *spec.SpecCommand) {
	tst.specAssertTrap(cmd)
}

func (tst *WasmTester) specAssertInvalid(cmd *spec.SpecCommand) {
	if cmd.Type != "binary" {
		return
	}
	// todo fmt.Println(cmd.Type)
}

func (tst *WasmTester) specAssertMalformed(cmd *spec.SpecCommand) {
	if cmd.Type != "binary" {
		return
	}
	data, err := ioutil.ReadFile(tst.modulePath + cmd.Filename)
	if err != nil {
		tst.fail("Cannot read: %s", tst.modulePath+cmd.Filename)
		return
	}

	tst.nrOfTests++
	tst.m = wasm.NewModule()
	reader := NewWasmReader(tst.m, data)
	err = reader.Read()
	if err != nil {
		if err.Error() != cmd.Text {
			// the error was unexpected
			tst.nrFailed++
			expected := "no error"
			if cmd.Text != "" {
				expected = "'" + cmd.Text + "'"
			}
			tst.fail("Unexpected error: '%s', expected %s", err, expected)
		}
		return
	}

	if cmd.Text != "" {
		// an error was expected
		tst.nrFailed++
		tst.fail("Expected error: %s", cmd.Text)
		return
	}

	tst.fail("No malformed binary found")
}

func (tst *WasmTester) specAssertReturn(cmd *spec.SpecCommand) {
	if tst.m == nil {
		return
	}
	if tst.vm == nil {
		err := tst.initVM()
		if err != nil {
			fmt.Printf("VM init error: %v\n", err)
			return
		}
	}
	saved := tst.vm
	if cmd.Action.Module != "" {
		ctx, ok := Modules[cmd.Action.Module]
		if !ok {
			fmt.Printf("Cannot find module: %s\n", cmd.Action.Module)
			return
		}
		tst.vm = ctx
		tst.m = ctx.Module
	}
	switch cmd.Action.Type {
	case "get":
		tst.specAssertReturnGet(cmd)
	case "invoke":
		tst.specAssertReturnInvoke(cmd)
	default:
		fmt.Printf("Unknown action type: %s\n", cmd.Action.Type)
	}
	tst.vm = saved
	tst.m = saved.Module
}

func (tst *WasmTester) specAssertReturnGet(cmd *spec.SpecCommand) {
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
	tst.nrOfTests++
	for _, export := range tst.m.Exports {
		if export.Name != cmd.Action.Field {
			continue
		}
		if export.Type != desc.GLOBAL {
			fmt.Printf("Not a global: %s\n", export.Name)
			return
		}
		global := tst.m.Internal.Globals[export.Index]
		got := tst.vm.Globals[export.Index]
		gotValue := got.Field(global.Type)
		expValue := out.Field(global.Type)
		if gotValue != expValue {
			// the value was unexpected
			tst.nrFailed++
			fmt.Printf("Expected value: %s, got: %s\n", expValue, gotValue)
		}
		return
	}
}

func (tst *WasmTester) specAssertReturnInvoke(cmd *spec.SpecCommand) {
	err := tst.parseInputs(cmd)
	if err != nil {
		fmt.Printf("Parse error: %v\n", err)
		return
	}
	tst.testFunction()
}

func (tst *WasmTester) specAssertTrap(cmd *spec.SpecCommand) {
	tst.specAssertReturn(cmd)
}

func (tst *WasmTester) specAssertUninstantiable(cmd *spec.SpecCommand) {
	fmt.Println(cmd.Type)
}

func (tst *WasmTester) specAssertUnlinkable(cmd *spec.SpecCommand) {
	tst.specModuleLoad(cmd)
	if tst.Error == nil {
		tst.Error = tst.initVM()
	}
	if tst.Error != nil {
		if tst.Error.Error() != cmd.Text {
			// the error was unexpected
			tst.nrFailed++
			expected := "no error"
			if cmd.Text != "" {
				expected = "'" + cmd.Text + "'"
			}
			fmt.Printf("Unexpected error: '%s', expected %s\n", tst.Error, expected)
		}
		return
	}

	if cmd.Text != "" {
		// an error was expected
		tst.nrFailed++
		fmt.Printf("Expected error: %s\n", cmd.Text)
	}
}

func (tst *WasmTester) specModule(cmd *spec.SpecCommand) {
	tst.specModuleLoad(cmd)
	if tst.Error != nil {
		fmt.Printf("Error loading %s: %v\n", cmd.Filename, tst.Error)
	}
}

func (tst *WasmTester) specModuleLoad(cmd *spec.SpecCommand) {
	tst.nrOfTests++
	funcTest := &tester.FuncTest{}
	funcTest.Tests = make([]*tester.RunTest, 1)
	funcTest.Tests[0] = &tester.RunTest{}
	tst.modTest = &tester.ModuleTest{}
	tst.modTest.File = cmd.Filename
	tst.modTest.Funcs = make([]*tester.FuncTest, 1)
	tst.modTest.Funcs[0] = funcTest
	tst.Error = tst.loadModule(cmd.Filename)
	if tst.Error != nil {
		tst.nrFailed++
		tst.vm = nil
		tst.m = nil
		return
	}

	if cmd.Name != "" {
		tst.m.Name = cmd.Name
	}
}

func (tst *WasmTester) specRegister(cmd *spec.SpecCommand) {
	if tst.vm == nil {
		err := tst.initVM()
		if err != nil {
			fmt.Printf("VM init error: %v\n", err)
			return
		}
	}
	if cmd.Name == "" {
		tst.m.Name = cmd.As
		Modules[cmd.As] = tst.vm
		return
	}

	ctx, ok := Modules[cmd.Name]
	if !ok {
		fmt.Printf("Cannot register module %s as %s\n", cmd.Name, cmd.As)
		return
	}

	Modules[cmd.As] = ctx
}

func (tst *WasmTester) specTest() {
	file, err := os.Open(tst.path)
	if err != nil {
		panic(err)
	}
	defer file.Close()
	err = json.NewDecoder(file).Decode(&tst.source)
	if err != nil {
		panic(err)
	}

	Modules = make(map[string]*context.Runner)
	tst.createSpecTestModule()

	fmt.Printf("Source: %s\n", tst.source.Filename)
	for _, cmd := range tst.source.Commands {
		switch cmd.Type {
		//@formatter:off
		case "action"               : tst.specAction(cmd)
		case "assert_exhaustion"    : tst.specAssertExhaustion(cmd)
		case "assert_invalid"       : tst.specAssertInvalid(cmd)
		case "assert_malformed"     : tst.specAssertMalformed(cmd)
		case "assert_return"        : tst.specAssertReturn(cmd)
		case "assert_trap"          : tst.specAssertTrap(cmd)
		case "assert_uninstantiable": tst.specAssertUninstantiable(cmd)
		case "assert_unlinkable"    : tst.specAssertUnlinkable(cmd)
		case "module"               : tst.specModule(cmd)
		case "register"             : tst.specRegister(cmd)
		//@formatter:on
		default:
			panic("Unknown command: " + cmd.Type)
		}
	}
	fmt.Printf("\n%d tests executed, %d failed.\n", tst.nrOfTests, tst.nrFailed)
	TotalNrOfTests += tst.nrOfTests
	TotalNrFailed += tst.nrFailed
	tst.nrOfTests = 0
	tst.nrFailed = 0
}

func (tst *WasmTester) Test() {
	if tst.isSpecTest {
		tst.modulePath = "../input/spec/"
		tst.specTest()
		return
	}

	file, err := os.Open(tst.path)
	if err != nil {
		panic(err)
	}
	defer file.Close()

	err = json.NewDecoder(file).Decode(&tst.folder)
	if err != nil {
		panic(err)
	}

	// set default uses
	if tst.folder.Uses == nil {
		tst.folder.Uses = make(map[string]*tester.ValueTest)
	}
	for name, use := range uses {
		valueTest := tester.NewValueTest()
		valueTest.Use = use
		tst.folder.Uses[name] = valueTest
	}

	for _, use := range tst.folder.Uses {
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

	for _, mod := range tst.folder.Modules {
		tst.modTest = mod
		err = tst.testModule()
		if err != nil {
			fmt.Printf("%s: %v\n", mod.File, err)
		}
	}
	fmt.Printf("\n%d tests executed, %d failed.\n", tst.nrOfTests, tst.nrFailed)
	TotalNrOfTests += tst.nrOfTests
	TotalNrFailed += tst.nrFailed
	tst.nrOfTests = 0
	tst.nrFailed = 0
}

func (tst *WasmTester) testFunction() {
	fmt.Print(".")
	tst.function = nil
	for _, export := range tst.m.Exports {
		if export.Type == desc.FUNC && export.Name == tst.funcTest.Name {
			tst.function = tst.m.Internal.Functions[export.Index]
			break
		}
	}
	if tst.function == nil {
		fmt.Printf("\nError: %s missing function export for: %s\n", tst.modTest.File, tst.funcTest.Name)
		return
	}

	// allocate a (reusable) stack frame for this function
	// all tests on this function will reuse this same stack frame
	tst.vm.Frame = make([]wasm.Variable, tst.function.MaxLocalIndex()+tst.function.FrameSize)
	for _, run := range tst.funcTest.Tests {
		tst.test = run
		tst.testRun()
	}
}

func (tst *WasmTester) testModule() error {
	fmt.Printf("\nModule %s\n", tst.modTest.File)
	tst.modulePath = tst.path[:len(tst.path)-len("tests.json")]
	err := tst.loadModule(tst.modTest.File)
	if err != nil {
		return err
	}
	err = tst.initVM()
	if err != nil {
		return err
	}
	for _, fun := range tst.modTest.Funcs {
		tst.funcTest = fun
		tst.testFunction()
	}
	return nil
}

func (tst *WasmTester) testRun() {
	if len(tst.test.In) != len(tst.function.Type.ParamTypes) {
		fmt.Printf("\n%s %s(): param length mismatch\n", tst.modTest.File, tst.funcTest.Name)
		return
	}

	// copy function call parameters to reusable stack frame
	for i, paramType := range tst.function.Type.ParamTypes {
		valueTest := tst.getValueTest(tst.test.In[i], paramType)
		if valueTest == nil {
			return
		}
		tst.vm.Frame[i].Copy(&valueTest.Variable, paramType)
	}

	// reset the local variables to zero in case they were used
	offset := len(tst.function.Type.ParamTypes)
	for i, local := range tst.function.Locals {
		tst.vm.Frame[offset+i].Copy(&zero, local.Type)
	}

	tst.nrOfTests++
	err := instruction.RunBlock(tst.vm, tst.function.Body)
	if err != nil {
		if err.Error() != tst.test.Err {
			// the error was unexpected
			tst.nrFailed++
			expected := "no error"
			if tst.test.Err != "" {
				expected = "'" + tst.test.Err + "'"
			}
			tst.fail("Unexpected error: '%s', expected %s", err, expected)
		}
		return
	}

	if tst.test.Err != "" {
		// an error was expected
		tst.nrFailed++
		tst.fail("Expected error: %v", tst.test.Err)
		return
	}

	for i, resultType := range tst.function.Type.ResultTypes {
		out := tst.getValueTest(tst.test.Out[i], resultType)
		if out == nil {
			return
		}
		got := tst.vm.Frame[tst.vm.SP+i]
		gotValue := got.Field(resultType)
		expValue := out.Field(resultType)
		if gotValue != expValue {
			// the value was unexpected
			tst.nrFailed++
			tst.fail("Expected value: %s, got: %s", expValue, gotValue)
		}
	}
}
