package instructions

import (
	"fmt"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors/context"
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"github.com/iotaledger/wart/wasm/sections"
)

type Const struct {
	Base
	Value sections.Variable
}

func NewConst() helper.Instruction {
	return &Const{}
}

func (o *Const) DataType() value.DataType {
	switch o.opcode {
	//@formatter:off
	case op.I32_CONST: return value.I32
	case op.I64_CONST: return value.I64
	case op.F32_CONST: return value.F32
	case op.F64_CONST: return value.F64
	//@formatter:on
	default:
		panic("Invalid const opcode")
	}
}

func (o *Const) Read(r *context.Reader) {
	switch o.opcode {
	//@formatter:off
	case op.I32_CONST: o.Value.I32 = r.GetI32()
	case op.I64_CONST: o.Value.I64 = r.GetI64()
	case op.F32_CONST: o.Value.F32 = r.GetF32()
	case op.F64_CONST: o.Value.F64 = r.GetF64()
	//@formatter:on
	default:
		panic("Invalid const opcode")
	}
}

func (o *Const) setRunner() {
	sp := o.SP
	val := &o.Value
	switch o.opcode {
	//@formatter:off
	case op.I32_CONST: o.run = func(vm *Runner) { vm.Frame[sp].I32 = val.I32 }
	case op.I64_CONST: o.run = func(vm *Runner) { vm.Frame[sp].I64 = val.I64 }
	case op.F32_CONST: o.run = func(vm *Runner) { vm.Frame[sp].F32 = val.F32 }
	case op.F64_CONST: o.run = func(vm *Runner) { vm.Frame[sp].F64 = val.F64 }
	//@formatter:on
	default:
		panic("Invalid const opcode")
	}
}

func (o *Const) String() string {
	switch o.opcode {
	//@formatter:off
	case op.I32_CONST: return fmt.Sprintf("%s %d", o.Mnemonic(), o.Value.I32)
	case op.I64_CONST: return fmt.Sprintf("%s %d", o.Mnemonic(), o.Value.I64)
	case op.F32_CONST: return fmt.Sprintf("%s %s", o.Mnemonic(), toStringF32(o.Value.F32))
	case op.F64_CONST: return fmt.Sprintf("%s %s", o.Mnemonic(), toStringF64(o.Value.F64))
	//@formatter:on
	default:
		panic("Invalid const opcode")
	}
}

func toStringF32(f32 float32) string {
	return toStringFormat(fmt.Sprintf("%v", f32))
}

func toStringF64(f64 float64) string {
	return toStringFormat(fmt.Sprintf("%v", f64))
}

func toStringFormat(val string) string {
	// opportunity to standardize floating point to Wasm spec
	return val
}

func (o *Const) Write(w *context.Writer) {
	switch o.opcode {
	//@formatter:off
	case op.I32_CONST: w.PutI32(o.Value.I32)
	case op.I64_CONST: w.PutI64(o.Value.I64)
	case op.F32_CONST: w.PutF32(o.Value.F32)
	case op.F64_CONST: w.PutF64(o.Value.F64)
	//@formatter:on
	default:
		panic("Invalid const opcode")
	}
}
