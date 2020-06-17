package instruction

import (
	"fmt"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executor/context"
	"github.com/iotaledger/wart/wasm/wasm"
)

type Branch struct {
	Base
	labelIndex uint32
	table      []uint32
}

func NewBranch() wasm.Instruction {
	return &Branch{}
}

func (o *Branch) Analyze(a *context.Analyzer) {
	switch o.opcode {
	//@formatter:off
	case op.BR      : o.analyzeBr(a)
	case op.BR_IF   : o.analyzeBrIf(a)
	case op.BR_TABLE: o.analyzeBrTable(a)
	case op.RETURN  : o.analyzeReturn(a)
	//@formatter:on
	default:
		panic("Invalid branch opcode")
	}
}

func (o *Branch) analyzeBr(a *context.Analyzer) {
	if /* o.labelIndex < 0 || */ o.labelIndex >= uint32(len(a.Labels)) {
		a.Error = o.fail("Invalid label index")
		return
	}
	targetLabel := a.Labels[o.labelIndex]
	valueTypes := targetLabel.BlockType.ResultTypes
	if targetLabel.BlockInst != nil && targetLabel.BlockInst.Opcode() == op.LOOP {
		valueTypes = targetLabel.BlockType.ParamTypes
	}
	a.PopMulti(valueTypes)
	if a.Error != nil {
		return
	}
	resultSP := a.SP
	currentLabel := a.Labels[0]
	if currentLabel.Unreachable {
		// unreachable, no need to set up a runner
		return
	}

	// unconditional jump, rest of block became unreachable
	currentLabel.Unreachable = true
	a.SP = a.BlockMark

	// now set up the runner for this branch instruction

	if targetLabel.Target == nil {
		// this is a return from function, no need to unwind
		// anything, just point to result when returning
		o.run = func(vm *Runner) { vm.SP = resultSP }
		o.next = nil
		return
	}
	o.next = targetLabel.Target.(ctxInstruction)

	if resultSP == targetLabel.UnwindSP {
		// nothing to move, nothing to do
		o.run = func(vm *Runner) {}
		return
	}

	if resultSP+1 == targetLabel.UnwindSP {
		// move single value, directly copy that single value
		o.unwindSingleValue(a, resultSP, targetLabel.UnwindSP)
		return
	}

	// slower copy loop, only done when moving multiple values
	dst := targetLabel.UnwindSP
	resultTypes := valueTypes
	o.run = func(vm *Runner) {
		for i := 0; i < len(resultTypes); i++ {
			vm.Frame[dst+i].Copy(&vm.Frame[resultSP+i], resultTypes[i])
		}
	}
}

func (o *Branch) analyzeBrIf(a *context.Analyzer) {
	if /* o.labelIndex < 0 || */ o.labelIndex >= uint32(len(a.Labels)) {
		a.Error = o.fail("Invalid label index")
		return
	}
	targetLabel := a.Labels[o.labelIndex]
	valueTypes := targetLabel.BlockType.ResultTypes
	if targetLabel.BlockInst != nil && targetLabel.BlockInst.Opcode() == op.LOOP {
		valueTypes = targetLabel.BlockType.ParamTypes
	}
	conditionSP := o.SP
	a.PopMulti(valueTypes)
	if a.Error != nil {
		return
	}
	resultSP := a.SP
	a.PushMulti(valueTypes)
	currentLabel := a.Labels[0]
	if currentLabel.Unreachable {
		// unreachable, no need to set up a runner
		return
	}

	// now set up the runner for this branch instruction

	nextInstruction := o.next
	if targetLabel.Target == nil {
		// this is a return from function, no need to unwind
		// anything, just point to result when returning
		o.run = func(vm *Runner) {
			if vm.Frame[conditionSP].I32 == 0 {
				// continue to next instruction instead of branching to label target
				vm.Next = nextInstruction
				return
			}
			vm.SP = resultSP
		}
		o.next = nil
		return
	}
	o.next = targetLabel.Target.(ctxInstruction)

	if resultSP == targetLabel.UnwindSP {
		// nothing to unwind
		o.run = func(vm *Runner) {
			if vm.Frame[conditionSP].I32 == 0 {
				// continue to next instruction instead of branching to label target
				vm.Next = nextInstruction
			}
		}
		return
	}

	dst := targetLabel.UnwindSP
	resultTypes := valueTypes
	o.run = func(vm *Runner) {
		if vm.Frame[conditionSP].I32 == 0 {
			// continue to next instruction instead of branching to label target
			vm.Next = nextInstruction
			return
		}
		// unwind stack
		for i := 0; i < len(resultTypes); i++ {
			vm.Frame[dst+i].Copy(&vm.Frame[resultSP+i], resultTypes[i])
		}
	}
}

func (o *Branch) analyzeBrTable(a *context.Analyzer) {
	if /* o.labelIndex < 0 || */ o.labelIndex >= uint32(len(a.Labels)) {
		a.Error = o.fail("Invalid label index")
		return
	}
	targetLabel := a.Labels[o.labelIndex]
	for _, index := range o.table {
		if /* index < 0 || */ index >= uint32(len(a.Labels)) {
			a.Error = o.fail("Invalid table label index")
			return
		}
		// todo label_types(ctrls[index]) =/= label_types(ctrls[labelIndex])
		// Label tableLabel = a.Labels.get(index);
		// if (!tableLabel.BlockType.IsSameAs(targetLabel.BlockType)) {
		//     a.Error = AllSignatures.FunctionSignature;
		//     return;
		// }
	}
	valueTypes := targetLabel.BlockType.ResultTypes
	if targetLabel.BlockInst != nil && targetLabel.BlockInst.Opcode() == op.LOOP {
		valueTypes = targetLabel.BlockType.ParamTypes
	}
	a.PopMulti(valueTypes)
	if a.Error != nil {
		return
	}
	resultSP := a.SP
	currentLabel := a.Labels[0]
	if currentLabel.Unreachable {
		// unreachable, no need to set up a runner
		return
	}

	// unconditional jump, rest of block became unreachable
	currentLabel.Unreachable = true
	a.SP = a.BlockMark

	// now set up the runner for this branch instruction

	targets := make([]*wasm.Label, len(a.Labels))
	for i := 0; i < len(targets); i++ {
		targets[i] = a.Labels[i]
	}
	table := o.table
	sp := o.SP
	labelIndex := o.labelIndex
	resultTypes := valueTypes
	o.run = func(vm *Runner) {
		targetIndex := labelIndex
		index := uint32(vm.Frame[sp].I32)
		if /* index >= 0 && */ index < uint32(len(table)) {
			targetIndex = table[index]
		}
		target := targets[targetIndex]
		vm.Next = target.Target
		if vm.Next == nil {
			// this is a return from function, no need to unwind
			// anything, just point to result when returning
			vm.SP = resultSP
			return
		}
		// unwind stack
		for i := 0; i < len(resultTypes); i++ {
			vm.Frame[target.UnwindSP+i].Copy(&vm.Frame[resultSP+i], resultTypes[i])
		}
	}
}

func (o *Branch) analyzeReturn(a *context.Analyzer) {
	// shorthand for break to outermost block
	o.labelIndex = uint32(len(a.Labels) - 1)
	o.analyzeBr(a)
}

func (o *Branch) Read(r *context.Reader) {
	switch o.opcode {
	case op.BR, op.BR_IF:
		o.labelIndex = r.GetU32()
	case op.BR_TABLE:
		count := r.GetU32()
		if r.Error != nil {
			return
		}
		o.table = make([]uint32, 0, count)
		for ; count != 0; count-- {
			index := r.GetU32()
			if r.Error != nil {
				return
			}
			o.table = append(o.table, index)
		}
		o.labelIndex = r.GetU32()
	case op.RETURN:
	default:
		panic("Invalid branch opcode")
	}
}

func (o *Branch) String() string {
	switch o.opcode {
	case op.BR, op.BR_IF:
		return fmt.Sprintf("%s %d", o.Mnemonic(), o.labelIndex)
	case op.BR_TABLE:
		// create "[x, y,..., z]"
		values := fmt.Sprintf("%v", o.table)
		// strip off brackets [ and ]
		values = values[1 : len(values)-1]
		return fmt.Sprintf("%s %s %d", o.Mnemonic(), values, o.labelIndex)
	case op.RETURN:
		return o.Mnemonic()
	default:
		panic("Invalid branch opcode")
	}
}

func (o *Branch) unwindSingleValue(a *context.Analyzer, src int, dst int) {
	switch a.Frame[src] {
	//@formatter:off
	case value.I32: o.run = func(vm *Runner) { vm.Frame[dst].I32 = vm.Frame[src].I32 }
	case value.I64: o.run = func(vm *Runner) { vm.Frame[dst].I64 = vm.Frame[src].I64 }
	case value.F32: o.run = func(vm *Runner) { vm.Frame[dst].F32 = vm.Frame[src].F32 }
	case value.F64: o.run = func(vm *Runner) { vm.Frame[dst].F64 = vm.Frame[src].F64 }
	//@formatter:on
	default:
		panic(fmt.Sprintf("Invalid value type: 0x%02x", a.Frame[src]))
	}
}

func (o *Branch) Write(w *context.Writer) {
	switch o.opcode {
	case op.BR, op.BR_IF:
		w.PutU32(o.labelIndex)
	case op.BR_TABLE:
		w.PutU32(uint32(len(o.table)))
		for _, index := range o.table {
			w.PutU32(index)
		}
		w.PutU32(o.labelIndex)
	case op.RETURN:
		return
	default:
		panic("Invalid branch opcode")
	}
}
