package instructions

import (
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"math"
	"math/bits"
)

type Unary struct {
	Base
}

func NewUnary() helper.Instruction {
	return &Unary{}
}

func nearest(val float64) float64 {
	return math.RoundToEven(val)
}

func (o *Unary) setRunner() {
	sp := o.SP
	switch o.opcode {
	//@formatter:off
	case op.I32_EQZ       : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(vm.Frame[sp].I32 == 0) }
	case op.I32_CLZ       : o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(bits.LeadingZeros32 (uint32(vm.Frame[sp].I32))) }
	case op.I32_CTZ       : o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(bits.TrailingZeros32(uint32(vm.Frame[sp].I32))) }
	case op.I32_POPCNT    : o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(bits.OnesCount32    (uint32(vm.Frame[sp].I32))) }
	case op.I64_EQZ       : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(vm.Frame[sp].I64 == 0) }
	case op.I64_CLZ       : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(bits.LeadingZeros64 (uint64(vm.Frame[sp].I64))) }
	case op.I64_CTZ       : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(bits.TrailingZeros64(uint64(vm.Frame[sp].I64))) }
	case op.I64_POPCNT    : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(bits.OnesCount64    (uint64(vm.Frame[sp].I64))) }
	case op.F32_ABS       : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(math.Abs(float64(vm.Frame[sp].F32))) }
	case op.F32_NEG       : o.run = func(vm *Runner) { vm.Frame[sp].F32 = -vm.Frame[sp].F32 }
	case op.F32_CEIL      : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(math.Ceil(float64(vm.Frame[sp].F32))) }
	case op.F32_FLOOR     : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(math.Floor(float64(vm.Frame[sp].F32))) }
	case op.F32_TRUNC     : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(math.Trunc(float64(vm.Frame[sp].F32))) }
	case op.F32_NEAREST   : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(nearest(float64(vm.Frame[sp].F32))) }
	case op.F32_SQRT      : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(math.Sqrt(float64(vm.Frame[sp].F32))) }
	case op.F64_ABS       : o.run = func(vm *Runner) { vm.Frame[sp].F64 = math.Abs(vm.Frame[sp].F64) }
	case op.F64_NEG       : o.run = func(vm *Runner) { vm.Frame[sp].F64 = -vm.Frame[sp].F64 }
	case op.F64_CEIL      : o.run = func(vm *Runner) { vm.Frame[sp].F64 = math.Ceil(vm.Frame[sp].F64) }
	case op.F64_FLOOR     : o.run = func(vm *Runner) { vm.Frame[sp].F64 = math.Floor(vm.Frame[sp].F64) }
	case op.F64_TRUNC     : o.run = func(vm *Runner) { vm.Frame[sp].F64 = math.Trunc(vm.Frame[sp].F64) }
	case op.F64_NEAREST   : o.run = func(vm *Runner) { vm.Frame[sp].F64 = nearest(vm.Frame[sp].F64) }
	case op.F64_SQRT      : o.run = func(vm *Runner) { vm.Frame[sp].F64 = math.Sqrt(vm.Frame[sp].F64) }
	case op.I32_EXTEND8_S : o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(int8(vm.Frame[sp].I32)) }
	case op.I32_EXTEND16_S: o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(int16(vm.Frame[sp].I32)) }
	case op.I64_EXTEND8_S : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(int8(vm.Frame[sp].I64)) }
	case op.I64_EXTEND16_S: o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(int16(vm.Frame[sp].I64)) }
	case op.I64_EXTEND32_S: o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(int32(vm.Frame[sp].I64)) }
	//@formatter:on
	default:
		panic("Invalid unary opcode")
	}
}
