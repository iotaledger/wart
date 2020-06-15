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
	o.analyzeBrCommon(a)
	if a.Error != nil || a.Unreachable {
		return
	}

	// unconditional jump, rest of block is unreachable
	currentSP := a.SP
	a.Unreachable = true
	a.SP = a.BlockMark

	if o.next == nil {
		// this is a return from function, no need to unwind
		// just point to result when returning
		resultSP := a.ResultSP
		o.run = func(vm *Runner) { vm.SP = resultSP }
		return
	}

	if a.ResultSP == a.UnwindSP {
		// nothing to unwind
		o.run = func(vm *Runner) {}
		return
	}

	if a.ResultSP+1 == currentSP {
		// directly copy the one value
		o.unwindSingleValue(a)
		return
	}

	// slower copy loop, only done when multiple values
	o.unwindMultiValue(a, currentSP-a.ResultSP)
}

func (o *Branch) analyzeBrCommon(a *context.Analyzer) {
	if /* o.labelIndex < 0 || */ o.labelIndex >= uint32(len(a.Labels)) {
		a.Error = o.fail("Invalid label index")
		return
	}
	target := uint32(len(a.Labels)) - 1 - o.labelIndex
	label := a.Labels[target]
	valueTypes := label.BlockType.ResultTypes
	//if label.BlockInst != nil && label.BlockInst.Opcode() == op.LOOP {
	//	valueTypes = label.BlockType.ParamTypes
	//}
	for i := len(valueTypes) - 1; i >= 0; i-- {
		vt := valueTypes[i]
		top := a.PopExpected(vt)
		if a.Error != nil {
			return
		}
		if top != vt {
			a.Error = o.fail("Invalid block result value type")
			return
		}
	}
	a.ResultSP = a.SP
	a.UnwindSP = label.UnwindSP
	for _, vt := range valueTypes {
		a.Push(vt)
	}
	sp := o.SP - len(valueTypes)
	o.run = func(vm *Runner) {
		vm.SP = sp
	}

	// branch exits instruction loop
	o.next = nil
	// unless it is an inner block
	if target != 0 {
		o.next = label.Target.(ctxInstruction)
		if o.next.Opcode() != op.END && o.next.Opcode() != op.LOOP {
			a.Error = o.fail("Missing function end instruction")
		}
	}
}

func (o *Branch) analyzeBrIf(a *context.Analyzer) {
	// save next instruction because analyzeBrCommon()
	// will set <next> to the branch label target
	nextInstruction := o.next
	o.analyzeBrCommon(a)
	if a.Error != nil || a.Unreachable {
		return
	}
	conditionSP := o.SP
	if o.next == nil {
		// this is a return from function, no need to unwind
		// just point to result when returning
		resultSP := a.ResultSP
		o.run = func(vm *Runner) {
			if vm.Frame[conditionSP].I32 == 0 {
				// continue to next instruction instead of label target
				vm.Next = nextInstruction
				return
			}
			vm.SP = resultSP
		}
		return
	}

	if a.ResultSP == a.UnwindSP {
		// nothing to unwind
		o.run = func(vm *Runner) {
			if vm.Frame[conditionSP].I32 == 0 {
				// continue to next instruction instead of label target
				vm.Next = nextInstruction
			}
		}
		return
	}

	resultSP := a.ResultSP
	unwindSP := a.UnwindSP
	valueTypes := make([]value.Type, a.SP-resultSP)
	copy(valueTypes, a.Frame[resultSP:])
	o.run = func(vm *Runner) {
		if vm.Frame[conditionSP].I32 == 0 {
			// continue to next instruction instead of label target
			vm.Next = nextInstruction
			return
		}
		// unwind stack
		for i := 0; i < len(valueTypes); i++ {
			vm.Frame[unwindSP+i].Copy(&vm.Frame[resultSP+i], valueTypes[i])
		}
	}
}

func (o *Branch) analyzeBrTable(a *context.Analyzer) {
	for _, index := range o.table {
		if /* index < 0 || */ index >= uint32(len(a.Labels)) {
			a.Error = o.fail("Invalid table label index")
			return
		}
		//todo more checking on target, like done in analyzeBrCommon()
	}
	o.analyzeBrCommon(a)
	if a.Error != nil || a.Unreachable {
		return
	}

	// unconditional jump, rest of block became unreachable
	currentSP := a.SP
	a.Unreachable = true
	a.SP = a.BlockMark

	// note we skip the outer block label
	targets := make([]*wasm.Label, len(a.Labels)-1)
	for i := 0; i < len(targets); i++ {
		targets[i] = a.Labels[len(a.Labels)-1-i]
	}
	table := o.table
	sp := o.SP
	resultSP := a.ResultSP
	labelIndex := o.labelIndex
	valueTypes := make([]value.Type, currentSP-resultSP)
	copy(valueTypes, a.Frame[resultSP:])
	o.run = func(vm *Runner) {
		targetIndex := labelIndex
		index := uint32(vm.Frame[sp].I32)
		if /* index >= 0 && */ index < uint32(len(table)) {
			targetIndex = table[index]
		}
		if targetIndex == uint32(len(targets)) {
			// this is a return from function, no need to unwind
			// just point to result when returning
			vm.Next = nil
			vm.SP = resultSP
			return
		}
		label := targets[targetIndex]
		vm.Next = label.Target
		// unwind stack
		for i := 0; i < len(valueTypes); i++ {
			vm.Frame[label.UnwindSP+i].Copy(&vm.Frame[resultSP+i], valueTypes[i])
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

func (o *Branch) unwindMultiValue(a *context.Analyzer, values int) {
	valueTypes := make([]value.Type, values)
	copy(valueTypes, a.Frame[a.ResultSP:])
	src := a.ResultSP
	dst := a.UnwindSP
	o.run = func(vm *Runner) {
		for i := 0; i < values; i++ {
			vm.Frame[dst+i].Copy(&vm.Frame[src+i], valueTypes[i])
		}
	}
}

func (o *Branch) unwindSingleValue(a *context.Analyzer) {
	src := a.ResultSP
	dst := a.UnwindSP
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
