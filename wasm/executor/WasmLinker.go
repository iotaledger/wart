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
	if m.Name != "" {
		Modules[m.Name] = lnk.vm
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
		imported := &lnk.vm.Globals[init.(*instruction.Var).Index]
		val.Copy(imported, vt)
	default:
		panic("non-constant initializer expression")
	}
}

func (lnk *WasmLinker) Link() error {
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
	err = lnk.initMemory()
	if err != nil {
		return err
	}
	err = lnk.initMemoryData()
	if err != nil {
		return err
	}
	err = lnk.initTable()
	if err != nil {
		return err
	}
	err = lnk.initTableElements()
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
	lnk.vm.Globals = make([]wasm.Variable, lnk.m.MaxGlobals())
	for i, global := range lnk.m.Internal.Globals {
		globalValue := &lnk.vm.Globals[i]
		lnk.initExprValue(globalValue, global.Init, global.Type)
	}
	return nil
}

func (lnk *WasmLinker) initMemory() error {
	for _, memory := range lnk.m.Internal.Memories {
		if memory.Nr != 0 {
			return errors.New("Multiple memories not yet supported")
		}
		lnk.vm.Memory = memory
		if len(memory.Pool) == 0 {
			memory.Pool = make([]byte, memory.Min*context.PAGE_SIZE)
		}
	}
	return nil
}

func (lnk *WasmLinker) initMemoryData() error {
	addrValue := &wasm.Variable{}
	for _, data := range lnk.m.Datas {
		lnk.initExprValue(addrValue, data.Offset, value.I32)
		addr := uint32(addrValue.I32)
		end := addr + uint32(len(data.Bytes))
		//  be careful not to wrap around the uint32
		if end < addr || end > uint32(len(lnk.vm.Memory.Pool)) {
			return errors.New("data segment does not fit")
		}
		copy(lnk.vm.Memory.Pool[addr:], data.Bytes)
	}
	return nil
}

func (lnk *WasmLinker) initTable() error {
	for _, table := range lnk.m.Internal.Tables {
		if table.Nr != 0 {
			return errors.New("Multiple memories not yet supported")
		}
		lnk.vm.Table = table
		if len(table.FuncIndexes) == 0 {
			table.FuncIndexes = make([]uint32, table.Min)
			for i := range table.FuncIndexes {
				table.FuncIndexes[i] = value.UNDEFINED
			}
		}
	}
	return nil
}

func (lnk *WasmLinker) initTableElements() error {
	offsetValue := &wasm.Variable{}
	for _, element := range lnk.m.Elements {
		table := lnk.m.Internal.Tables[element.TableIndex]
		lnk.initExprValue(offsetValue, element.Offset, value.I32)
		start := offsetValue.I32
		if start < 0 || uint32(start)+uint32(len(element.FuncIndexes)) > table.Min {
			return errors.New("elements segment does not fit")
		}
		for _, funcIndex := range element.FuncIndexes {
			if /* funcIndex < 0 || */ funcIndex > uint32(len(lnk.m.Internal.Functions)) {
				return errors.New("Invalid function index")
			}
			table.FuncIndexes[start] = funcIndex
			start++
		}
	}
	return nil
}

func (lnk *WasmLinker) linkImportFunctions() error {
	for i, function := range lnk.m.External.Functions {
		if function.Module == "" {
			continue
		}
		ctx, ok := Modules[function.Module]
		if !ok {
			return errors.New("unknown import")
		}
		for _, export := range ctx.Module.Exports {
			if export.Name == function.Name {
				if export.Type != desc.FUNC {
					return errors.New("incompatible import type")
				}
				imported := ctx.Module.Internal.Functions[export.Index]
				if !function.Type.IsSameAs(imported.Type) {
					return errors.New("incompatible import type")
				}
				lnk.m.External.Functions[i] = imported
				lnk.m.Internal.Functions[i] = imported
				break
			}
		}
		if function == lnk.m.External.Functions[i] {
			return errors.New("unknown import")
		}
	}
	return nil
}

func (lnk *WasmLinker) linkImportGlobals() error {
	for i, global := range lnk.m.External.Globals {
		if global.Module == "" {
			continue
		}
		ctx, ok := Modules[global.Module]
		if !ok {
			return errors.New("unknown import")
		}
		for _, export := range ctx.Module.Exports {
			if export.Name == global.Name {
				if export.Type != desc.GLOBAL {
					return errors.New("incompatible import type")
				}
				imported := ctx.Module.Internal.Globals[export.Index]
				if global.Type != imported.Type {
					return errors.New("incompatible import type")
				}
				lnk.m.External.Globals[i] = imported
				lnk.m.Internal.Globals[i] = imported
				break
			}
		}
		if global == lnk.m.External.Globals[i] {
			return errors.New("unknown import")
		}
	}
	return nil
}

func (lnk *WasmLinker) linkImportMemories() error {
	for i, memory := range lnk.m.External.Memories {
		if memory.Module == "" {
			continue
		}
		ctx, ok := Modules[memory.Module]
		if !ok {
			return errors.New("unknown import")
		}
		for _, export := range ctx.Module.Exports {
			if export.Name == memory.Name {
				if export.Type != desc.MEM {
					return errors.New("incompatible import type")
				}
				imported := ctx.Module.Internal.Memories[export.Index]
				if lnk.incompatibleOverlap(memory.Min, memory.Max, imported.Min, imported.Max) {
					return errors.New("incompatible import type")
				}
				lnk.m.External.Memories[i] = imported
				lnk.m.Internal.Memories[i] = imported
				break
			}
		}
		if memory == lnk.m.External.Memories[i] {
			return errors.New("unknown import")
		}
	}
	return nil
}

func (lnk *WasmLinker) linkImportTables() error {
	for i, table := range lnk.m.External.Tables {
		if table.Module == "" {
			continue
		}
		ctx, ok := Modules[table.Module]
		if !ok {
			return errors.New("unknown import")
		}
		for _, export := range ctx.Module.Exports {
			if export.Name == table.Name {
				if export.Type != desc.TABLE {
					return errors.New("incompatible import type")
				}
				imported := ctx.Module.Internal.Tables[export.Index]
				if lnk.incompatibleOverlap(table.Min, table.Max, imported.Min, imported.Max) {
					return errors.New("incompatible import type")
				}
				lnk.m.External.Tables[i] = imported
				lnk.m.Internal.Tables[i] = imported
				break
			}
		}
		if table == lnk.m.External.Tables[i] {
			return errors.New("unknown import")
		}
	}
	return nil
}

func (lnk *WasmLinker) runStartFunction() error {
	if lnk.m.Start == value.UNDEFINED {
		return nil
	}
	startFunction := lnk.m.Internal.Functions[lnk.m.Start]
	lnk.vm.Frame = make([]wasm.Variable, startFunction.MaxLocalIndex()+startFunction.FrameSize)
	return instruction.RunBlock(lnk.vm, startFunction.Body)
}
