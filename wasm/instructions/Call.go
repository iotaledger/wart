package instructions

import (
	"fmt"
	"github.com/iotaledger/wart/utils"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors/context"
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"github.com/iotaledger/wart/wasm/sections"
)

type Call struct {
	Base
	index       uint32
	stackChange int
}

func NewCall() helper.Instruction {
	return &Call{}
}

func (o *Call) Analyze(a *context.Analyzer) {
	switch o.opcode {
	case op.CALL:
		if /* o.Index < 0 || */ o.index >= a.Module.MaxFunctions() {
			a.Error = o.fail("unknown function")
			return
		}
		f := a.Module.Functions[o.index]
		o.analyzeCallType(a, f.FuncType.Nr)
	case op.CALL_INDIRECT:
		if a.Module.MaxTables() == 0 {
			a.Error = o.fail("unknown table")
			return
		}
		o.analyzeCallType(a, o.index)
	case op.MEMORY_GROW, op.MEMORY_SIZE:
		if a.Module.MaxMemories() == 0 {
			a.Error = o.fail("unknown memory")
			return
		}
	default:
		panic("Invalid call opcode")
	}
}

func (o *Call) analyzeCallType(a *context.Analyzer, typeIndex uint32) {
	if /* typeIndex < 0 || */ typeIndex >= a.Module.MaxFuncTypes() {
		a.Error = o.fail("unknown type")
		return
	}
	funcType := a.Module.FuncTypes[typeIndex]
	o.stackChange = len(funcType.ResultTypes) - len(funcType.ParamTypes)
	a.PopMulti(funcType.ParamTypes)
	if a.Error != nil {
		return
	}
	o.SP = a.SP
	a.PushMulti(funcType.ResultTypes)
}

func (o *Call) Index() uint32 {
	return o.index
}

func (o *Call) Read(r *context.Reader) {
	switch o.opcode {
	case op.CALL:
		o.index = r.GetU32()
		if r.Error != nil {
			return
		}
		if /* o.index < 0 || */ o.index >= r.Module.MaxFunctions() {
			r.Error = utils.Error("unknown function")
			return
		}
		funcType := r.Module.Functions[o.index].FuncType
		o.stackChange = len(funcType.ResultTypes) - len(funcType.ParamTypes)
	case op.CALL_INDIRECT:
		o.index = r.GetU32()
		if r.Error != nil {
			return
		}
		if /* o.index < 0 || */ o.index >= r.Module.MaxFuncTypes() {
			r.Error = utils.Error("unknown type")
			return
		}
		funcType := r.Module.FuncTypes[o.index]
		o.stackChange = len(funcType.ResultTypes) - len(funcType.ParamTypes)
		tableIndex := r.GetByte()
		if r.Error != nil {
			return
		}
		if tableIndex != 0 {
			r.Error = o.fail("zero flag expected")
			return
		}
	case op.MEMORY_GROW, op.MEMORY_SIZE:
		flag := r.GetByte()
		if r.Error != nil {
			return
		}
		if flag != 0x00 {
			r.Error = o.fail("zero flag expected")
			return
		}
	}
}

func (o *Call) Run(vm *Runner) {
	switch o.opcode {
	//@formatter:off
	case op.CALL         : o.runCall(vm)
	case op.CALL_INDIRECT: o.runCallIndirect(vm)
	case op.MEMORY_GROW  : o.runMemoryGrow(vm)
	case op.MEMORY_SIZE  : o.runMemorySize(vm)
	//@formatter:on
	default:
		panic("Invalid index opcode")
	}
}

func (o *Call) runCall(vm *Runner) {
	f := vm.Module.Functions[o.index]
	o.runCallDirect(vm, f)
}

func (o *Call) runCallDirect(vm *Runner, f *sections.Function) {
	if f.HostCall != nil {
		vm.Error = f.HostCall(&sections.HostContext{Frame: vm.Frame, Function: f, Module: vm.Module, SP: o.SP})
		return
	}

	if vm.CallDepth == 1000 {
		vm.CallDepth = 0
		vm.Error = utils.Error("call stack exhausted")
		return
	}

	savedModule := vm.Module
	savedFrame := vm.Frame
	savedNext := vm.Next

	// set up new stack frame with copy of params
	// plus enough space for locals + stack frame
	funcType := f.FuncType
	callFrame := make([]sections.Variable, f.MaxLocalIndex()+f.FrameSize)
	for i, paramType := range funcType.ParamTypes {
		callFrame[i].Copy(&savedFrame[o.SP+i], paramType)
	}

	vm.Module = f.Module
	vm.Frame = callFrame
	vm.CallDepth++
	vm.Error = RunBlock(vm, f.Body)
	if vm.Error != nil {
		return
	}
	vm.CallDepth--
	vm.Module = savedModule
	vm.Frame = savedFrame
	vm.Next = savedNext

	// copy function results over from called frame
	// return instruction should have set vm.SP correctly
	// to point to results in frame
	for i, resultType := range funcType.ResultTypes {
		savedFrame[o.SP+i].Copy(&callFrame[vm.SP+i], resultType)
	}
}

func (o *Call) runCallIndirect(vm *Runner) {
	//todo dynamic type check on call argument
	// see if vm.Module.FuncIndexes[vm.Module.Elements[arg]].DataType == o.index
	ft := vm.Module.FuncTypes[o.index]
	tableIndex := uint32(vm.Frame[o.SP+len(ft.ParamTypes)].I32)
	table := vm.Module.Tables[0]
	if /* tableIndex < 0 || */ tableIndex >= uint32(len(table.FuncModules)) {
		vm.Error = utils.Error("undefined element")
		return
	}
	funcModule := table.FuncModules[tableIndex]
	if funcModule == nil {
		vm.Error = utils.Error("uninitialized element")
		return
	}
	funcIndex := table.FuncIndexes[tableIndex]
	f := funcModule.Functions[funcIndex]
	if !f.FuncType.IsSameAs(ft) {
		vm.Error = utils.Error("indirect call type mismatch")
		return
	}
	o.runCallDirect(vm, f)
}

func (o *Call) runMemoryGrow(vm *Runner) {
	memory := vm.Module.Memories[0]
	oldPages := int32(len(memory.Pool)) / context.PAGE_SIZE
	top := &vm.Frame[o.SP]
	growPages := top.I32
	if growPages < 0 {
		top.I32 = oldPages
		return
	}
	newPages := oldPages + growPages
	maxPages := memory.Max
	if maxPages == value.UNDEFINED {
		maxPages = 0x8000
	}
	if newPages < oldPages || newPages > int32(maxPages) {
		top.I32 = -1
		return
	}
	memory.Pool = append(memory.Pool, make([]byte, int(newPages)*context.PAGE_SIZE-len(memory.Pool))...)
	top.I32 = oldPages
}

func (o *Call) runMemorySize(vm *Runner) {
	memory := vm.Module.Memories[0]
	top := &vm.Frame[o.SP]
	top.I32 = int32(len(memory.Pool)) / context.PAGE_SIZE
}

func (o *Call) StackChange() int {
	switch o.opcode {
	case op.CALL:
		return o.stackChange
	case op.CALL_INDIRECT:
		return o.stackChange - 1
	}
	return o.Base.StackChange()
}

func (o *Call) String() string {
	if o.opcode == op.CALL_INDIRECT {
		return fmt.Sprintf("%s (type %d)", o.Mnemonic(), o.index)
	}
	return fmt.Sprintf("%s %d", o.Mnemonic(), o.index)
}

func (o *Call) Write(w *context.Writer) {
	w.PutU32(o.index)
	if o.opcode == op.CALL_INDIRECT {
		w.PutByte(0)
	}
}
