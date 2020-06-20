package executor

import (
	"errors"
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executor/context"
	"github.com/iotaledger/wart/wasm/instruction"
	"github.com/iotaledger/wart/wasm/wasm"
)

var Modules = make(map[string]*context.Runner)

type WasmLinker struct {
	m  *wasm.Module
	vm *context.Runner
}

func NewWasmLinker(m *wasm.Module) *WasmLinker {
	lnk := &WasmLinker{m: m, vm: context.NewRunner(m)}
	if m.ImportName != "" {
		Modules[m.ImportName] = lnk.vm
	}
	return lnk
}

func (lnk *WasmLinker) initExprValue(val *wasm.Variable, expr []wasm.Instruction, vt value.Type) {
	if len(expr) == 0 {
		return
	}
	init := expr[0]
	switch init.Opcode() {
	case op.I32_CONST, op.I64_CONST, op.F32_CONST, op.F64_CONST:
		val.Copy(&init.(*instruction.Const).Value, vt)
	case op.GLOBAL_GET:
		imported := lnk.vm.Module.GlobalVars[init.(*instruction.Var).Index]
		val.Copy(imported, vt)
	default:
		panic("non-constant initializer expression")
	}
}

func (lnk *WasmLinker) Link() error {
	lnk.vm.Module.GlobalVars = make([]*wasm.Variable, lnk.m.MaxGlobals())

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

	return lnk.runStartFunction()
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

func (lnk *WasmLinker) initGlobals() error {
	for i := lnk.m.ExternalGlobals; i < lnk.m.MaxGlobals(); i++ {
		global := lnk.m.Globals[i]
		globalValue := &wasm.Variable{}
		lnk.vm.Module.GlobalVars[i] = globalValue
		lnk.initExprValue(globalValue, global.Init, global.Type)
	}
	return nil
}

func (lnk *WasmLinker) initMemories() error {
	for _, memory := range lnk.m.Memories {
		if memory.Nr != 0 {
			return errors.New("Multiple memories not yet supported")
		}
		if len(memory.Pool) == 0 {
			memory.Pool = make([]byte, memory.Min*context.PAGE_SIZE)
		}
	}
	return nil
}

func (lnk *WasmLinker) initMemoryData(update bool) error {
	addrValue := &wasm.Variable{}
	for _, data := range lnk.m.Datas {
		memory := lnk.m.Memories[data.MemoryIndex]
		lnk.initExprValue(addrValue, data.Offset, value.I32)
		addr := uint32(addrValue.I32)
		end := addr + uint32(len(data.Bytes))
		//  be careful not to wrap around the uint32
		if end < addr || end > uint32(len(memory.Pool)) {
			return errors.New("data segment does not fit")
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
			return errors.New("Multiple memories not yet supported")
		}
		if len(table.FuncIndexes) == 0 {
			table.FuncIndexes = make([]uint32, table.Min)
			table.FuncModules = make([]*wasm.Module, table.Min)
		}
	}
	return nil
}

func (lnk *WasmLinker) initTableElements(update bool) error {
	offsetValue := &wasm.Variable{}
	for _, element := range lnk.m.Elements {
		table := lnk.m.Tables[element.TableIndex]
		lnk.initExprValue(offsetValue, element.Offset, value.I32)
		start := offsetValue.I32
		if start < 0 || uint32(start)+uint32(len(element.FuncIndexes)) > table.Min {
			return errors.New("elements segment does not fit")
		}
		for _, funcIndex := range element.FuncIndexes {
			if /* funcIndex < 0 || */ funcIndex > lnk.m.MaxFunctions() {
				return errors.New("Invalid function index")
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

func (lnk *WasmLinker) linkImportFunctions() error {
	for i := uint32(0); i < lnk.m.ExternalFunctions; i++ {
		function := lnk.m.Functions[i]
		ctx, ok := Modules[function.ModuleName]
		if !ok {
			return errors.New("unknown import")
		}
		for _, export := range ctx.Module.Exports {
			if export.ImportName == function.ImportName {
				if export.Type != desc.FUNC {
					return errors.New("incompatible import type")
				}
				imported := ctx.Module.Functions[export.Index]
				if !function.Type.IsSameAs(imported.Type) {
					return errors.New("incompatible import type")
				}
				lnk.m.Functions[i] = imported
				break
			}
		}
		if function == lnk.m.Functions[i] {
			return errors.New("unknown import")
		}
	}
	return nil
}

func (lnk *WasmLinker) linkImportGlobals() error {
	for i := uint32(0); i < lnk.m.ExternalGlobals; i++ {
		global := lnk.m.Globals[i]
		ctx, ok := Modules[global.ModuleName]
		if !ok {
			return errors.New("unknown import")
		}
		for _, export := range ctx.Module.Exports {
			if export.ImportName == global.ImportName {
				if export.Type != desc.GLOBAL {
					return errors.New("incompatible import type")
				}
				imported := ctx.Module.Globals[export.Index]
				if global.Type != imported.Type || global.Mutable != imported.Mutable {
					return errors.New("incompatible import type")
				}
				lnk.m.Globals[i] = imported
				lnk.m.GlobalVars[i] = ctx.Module.GlobalVars[export.Index]
				break
			}
		}
		if global == lnk.m.Globals[i] {
			return errors.New("unknown import")
		}
	}
	return nil
}

func (lnk *WasmLinker) linkImportMemories() error {
	for i := uint32(0); i < lnk.m.ExternalMemories; i++ {
		memory := lnk.m.Memories[i]
		ctx, ok := Modules[memory.ModuleName]
		if !ok {
			return errors.New("unknown import")
		}
		for _, export := range ctx.Module.Exports {
			if export.ImportName == memory.ImportName {
				if export.Type != desc.MEM {
					return errors.New("incompatible import type")
				}
				imported := ctx.Module.Memories[export.Index]
				if lnk.incompatibleOverlap(memory.Min, memory.Max, imported.Min, imported.Max) {
					return errors.New("incompatible import type")
				}
				lnk.m.Memories[i] = imported
				break
			}
		}
		if memory == lnk.m.Memories[i] {
			return errors.New("unknown import")
		}
	}
	return nil
}

func (lnk *WasmLinker) linkImportTables() error {
	for i := uint32(0); i < lnk.m.ExternalTables; i++ {
		table := lnk.m.Tables[i]
		ctx, ok := Modules[table.ModuleName]
		if !ok {
			return errors.New("unknown import")
		}
		for _, export := range ctx.Module.Exports {
			if export.ImportName == table.ImportName {
				if export.Type != desc.TABLE {
					return errors.New("incompatible import type")
				}
				imported := ctx.Module.Tables[export.Index]
				if lnk.incompatibleOverlap(table.Min, table.Max, imported.Min, imported.Max) {
					return errors.New("incompatible import type")
				}
				lnk.m.Tables[i] = imported
				break
			}
		}
		if table == lnk.m.Tables[i] {
			return errors.New("unknown import")
		}
	}
	return nil
}

func (lnk *WasmLinker) runStartFunction() error {
	if lnk.m.Start == value.UNDEFINED {
		return nil
	}
	startFunction := lnk.m.Functions[lnk.m.Start]
	lnk.vm.Frame = make([]wasm.Variable, startFunction.MaxLocalIndex()+startFunction.FrameSize)
	saved := lnk.vm.Module
	lnk.vm.Module = startFunction.Module
	err := instruction.RunBlock(lnk.vm, startFunction.Body)
	lnk.vm.Module = saved
	return err
}
