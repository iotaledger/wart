package instructions

import (
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors/context"
	"github.com/iotaledger/wart/wasm/instructions/helper"
)

type Misc struct {
	Base
}

func NewMisc() helper.Instruction {
	return &Misc{}
}

func (o *Misc) Analyze(a *context.Analyzer) {
	o.run = func(vm *Runner) {}
	switch o.opcode {
	//@formatter:off
	case op.NOP        :
	case op.ELSE       : o.analyzeElse       (a)
	case op.END        : o.analyzeEnd        (a)
	case op.DROP       : o.analyzeDrop       (a)
	case op.SELECT     : o.analyzeSelect     (a)
	case op.UNREACHABLE: o.analyzeUnreachable(a)
	//@formatter:on
	default:
		panic("Invalid misc opcode")
	}
}

func (o *Misc) analyzeDrop(a *context.Analyzer) {
	_ = a.Pop()
}

func (o *Misc) analyzeElse(a *context.Analyzer) {
	label := a.Labels[0]
	label.HasElse = true
	a.PopMulti(label.BlockType.ResultTypes)
	if a.Error != nil {
		return
	}
	if a.SP != a.BlockMark {
		a.Error = o.fail("type mismatch")
		return
	}
	if label.BlockInst.Opcode() != op.IF {
		a.Error = o.fail("No matching if instruction")
		return
	}
	label.Unreachable = false
	a.PushMulti(label.BlockType.ParamTypes)
	o.next = label.Target.(ctxInstruction)
}

func (o *Misc) analyzeEnd(a *context.Analyzer) {
	label := a.Labels[0]
	a.PopMulti(label.BlockType.ResultTypes)
	if a.Error != nil {
		return
	}
	if a.SP != a.BlockMark {
		a.Error = o.fail("type mismatch")
		return
	}
	// pop label from label stack
	a.Labels = a.Labels[1:]
	if len(a.Labels) != 0 {
		a.BlockMark = a.Labels[0].UnwindSP
	}
	if label.BlockInst != nil && label.BlockInst.Opcode() == op.IF && !label.HasElse {
		a.PushMulti(label.BlockType.ParamTypes)
	} else {
		a.PushMulti(label.BlockType.ResultTypes)
	}
	if label.Target == nil {
		resultSP := o.SP - len(label.BlockType.ResultTypes)
		o.run = func(vm *Runner) {
			vm.SP = resultSP
			vm.Next = nil
		}
	}
}

func (o *Misc) analyzeSelect(a *context.Analyzer) {
	rhs := a.PopExpected(value.NONE)
	if a.Error != nil {
		return
	}
	lhs := a.PopExpected(rhs)
	if a.Error != nil {
		return
	}
	if lhs != rhs {
		a.Error = o.fail("Invalid lhs operand type")
		return
	}
	o.SP = a.SP
	a.Push(lhs)
	switch lhs {
	//@formatter:off
	case value.I32: o.run = func(vm *Runner) { if vm.Frame[o.SP+2].I32 == 0 { vm.Frame[o.SP].I32 = vm.Frame[o.SP+1].I32 } }
	case value.I64: o.run = func(vm *Runner) { if vm.Frame[o.SP+2].I32 == 0 { vm.Frame[o.SP].I64 = vm.Frame[o.SP+1].I64 } }
	case value.F32: o.run = func(vm *Runner) { if vm.Frame[o.SP+2].I32 == 0 { vm.Frame[o.SP].F32 = vm.Frame[o.SP+1].F32 } }
	case value.F64: o.run = func(vm *Runner) { if vm.Frame[o.SP+2].I32 == 0 { vm.Frame[o.SP].F64 = vm.Frame[o.SP+1].F64 } }
	//@formatter:on
	}
}

func (o *Misc) analyzeUnreachable(a *context.Analyzer) {
	// unconditional panic jump, rest of block is unreachable
	a.Labels[0].Unreachable = true
	a.SP = a.BlockMark
	o.run = func(vm *Runner) { vm.Error = Unreachable }
}

func (o *Misc) StackChange() int {
	switch o.opcode {
	case op.DROP:
		return -1
	case op.SELECT:
		return -2
	}
	return o.Base.StackChange()
}
