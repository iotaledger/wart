package executors

import (
	"encoding/json"
	"fmt"
	"github.com/iotaledger/wart/utils"
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors/context"
	"github.com/iotaledger/wart/wasm/executors/context/spec"
	"github.com/iotaledger/wart/wasm/executors/context/test"
	"github.com/iotaledger/wart/wasm/instructions"
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"github.com/iotaledger/wart/wasm/sections"
	"io/ioutil"
	"math"
	"os"
	"strconv"
	"strings"
)

const DEBUG_MODULE = "xxx.wasm"

var TotalNrOfTests int
var TotalNrFailed int

var specExports = []string{
	"print_i32", "print_i64", "print_f32", "print_f64",
	"print_i32_f32", "print_f64_f64",
	"global_i32", "global_i64", "global_f32", "global_f64",
}
var specGlobals = []byte{
	op.I32_CONST, op.I64_CONST, op.F32_CONST, op.F64_CONST,
}
var specParams = [][]value.DataType{
	{value.I32}, {value.I64}, {value.F32}, {value.F64},
	{value.I32, value.F32}, {value.F64, value.F64},
}

var zero sections.Variable
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
	function   *sections.Function
	isSpecTest bool
	m          *sections.Module
	modulePath string
	nrFailed   int
	nrOfTests  int
	path       string
	source     *spec.SpecSource
	test       *test.TestRun
	testFolder *test.TestFolder
	testFunc   *test.TestFunc
	testMod    *test.TestModule
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

	tst.m = sections.NewModule()
	tst.m.ImportName = "spectest"

	tst.m.Start = value.UNDEFINED
	tst.m.Exports = make([]*sections.Export, 12)

	tst.m.FuncTypes = make([]*sections.FuncType, 6)
	tst.m.Functions = make([]*sections.Function, 6)
	for i := 0; i < 6; i++ {
		funcType := sections.NewFuncType()
		funcType.ParamTypes = specParams[i]
		tst.m.FuncTypes[i] = funcType
		function := sections.NewFunction()
		function.FuncType = funcType
		function.Body = []helper.Instruction{instructions.CreateInstruction(op.END)}
		tst.m.Functions[i] = function
		export := sections.NewExport()
		export.Index = uint32(i)
		export.ExternalType = desc.FUNC
		export.ImportName = specExports[i]
		tst.m.Exports[i] = export
	}

	//@formatter:off
	tst.m.Functions[0].HostCall = func(ctx *sections.HostContext) error { fmt.Printf("==>> %s: %d\n",    specExports[0], ctx.Frame[ctx.SP].I32); return nil }
	tst.m.Functions[1].HostCall = func(ctx *sections.HostContext) error { fmt.Printf("==>> %s: %d\n",    specExports[1], ctx.Frame[ctx.SP].I64); return nil }
	tst.m.Functions[2].HostCall = func(ctx *sections.HostContext) error { fmt.Printf("==>> %s: %f\n",    specExports[2], ctx.Frame[ctx.SP].F32); return nil }
	tst.m.Functions[3].HostCall = func(ctx *sections.HostContext) error { fmt.Printf("==>> %s: %f\n",    specExports[3], ctx.Frame[ctx.SP].F64); return nil }
	tst.m.Functions[4].HostCall = func(ctx *sections.HostContext) error { fmt.Printf("==>> %s: %d %f\n", specExports[4], ctx.Frame[ctx.SP].I32, ctx.Frame[ctx.SP+1].F32); return nil }
	tst.m.Functions[5].HostCall = func(ctx *sections.HostContext) error { fmt.Printf("==>> %s: %f %f\n", specExports[5], ctx.Frame[ctx.SP].F64, ctx.Frame[ctx.SP+1].F64); return nil }
	//@formatter:on

	tst.m.Globals = make([]*sections.Global, 4)
	for i := 0; i < 4; i++ {
		global := sections.NewGlobal()
		global.DataType = specParams[i][0]
		global.Init = make([]helper.Instruction, 2)
		global.Init[0] = instructions.CreateInstruction(specGlobals[i])
		global.Init[1] = instructions.CreateInstruction(op.END)
		global.Init[0].(*instructions.Const).Value.I32 = 666
		tst.m.Globals[i] = global
		export := sections.NewExport()
		export.Index = uint32(i)
		export.ExternalType = desc.GLOBAL
		export.ImportName = specExports[i+6]
		tst.m.Exports[i+6] = export
	}

	tst.m.Memories = make([]*sections.Memory, 1)
	memory := sections.NewMemory()
	memory.Min = 1
	memory.Max = 2
	tst.m.Memories[0] = memory
	export := sections.NewExport()
	export.Index = 0
	export.ExternalType = desc.MEM
	export.ImportName = "memory"
	tst.m.Exports[10] = export

	tst.m.Tables = make([]*sections.Table, 1)
	table := sections.NewTable()
	table.ElemType = 0x70
	table.Min = 10
	table.Max = 20
	tst.m.Tables[0] = table
	export = sections.NewExport()
	export.Index = 0
	export.ExternalType = desc.TABLE
	export.ImportName = "table"
	tst.m.Exports[11] = export

	tst.moduleAnalyze()
	if tst.Error != nil {
		panic("WTF?")
	}

	tst.moduleLink()
	if tst.Error != nil {
		panic("WTF?")
	}

	tst.m = nil
}

func (tst *WasmTester) fail(format string, a ...interface{}) {
	fmt.Printf("%s %s(", tst.testMod.File, tst.testFunc.Name)
	sep := ""
	for i, param := range tst.function.FuncType.ParamTypes {
		fmt.Printf("%s%s", sep, tst.test.In[i].Field(param))
		sep = ", "
	}
	fmt.Print("): ")
	fmt.Printf(format, a...)
	fmt.Println()
}

func (tst *WasmTester) getTestValue(testValue *test.TestValue, param value.DataType) *test.TestValue {
	if testValue.Use == "" {
		return testValue
	}
	if !strings.HasPrefix(testValue.Use, param.String()+".") {
		tst.fail("Invalid use name prefix: \"%s\" must start with \"%s\"", testValue.Use, param.String()+".")
		return nil
	}
	use, ok := tst.testFolder.Uses[testValue.Use]
	if !ok {
		tst.fail("Undefined use value: \"%s\"", testValue.Use)
		return nil
	}
	return use
}

func (tst *WasmTester) moduleAnalyze() {
	analyzer := NewWasmAnalyzer(tst.m)
	tst.Error = analyzer.Analyze()
}

func (tst *WasmTester) moduleLink() {
	linker := NewWasmLinker(tst.m)
	tst.Error = linker.Link()
}

func (tst *WasmTester) moduleLoad(filename string) {
	tst.moduleRead(filename)
	if tst.Error == nil {
		tst.moduleAnalyze()
	}
}

func (tst *WasmTester) moduleRead(filename string) {
	tst.m = sections.NewModule()
	tst.m.Debug = filename == DEBUG_MODULE
	funcTest := test.NewFuncTest()
	funcTest.Tests = []*test.TestRun{test.NewRunTest()}
	tst.testMod = test.NewModuleTest()
	tst.testMod.File = filename
	tst.testMod.Funcs = []*test.TestFunc{funcTest}
	data := tst.readData(filename)
	if tst.Error == nil {
		reader := NewWasmReader(tst.m, data)
		tst.Error = reader.Read()
	}
}

func (tst *WasmTester) parseInputs(cmd *spec.SpecCommand) error {
	tst.testFunc = tst.testMod.Funcs[0]
	tst.testFunc.Name = cmd.Action.ExportName
	tst.test = tst.testFunc.Tests[0]
	tst.test.Err = cmd.ErrorText
	tst.test.In = make([]*test.TestValue, len(cmd.Action.Args))
	for i, specIn := range cmd.Action.Args {
		in := test.NewValueTest()
		err := parseValue(in, specIn.DataType, specIn.Value)
		if err != nil {
			return err
		}
		tst.test.In[i] = in
	}
	if cmd.ErrorText != "" {
		// should be a trap error
		tst.test.Out = nil
		return nil
	}
	tst.test.Out = make([]*test.TestValue, len(cmd.Expected))
	for i, specOut := range cmd.Expected {
		out := test.NewValueTest()
		err := parseValue(out, specOut.DataType, specOut.Value)
		if err != nil {
			return err
		}
		tst.test.Out[i] = out
	}
	return nil
}

func parseInt(v string) (uint64, error) {
	if v == "" {
		return 0, utils.Error("Empty value: " + v)
	}
	if v == "0" {
		return 0, nil
	}
	if v[0] == '0' {
		return 0, utils.Error("Leading zeroes: " + v)
	}
	val := uint64(0)
	for i := 0; i < len(v); i++ {
		c := v[i]
		if c < '0' || c > '9' {
			return 0, utils.Error("Invalid value: " + v)
		}
		val = val*10 + uint64(c-'0')
	}
	return val, nil
}

func parseValue(in *test.TestValue, field string, value string) error {
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
		return utils.Error("Invalid arg type: " + field)
	}
	return nil
}

func (tst *WasmTester) readData(filename string) []byte {
	data, err := ioutil.ReadFile(tst.modulePath + filename)
	tst.Error = err
	if tst.Error != nil {
		tst.fail("Cannot read: %s", tst.modulePath+filename)
		return nil
	}
	return data
}

func (tst *WasmTester) specAction(cmd *spec.SpecCommand) {
	tst.specAssertReturn(cmd)
}

func (tst *WasmTester) specAssertExhaustion(cmd *spec.SpecCommand) {
	tst.specAssertTrap(cmd)
}

func (tst *WasmTester) specAssertInvalid(cmd *spec.SpecCommand) {
	if cmd.ModuleType != "binary" {
		return
	}
	tst.nrOfTests++
	tst.moduleLoad(cmd.Filename)
	tst.verifyError(cmd.ErrorText, cmd.CommandType)
	tst.m = nil
}

func (tst *WasmTester) specAssertMalformed(cmd *spec.SpecCommand) {
	if cmd.ModuleType != "binary" {
		return
	}
	tst.nrOfTests++
	tst.moduleRead(cmd.Filename)
	tst.verifyError(cmd.ErrorText, cmd.CommandType)
	tst.m = nil
}

func (tst *WasmTester) specAssertReturn(cmd *spec.SpecCommand) {
	if tst.m != nil {
		tst.moduleLink()
		if tst.Error != nil {
			fmt.Printf("Module link error: %v\n", tst.Error)
			return
		}
	}

	saved := tst.m
	if cmd.Action.ModuleName != "" {
		mod, ok := Modules[cmd.Action.ModuleName]
		if !ok {
			fmt.Printf("Cannot find module: %s\n", cmd.Action.ModuleName)
			return
		}
		tst.m = mod
	}
	switch cmd.Action.ActionType {
	case "get":
		tst.specAssertReturnGet(cmd)
	case "invoke":
		tst.specAssertReturnInvoke(cmd)
	default:
		fmt.Printf("Unknown action type: %s\n", cmd.Action.ActionType)
	}
	tst.m = saved
}

func (tst *WasmTester) specAssertReturnGet(cmd *spec.SpecCommand) {
	if len(cmd.Expected) != 1 {
		fmt.Printf("Missing expected value\n")
		return
	}
	expected := cmd.Expected[0]
	out := test.NewValueTest()
	err := parseValue(out, expected.DataType, expected.Value)
	if err != nil {
		fmt.Printf("Parse error: %v\n", err)
		return
	}
	tst.nrOfTests++
	for _, export := range tst.m.Exports {
		if export.ImportName != cmd.Action.ExportName {
			continue
		}
		if export.ExternalType != desc.GLOBAL {
			fmt.Printf("Not a global: %s\n", export.ImportName)
			return
		}
		global := tst.m.Globals[export.Index]
		got := tst.m.GlobalVars[export.Index]
		gotValue := got.Field(global.DataType)
		expValue := out.Field(global.DataType)
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
	tst.specAssertUnlinkable(cmd)
}

func (tst *WasmTester) specAssertUnlinkable(cmd *spec.SpecCommand) {
	tst.nrOfTests++
	tst.moduleLoad(cmd.Filename)
	if tst.Error == nil {
		tst.moduleLink()
	}
	tst.verifyError(cmd.ErrorText, cmd.CommandType)
	tst.m = nil
}

func (tst *WasmTester) specModule(cmd *spec.SpecCommand) {
	tst.moduleLoad(cmd.Filename)
	if tst.Error != nil {
		fmt.Printf("Error loading %s: %v\n", cmd.Filename, tst.Error)
		tst.m = nil
		return
	}

	if cmd.Name != "" {
		tst.m.ImportName = cmd.Name
	}
}

func (tst *WasmTester) specRegister(cmd *spec.SpecCommand) {
	tst.moduleLink()
	if tst.Error != nil {
		fmt.Printf("Module link error: %v\n", tst.Error)
		return
	}
	if cmd.Name == "" {
		tst.m.ImportName = cmd.Alias
		Modules[cmd.Alias] = tst.m
		return
	}

	mod, ok := Modules[cmd.Name]
	if !ok {
		fmt.Printf("Cannot register module %s as %s\n", cmd.Name, cmd.Alias)
		return
	}

	Modules[cmd.Alias] = mod
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

	Modules = make(map[string]*sections.Module)
	tst.createSpecTestModule()

	fmt.Printf("Source: %s\n", tst.source.Filename)
	for _, cmd := range tst.source.Commands {
		switch cmd.CommandType {
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
			panic("Unknown command: " + cmd.CommandType)
		}
	}
	fmt.Printf("%d tests executed, %d failed.\n", tst.nrOfTests, tst.nrFailed)
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

	err = json.NewDecoder(file).Decode(&tst.testFolder)
	if err != nil {
		panic(err)
	}

	// set default uses
	if tst.testFolder.Uses == nil {
		tst.testFolder.Uses = make(map[string]*test.TestValue)
	}
	for name, use := range uses {
		testValue := test.NewValueTest()
		testValue.Use = use
		tst.testFolder.Uses[name] = testValue
	}

	for _, use := range tst.testFolder.Uses {
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

	for _, mod := range tst.testFolder.Modules {
		tst.testMod = mod
		err = tst.testModule()
		if err != nil {
			fmt.Printf("%s: %v\n", mod.File, err)
		}
	}
	fmt.Printf("%d tests executed, %d failed.\n", tst.nrOfTests, tst.nrFailed)
	TotalNrOfTests += tst.nrOfTests
	TotalNrFailed += tst.nrFailed
	tst.nrOfTests = 0
	tst.nrFailed = 0
}

func (tst *WasmTester) testFunction() {
	tst.function = nil
	for _, export := range tst.m.Exports {
		if export.ExternalType == desc.FUNC && export.ImportName == tst.testFunc.Name {
			tst.function = tst.m.Functions[export.Index]
			break
		}
	}
	if tst.function == nil {
		fmt.Printf("Error: %s missing function export for: %s\n", tst.testMod.File, tst.testFunc.Name)
		return
	}

	// allocate a (reusable) stack frame for this function
	// all tests on this function will reuse this same stack frame
	tst.vm = context.NewRunner(tst.m, nil)
	tst.vm.Frame = make([]sections.Variable, tst.function.MaxLocalIndex()+tst.function.FrameSize)
	for _, run := range tst.testFunc.Tests {
		tst.test = run
		tst.testRun()
	}
}

func (tst *WasmTester) testModule() error {
	fmt.Printf("Module %s\n", tst.testMod.File)
	tst.modulePath = tst.path[:len(tst.path)-len("tests.json")]
	tst.moduleLoad(tst.testMod.File)
	if tst.Error != nil {
		return tst.Error
	}
	tst.moduleLink()
	if tst.Error != nil {
		return tst.Error
	}
	for _, fun := range tst.testMod.Funcs {
		tst.testFunc = fun
		tst.testFunction()
	}
	return nil
}

func (tst *WasmTester) testRun() {
	if len(tst.test.In) != len(tst.function.FuncType.ParamTypes) {
		fmt.Printf("%s %s(): param length mismatch\n", tst.testMod.File, tst.testFunc.Name)
		return
	}

	// copy function call parameters to reusable stack frame
	for i, paramType := range tst.function.FuncType.ParamTypes {
		testValue := tst.getTestValue(tst.test.In[i], paramType)
		if testValue == nil {
			return
		}
		tst.vm.Frame[i].Copy(&testValue.Variable, paramType)
	}

	// reset the local variables to zero in case they were used
	offset := len(tst.function.FuncType.ParamTypes)
	for i, local := range tst.function.Locals {
		tst.vm.Frame[offset+i].Copy(&zero, local.DataType)
	}

	tst.nrOfTests++
	tst.vm.Module = tst.function.Module
	tst.Error = instructions.RunBlock(tst.vm, tst.function.Body)
	tst.verifyError(tst.test.Err, "")
	if tst.Error != nil || tst.test.Err != "" {
		return
	}

	for i, resultType := range tst.function.FuncType.ResultTypes {
		out := tst.getTestValue(tst.test.Out[i], resultType)
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

func (tst *WasmTester) verifyError(errorText string, action string) {
	if len(errorText) == 0 {
		if action != "" {
			tst.nrFailed++
			fmt.Printf("Missing expected error text for: %s\n", action)
		}
		if tst.Error != nil {
			tst.nrFailed++
			fmt.Printf("Unexpected error: '%s', expected no error\n", tst.Error)
		}
		return
	}

	if tst.Error == nil {
		tst.nrFailed++
		fmt.Printf("Expected error: %s\n", errorText)
		return
	}

	if !strings.Contains(tst.Error.Error(), errorText) {
		// this particular error was unexpected
		tst.nrFailed++
		fmt.Printf("Unexpected error: '%s', expected '%s'\n", tst.Error, errorText)
	}
}
