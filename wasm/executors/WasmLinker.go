package executors

import (
	"strings"

	"github.com/iotaledger/wart/utils"
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors/context"
	"github.com/iotaledger/wart/wasm/instructions"
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"github.com/iotaledger/wart/wasm/sections"
)

type WasmLinker struct {
	m *sections.Module
}

var Modules = make(map[string]*sections.Module)

func NewWasmLinker(m *sections.Module) *WasmLinker {
	lnk := &WasmLinker{m: m}
	if m.ImportName != "" {
		Modules[m.ImportName] = m
	}
	return lnk
}

func DefineModule(module string) *sections.Module {
	mod, ok := Modules[module]
	if !ok {
		mod = sections.NewModule()
		mod.ModuleName = module
		Modules[module] = mod
	}
	return mod
}

func (lnk *WasmLinker) DefineFunction(name string, params []value.DataType, results []value.DataType, f sections.HostCall) *sections.Function {
	mod := lnk.m
	for _, export := range mod.Exports {
		if export.ImportName == name {
			if export.ExternalType != desc.FUNC {
				panic("export is not a function")
			}
			function := mod.Functions[export.Index]
			function.HostCall = f
			return function
		}
	}

	funcType := sections.NewFuncType()
	funcType.ParamTypes = params
	funcType.ResultTypes = results
	funcType.Nr = mod.MaxFuncTypes()
	mod.FuncTypes = append(mod.FuncTypes, funcType)
	function := sections.NewFunction()
	function.FuncType = funcType
	function.Body = []helper.Instruction{instructions.CreateInstruction(op.END)}
	function.HostCall = f
	function.Nr = mod.MaxFunctions()
	mod.Functions = append(mod.Functions, function)
	export := sections.NewExport()
	export.Index = function.Nr
	export.ExternalType = desc.FUNC
	export.ImportName = name
	export.Nr = mod.MaxExports()
	mod.Exports = append(mod.Exports, export)
	return function
}

var globals = []byte{
	op.I32_CONST, op.I64_CONST, op.F32_CONST, op.F64_CONST,
}

func (lnk *WasmLinker) DefineGlobal(name string, dataType value.DataType, init *sections.Variable) *sections.Global {
	mod := lnk.m
	for _, export := range mod.Exports {
		if export.ImportName == name {
			if export.ExternalType != desc.GLOBAL {
				panic("export is not a global")
			}
			global := mod.Globals[export.Index]
			global.DataType = dataType
			return global
		}
	}

	global := sections.NewGlobal()
	global.DataType = dataType
	global.Init = make([]helper.Instruction, 2)
	global.Init[0] = instructions.CreateInstruction(globals[value.I32-dataType])
	global.Init[1] = instructions.CreateInstruction(op.END)
	if init != nil {
		global.Init[0].(*instructions.Const).Value = *init
	}
	global.Nr = mod.MaxGlobals()
	mod.Globals = append(mod.Globals, global)
	export := sections.NewExport()
	export.Index = global.Nr
	export.ExternalType = desc.GLOBAL
	export.ImportName = name
	export.Nr = mod.MaxExports()
	mod.Exports = append(mod.Exports, export)
	return global
}

func (lnk *WasmLinker) DefineMemory(name string, min uint32, max uint32) *sections.Memory {
	mod := lnk.m
	for _, export := range mod.Exports {
		if export.ImportName == name {
			if export.ExternalType != desc.MEM {
				panic("export is not a memory")
			}
			memory := mod.Memories[export.Index]
			memory.Min = min
			memory.Max = max
			return memory
		}
	}

	memory := sections.NewMemory()
	memory.Min = min
	memory.Max = max
	memory.Nr = mod.MaxMemories()
	mod.Memories = append(mod.Memories, memory)
	export := sections.NewExport()
	export.Index = memory.Nr
	export.ExternalType = desc.MEM
	export.ImportName = name
	export.Nr = mod.MaxExports()
	mod.Exports = append(mod.Exports, export)
	return memory
}

func (lnk *WasmLinker) DefineTable(name string, min uint32, max uint32) *sections.Table {
	mod := lnk.m
	for _, export := range mod.Exports {
		if export.ImportName == name {
			if export.ExternalType != desc.TABLE {
				panic("export is not a table")
			}
			table := mod.Tables[export.Index]
			table.Min = min
			table.Max = max
			return table
		}
	}

	table := sections.NewTable()
	table.Min = min
	table.Max = max
	table.Nr = mod.MaxTables()
	mod.Tables = append(mod.Tables, table)
	export := sections.NewExport()
	export.Index = table.Nr
	export.ExternalType = desc.TABLE
	export.ImportName = name
	export.Nr = mod.MaxExports()
	mod.Exports = append(mod.Exports, export)
	return table
}

func (lnk *WasmLinker) incompatibleOverlap(min uint32, max uint32, impMin uint32, impMax uint32) bool {
	if max == value.UNDEFINED {
		max = 0x10000
	}
	if impMax == value.UNDEFINED {
		impMax = 0x10000
	}
	return min > impMin || max < impMax
}

func (lnk *WasmLinker) initExprValue(val *sections.Variable, expr []helper.Instruction, dataType value.DataType) {
	if len(expr) == 0 {
		return
	}
	init := expr[0]
	switch init.Opcode() {
	case op.I32_CONST, op.I64_CONST, op.F32_CONST, op.F64_CONST:
		val.Copy(&init.(*instructions.Const).Value, dataType)
	case op.GLOBAL_GET:
		imported := lnk.m.GlobalVars[init.(*instructions.Var).Index]
		val.Copy(imported, dataType)
	default:
		panic("non-constant initializer expression")
	}
}

func (lnk *WasmLinker) initGlobals() error {
	for i := lnk.m.ExternalGlobals; i < lnk.m.MaxGlobals(); i++ {
		global := lnk.m.Globals[i]
		globalValue := &sections.Variable{}
		lnk.m.GlobalVars[i] = globalValue
		lnk.initExprValue(globalValue, global.Init, global.DataType)
	}
	return nil
}

func (lnk *WasmLinker) initMemories() error {
	for _, memory := range lnk.m.Memories {
		if memory.Nr != 0 {
			return utils.Error("Multiple memories not yet supported")
		}
		if len(memory.Pool) == 0 {
			memory.Pool = make([]byte, memory.Min*context.PAGE_SIZE)
		}
	}
	return nil
}

func (lnk *WasmLinker) initMemoryData(update bool) error {
	addrValue := &sections.Variable{}
	for _, data := range lnk.m.Datas {
		memory := lnk.m.Memories[data.MemoryIndex]
		lnk.initExprValue(addrValue, data.Offset, value.I32)
		addr := uint32(addrValue.I32)
		end := addr + uint32(len(data.Bytes))
		//  be careful not to wrap around the uint32
		if end < addr || end > uint32(len(memory.Pool)) {
			return utils.Error("data segment does not fit")
		}
		if update {
			copy(memory.Pool[addr:], data.Bytes)
		}
	}
	return nil
}

func (lnk *WasmLinker) initTables() error {
	for _, table := range lnk.m.Tables {
		if table.Nr != 0 {
			return utils.Error("Multiple memories not yet supported")
		}
		if len(table.FuncIndexes) == 0 {
			table.FuncIndexes = make([]uint32, table.Min)
			table.FuncModules = make([]*sections.Module, table.Min)
		}
	}
	return nil
}

func (lnk *WasmLinker) initTableElements(update bool) error {
	offsetValue := &sections.Variable{}
	for _, element := range lnk.m.Elements {
		table := lnk.m.Tables[element.TableIndex]
		lnk.initExprValue(offsetValue, element.Offset, value.I32)
		start := offsetValue.I32
		if start < 0 || uint32(start)+uint32(len(element.FuncIndexes)) > table.Min {
			return utils.Error("elements segment does not fit")
		}
		for _, funcIndex := range element.FuncIndexes {
			if /* funcIndex < 0 || */ funcIndex > lnk.m.MaxFunctions() {
				return utils.Error("Invalid function index")
			}
			if update {
				table.FuncIndexes[start] = funcIndex
				table.FuncModules[start] = lnk.m
			}
			start++
		}
	}
	return nil
}

func (lnk *WasmLinker) Link() error {
	if lnk.m.IsLinked {
		return nil
	}
	lnk.m.GlobalVars = make([]*sections.Variable, lnk.m.MaxGlobals())

	err := lnk.linkImportFunctions()
	if err != nil {
		return err
	}
	err = lnk.linkImportGlobals()
	if err != nil {
		return err
	}
	err = lnk.linkImportMemories()
	if err != nil {
		return err
	}
	err = lnk.linkImportTables()
	if err != nil {
		return err
	}

	err = lnk.initGlobals()
	if err != nil {
		return err
	}
	err = lnk.initMemories()
	if err != nil {
		return err
	}
	err = lnk.initTables()
	if err != nil {
		return err
	}

	// first do a dry run without updating anything to weed out any
	// errors without leaving other modules in a half-baked state
	err = lnk.initMemoryData(false)
	if err != nil {
		return err
	}
	err = lnk.initTableElements(false)
	if err != nil {
		return err
	}

	// no errors, now do the updates for real
	err = lnk.initMemoryData(true)
	if err != nil {
		return err
	}
	err = lnk.initTableElements(true)
	if err != nil {
		return err
	}

	err = lnk.runStartFunction()
	if err != nil {
		return err
	}
	lnk.m.IsLinked = true
	return nil
}

func (lnk *WasmLinker) linkImportFunctions() error {
	for i := uint32(0); i < lnk.m.ExternalFunctions; i++ {
		function := lnk.m.Functions[i]
		mod, ok := Modules[function.ModuleName]
		if !ok {
			return utils.Error("unknown import")
		}
		importName := function.ImportName
		dot := strings.LastIndex(importName, ".")
		if dot >= 0 {
			importName = importName[dot+1:]
		}
		for _, export := range mod.Exports {
			if export.ImportName == importName {
				if export.ExternalType != desc.FUNC {
					return utils.Error("incompatible import type")
				}
				imported := mod.Functions[export.Index]
				if !function.FuncType.IsSameAs(imported.FuncType) {
					return utils.Error("incompatible import type")
				}
				lnk.m.Functions[i] = imported
				break
			}
		}
		if function == lnk.m.Functions[i] {
			return utils.Error("unknown import")
		}
	}
	return nil
}

func (lnk *WasmLinker) linkImportGlobals() error {
	for i := uint32(0); i < lnk.m.ExternalGlobals; i++ {
		global := lnk.m.Globals[i]
		mod, ok := Modules[global.ModuleName]
		if !ok {
			return utils.Error("unknown import")
		}
		for _, export := range mod.Exports {
			if export.ImportName == global.ImportName {
				if export.ExternalType != desc.GLOBAL {
					return utils.Error("incompatible import type")
				}
				imported := mod.Globals[export.Index]
				if global.DataType != imported.DataType || global.Mutable != imported.Mutable {
					return utils.Error("incompatible import type")
				}
				lnk.m.Globals[i] = imported
				lnk.m.GlobalVars[i] = mod.GlobalVars[export.Index]
				break
			}
		}
		if global == lnk.m.Globals[i] {
			return utils.Error("unknown import")
		}
	}
	return nil
}

func (lnk *WasmLinker) linkImportMemories() error {
	for i := uint32(0); i < lnk.m.ExternalMemories; i++ {
		memory := lnk.m.Memories[i]
		mod, ok := Modules[memory.ModuleName]
		if !ok {
			return utils.Error("unknown import")
		}
		for _, export := range mod.Exports {
			if export.ImportName == memory.ImportName {
				if export.ExternalType != desc.MEM {
					return utils.Error("incompatible import type")
				}
				imported := mod.Memories[export.Index]
				if lnk.incompatibleOverlap(memory.Min, memory.Max, imported.Min, imported.Max) {
					return utils.Error("incompatible import type")
				}
				lnk.m.Memories[i] = imported
				break
			}
		}
		if memory == lnk.m.Memories[i] {
			return utils.Error("unknown import")
		}
	}
	return nil
}

func (lnk *WasmLinker) linkImportTables() error {
	for i := uint32(0); i < lnk.m.ExternalTables; i++ {
		table := lnk.m.Tables[i]
		mod, ok := Modules[table.ModuleName]
		if !ok {
			return utils.Error("unknown import")
		}
		for _, export := range mod.Exports {
			if export.ImportName == table.ImportName {
				if export.ExternalType != desc.TABLE {
					return utils.Error("incompatible import type")
				}
				imported := mod.Tables[export.Index]
				if lnk.incompatibleOverlap(table.Min, table.Max, imported.Min, imported.Max) {
					return utils.Error("incompatible import type")
				}
				lnk.m.Tables[i] = imported
				break
			}
		}
		if table == lnk.m.Tables[i] {
			return utils.Error("unknown import")
		}
	}
	return nil
}

func (lnk *WasmLinker) runStartFunction() error {
	if lnk.m.Start == value.UNDEFINED {
		return nil
	}
	startFunction := lnk.m.Functions[lnk.m.Start]
	vm := context.NewRunner(lnk.m)
	vm.Frame = make([]sections.Variable, startFunction.MaxLocalIndex()+startFunction.FrameSize)
	return instructions.RunBlock(vm, startFunction.Body)
}
