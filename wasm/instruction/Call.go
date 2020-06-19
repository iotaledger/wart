package instruction

import (
	"fmt"
	"github.com/iotaledger/wart/utils"
	"github.com/iotaledger/wart/wasm/consts/op"
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
			a.Error = o.fail("Invalid function index")
			return
		}
		f := a.Module.Internal.Functions[o.index]
		o.analyzeCallType(a, f.Type.Nr)
	case op.CALL_INDIRECT:
		o.analyzeCallType(a, o.index)
	case op.MEMORY_GROW, op.MEMORY_SIZE:
	default:
		panic("Invalid call opcode")
	}
}

func (o *Call) analyzeCallType(a *context.Analyzer, funcType uint32) {
	if funcType >= a.Module.MaxFuncTypes() {
		a.Error = o.fail("Invalid function type index")
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
	o.index = r.GetU32()
	if r.Error != nil {
		return
	}
	switch o.opcode {
	case op.CALL:
		if /* o.index < 0 || */ o.index >= r.Module.MaxFunctions() {
			r.Error = utils.Error("unknown function")
			return
		}
	case op.CALL_INDIRECT:
		tableIndex := r.GetByte()
		if r.Error != nil {
			return
		}
		if tableIndex != 0 {
			r.Error = o.fail("Expected table index 0")
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
	f := vm.Module.Internal.Functions[o.index]
	o.runCallDirect(vm, f)
}

func (o *Call) runCallDirect(vm *Runner, f *wasm.Function) {
	if vm.CallDepth == 1000 {
		vm.CallDepth = 0
		vm.Error = StackOverflow
		return
	}

	savedFrame := vm.Frame
	savedNext := vm.Next

	// set up new stack frame with copy of params
	// plus enough space for locals + stack frame
	funcType := f.Type
	callFrame := make([]wasm.Variable, f.MaxLocalIndex()+f.FrameSize)
	for i, vt := range funcType.ParamTypes {
		callFrame[i].Copy(&savedFrame[o.SP+i], vt)
	}

	vm.CallDepth++
	vm.Frame = callFrame
	vm.Error = RunBlock(vm, f.Body)
	if vm.Error != nil {
		return
	}
	vm.Frame = savedFrame
	vm.Next = savedNext
	vm.CallDepth--

	// copy function results over from called frame
	// return instruction should have set vm.SP correctly
	// to point to results in frame
	for i, vt := range funcType.ResultTypes {
		savedFrame[o.SP+i].Copy(&callFrame[vm.SP+i], vt)
	}
}

func (o *Call) runCallIndirect(vm *Runner) {
	//todo dynamic type check on call argument
	// see if vm.Module.Internal.FuncIndexes[vm.Module.Elements[arg]].Type == o.index
	ft := vm.Module.FuncTypes[o.index]
	funcIndex := uint32(vm.Frame[o.SP+len(ft.ParamTypes)].I32)
	functions := vm.Module.Internal.Tables[0].Functions
	if /* funcIndex < 0 || */ funcIndex >= uint32(len(functions)) {
		vm.Error = UndefinedElement
		return
	}
	f := functions[funcIndex]
	if f == nil {
		vm.Error = UninitializedElement
		return
	}
	if !f.Type.IsSameAs(ft) {
		vm.Error = FunctionSignature
		return
	}
	o.runCallDirect(vm, f)
}

func (o *Call) runMemoryGrow(vm *Runner) {
	oldPages := int32(len(vm.Memory.Pool)) / context.PAGE_SIZE
	top := &vm.Frame[o.SP]
	growPages := top.I32
	if growPages < 0 {
		fmt.Printf("  Warning: %v: cannot grow %d pages\n", o, growPages)
		top.I32 = oldPages
		return
	}
	newPages := oldPages + growPages
	if newPages < oldPages || newPages > int32(vm.MaxPages) {
		fmt.Printf("  Warning: %v: cannot grow %d pages\n", o, growPages)
		top.I32 = -1
		return
	}
	vm.Memory.Pool = append(vm.Memory.Pool, make([]byte, int(newPages)*context.PAGE_SIZE-len(vm.Memory.Pool))...)
	top.I32 = oldPages
}

func (o *Call) runMemorySize(vm *Runner) {
	top := &vm.Frame[o.SP]
	top.I32 = int32(len(vm.Memory.Pool)) / context.PAGE_SIZE
}

func (o *Call) StackChange(m *wasm.Module) int {
	switch o.opcode {
	case op.CALL:
		funcType := m.Internal.Functions[o.index].Type
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
