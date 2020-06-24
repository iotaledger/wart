package instructions

import (
	"fmt"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors/context"
	"github.com/iotaledger/wart/wasm/instructions/helper"
)

type Var struct {
	Base
	Index uint32
	vt    value.Type
}

func NewVar() helper.Instruction {
	return &Var{}
}

func (o *Var) Analyze(a *context.Analyzer) {
	switch o.opcode {
	//@formatter:off
	case op.LOCAL_GET:  o.analyzeLocalGet(a)
	case op.LOCAL_SET:  o.analyzeLocalSetAndTee(a)
	case op.LOCAL_TEE:  o.analyzeLocalSetAndTee(a)
	case op.GLOBAL_GET: o.analyzeGlobalGet(a)
	case op.GLOBAL_SET: o.analyzeGlobalSet(a)
	//@formatter:on
	default:
		panic("Invalid var opcode")
	}
}

func (o *Var) analyzeLocalGet(a *context.Analyzer) {
	if /* o.Index < 0 || */ o.Index >= a.Module.Functions[a.FuncNr].MaxLocalIndex() {
		a.Error = o.fail("unknown local")
		return
	}
	o.vt = a.Frame[o.Index]
	a.Push(o.vt)
}

func (o *Var) analyzeLocalSetAndTee(a *context.Analyzer) {
	if /* o.Index < 0 || */ o.Index >= a.Module.Functions[a.FuncNr].MaxLocalIndex() {
		a.Error = o.fail("unknown local")
		return
	}
	o.vt = a.Frame[o.Index]
	top := a.PopExpected(o.vt)
	if a.Error != nil {
		return
	}
	if top != o.vt {
		a.Error = o.fail("Invalid operand type")
		return
	}
	o.SP = a.SP
	if o.opcode == op.LOCAL_TEE {
		a.Push(o.vt)
	}
}

func (o *Var) analyzeGlobalGet(a *context.Analyzer) {
	if /* o.Index < 0 || */ o.Index >= a.Module.MaxGlobals() {
		a.Error = o.fail("unknown global")
		return
	}
	o.vt = a.Module.Globals[o.Index].Type
	a.Push(o.vt)
}

func (o *Var) analyzeGlobalSet(a *context.Analyzer) {
	if /* o.Index < 0 || */ o.Index >= a.Module.MaxGlobals() {
		a.Error = o.fail("unknown global")
		return
	}
	if !a.Module.Globals[o.Index].Mutable {
		a.Error = o.fail("global is immutable")
		return
	}
	o.vt = a.Module.Globals[o.Index].Type
	top := a.PopExpected(o.vt)
	if a.Error != nil {
		return
	}
	if top != o.vt {
		a.Error = o.fail("Invalid operand type")
		return
	}
	o.SP = a.SP
}

func (o *Var) Read(r *context.Reader) {
	o.Index = r.GetU32()
}

func (o *Var) setRunner() {
	switch o.opcode {
	//@formatter:off
	case op.LOCAL_GET : o.setRunLocalGet()
	case op.LOCAL_SET : o.setRunLocalSet()
	case op.LOCAL_TEE : o.setRunLocalSet()
	case op.GLOBAL_GET: o.setRunGlobalGet()
	case op.GLOBAL_SET: o.setRunGlobalSet()
	//@formatter:on
	default:
		panic("Invalid var opcode")
	}
}

func (o *Var) setRunLocalGet() {
	sp := o.SP
	idx := o.Index
	switch o.vt {
	//@formatter:off
	case value.I32: o.run = func(vm *Runner) { vm.Frame[sp].I32 = vm.Frame[idx].I32 }
	case value.I64: o.run = func(vm *Runner) { vm.Frame[sp].I64 = vm.Frame[idx].I64 }
	case value.F32: o.run = func(vm *Runner) { vm.Frame[sp].F32 = vm.Frame[idx].F32 }
	case value.F64: o.run = func(vm *Runner) { vm.Frame[sp].F64 = vm.Frame[idx].F64 }
	//@formatter:on
	default:
		panic(fmt.Sprintf("Invalid value type: 0x%02x", byte(o.vt)))
	}
}

func (o *Var) setRunLocalSet() {
	sp := o.SP
	idx := o.Index
	switch o.vt {
	//@formatter:off
	case value.I32: o.run = func(vm *Runner) { vm.Frame[idx].I32 = vm.Frame[sp].I32 }
	case value.I64: o.run = func(vm *Runner) { vm.Frame[idx].I64 = vm.Frame[sp].I64 }
	case value.F32: o.run = func(vm *Runner) { vm.Frame[idx].F32 = vm.Frame[sp].F32 }
	case value.F64: o.run = func(vm *Runner) { vm.Frame[idx].F64 = vm.Frame[sp].F64 }
	//@formatter:on
	default:
		panic(fmt.Sprintf("Invalid value type: 0x%02x", byte(o.vt)))
	}
}

func (o *Var) setRunGlobalGet() {
	sp := o.SP
	idx := o.Index
	switch o.vt {
	//@formatter:off
	case value.I32: o.run = func(vm *Runner) { vm.Frame[sp].I32 = vm.Module.GlobalVars[idx].I32 }
	case value.I64: o.run = func(vm *Runner) { vm.Frame[sp].I64 = vm.Module.GlobalVars[idx].I64 }
	case value.F32: o.run = func(vm *Runner) { vm.Frame[sp].F32 = vm.Module.GlobalVars[idx].F32 }
	case value.F64: o.run = func(vm *Runner) { vm.Frame[sp].F64 = vm.Module.GlobalVars[idx].F64 }
	//@formatter:on
	default:
		panic(fmt.Sprintf("Invalid value type: 0x%02x", byte(o.vt)))
	}
}

func (o *Var) setRunGlobalSet() {
	sp := o.SP
	idx := o.Index
	switch o.vt {
	//@formatter:off
	case value.I32: o.run = func(vm *Runner) { vm.Module.GlobalVars[idx].I32 = vm.Frame[sp].I32 }
	case value.I64: o.run = func(vm *Runner) { vm.Module.GlobalVars[idx].I64 = vm.Frame[sp].I64 }
	case value.F32: o.run = func(vm *Runner) { vm.Module.GlobalVars[idx].F32 = vm.Frame[sp].F32 }
	case value.F64: o.run = func(vm *Runner) { vm.Module.GlobalVars[idx].F64 = vm.Frame[sp].F64 }
	//@formatter:on
	default:
		panic(fmt.Sprintf("Invalid value type: 0x%02x", byte(o.vt)))
	}
}

func (o *Var) String() string {
	return fmt.Sprintf("%s %d", o.Mnemonic(), o.Index)
}

func (o *Var) Write(w *context.Writer) {
	w.PutU32(o.Index)
}
