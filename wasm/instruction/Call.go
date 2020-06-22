package instruction

import (
	"fmt"
	"github.com/iotaledger/wart/utils"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executor/context"
	"github.com/iotaledger/wart/wasm/wasm"
)

type Call struct {
	Base
	index uint32
}

func NewCall() wasm.Instruction {
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
		o.analyzeCallType(a, f.Type.Nr)
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

func (o *Call) analyzeCallType(a *context.Analyzer, funcType uint32) {
	if funcType >= a.Module.MaxFuncTypes() {
		a.Error = o.fail("unknown type")
		return
	}
	f := a.Module.FuncTypes[funcType]
	a.PopMulti(f.ParamTypes)
	if a.Error != nil {
		return
	}
	o.SP = a.SP
	a.PushMulti(f.ResultTypes)
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
	case op.CALL_INDIRECT:
		o.index = r.GetU32()
		if r.Error != nil {
			return
		}
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

func (o *Call) runCallDirect(vm *Runner, f *wasm.Function) {
	if vm.CallDepth == 1000 {
		vm.CallDepth = 0
		vm.Error = StackOverflow
		return
	}

	savedModule := vm.Module
	savedFrame := vm.Frame
	savedNext := vm.Next

	// set up new stack frame with copy of params
	// plus enough space for locals + stack frame
	funcType := f.Type
	callFrame := make([]wasm.Variable, f.MaxLocalIndex()+f.FrameSize)
	for i, vt := range funcType.ParamTypes {
		callFrame[i].Copy(&savedFrame[o.SP+i], vt)
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
	for i, vt := range funcType.ResultTypes {
		savedFrame[o.SP+i].Copy(&callFrame[vm.SP+i], vt)
	}
}

func (o *Call) runCallIndirect(vm *Runner) {
	//todo dynamic type check on call argument
	// see if vm.Module.FuncIndexes[vm.Module.Elements[arg]].Type == o.index
	ft := vm.Module.FuncTypes[o.index]
	tableIndex := uint32(vm.Frame[o.SP+len(ft.ParamTypes)].I32)
	table := vm.Module.Tables[0]
	if /* tableIndex < 0 || */ tableIndex >= uint32(len(table.FuncModules)) {
		vm.Error = UndefinedElement
		return
	}
	funcModule := table.FuncModules[tableIndex]
	if funcModule == nil {
		vm.Error = UninitializedElement
		return
	}
	funcIndex := table.FuncIndexes[tableIndex]
	f := funcModule.Functions[funcIndex]
	if !f.Type.IsSameAs(ft) {
		vm.Error = FunctionSignature
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

func (o *Call) StackChange(m *wasm.Module) int {
	switch o.opcode {
	case op.CALL:
		funcType := m.Functions[o.index].Type
		return len(funcType.ResultTypes) - len(funcType.ParamTypes)
	case op.CALL_INDIRECT:
		// todo filter out preceding i32.const
		return 0
	}
	return o.Base.StackChange(m)
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
