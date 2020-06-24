package instructions

import (
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"math"
)

type Convert struct {
	Base
}

func NewConvert() helper.Instruction {
	return &Convert{}
}

func (o *Convert) setRunner() {
	sp := o.SP
	switch o.opcode {
	//@formatter:off
	case op.I32_WRAP_I64       : o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(vm.Frame[sp].I64) }
	case op.I32_TRUNC_F32_S    : o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(truncF64(vm, float64(vm.Frame[sp].F32))) }
	case op.I32_TRUNC_F32_U    : o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(uint32(truncF64(vm, float64(vm.Frame[sp].F32)))) }
	case op.I32_TRUNC_F64_S    : o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(truncF64(vm, vm.Frame[sp].F64)) }
	case op.I32_TRUNC_F64_U    : o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(uint32(truncF64(vm, vm.Frame[sp].F64))) }
	case op.I64_EXTEND_I32_S   : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(vm.Frame[sp].I32) }
	case op.I64_EXTEND_I32_U   : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(uint32(vm.Frame[sp].I32)) }
	case op.I64_TRUNC_F32_S    : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(truncF64(vm, float64(vm.Frame[sp].F32))) }
	case op.I64_TRUNC_F32_U    : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(uint64(truncF64(vm, float64(vm.Frame[sp].F32)))) }
	case op.I64_TRUNC_F64_S    : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(truncF64(vm, vm.Frame[sp].F64)) }
	case op.I64_TRUNC_F64_U    : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(uint64(truncF64(vm, vm.Frame[sp].F64))) }
	case op.F32_CONVERT_I32_S  : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(vm.Frame[sp].I32) }
	case op.F32_CONVERT_I32_U  : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(uint32(vm.Frame[sp].I32)) }
	case op.F32_CONVERT_I64_S  : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(vm.Frame[sp].I64) }
	case op.F32_CONVERT_I64_U  : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(uint64(vm.Frame[sp].I64)) }
	case op.F32_DEMOTE_F64     : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(vm.Frame[sp].F64) }
	case op.F64_CONVERT_I32_S  : o.run = func(vm *Runner) { vm.Frame[sp].F64 = float64(vm.Frame[sp].I32) }
	case op.F64_CONVERT_I32_U  : o.run = func(vm *Runner) { vm.Frame[sp].F64 = float64(uint32(vm.Frame[sp].I32)) }
	case op.F64_CONVERT_I64_S  : o.run = func(vm *Runner) { vm.Frame[sp].F64 = float64(vm.Frame[sp].I64) }
	case op.F64_CONVERT_I64_U  : o.run = func(vm *Runner) { vm.Frame[sp].F64 = float64(uint64(vm.Frame[sp].I64)) }
	case op.F64_PROMOTE_F32    : o.run = func(vm *Runner) { vm.Frame[sp].F64 = float64(vm.Frame[sp].F32) }
	case op.I32_REINTERPRET_F32: o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(math.Float32bits(vm.Frame[sp].F32)) }
	case op.I64_REINTERPRET_F64: o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(math.Float64bits(vm.Frame[sp].F64)) }
	case op.F32_REINTERPRET_I32: o.run = func(vm *Runner) { vm.Frame[sp].F32 = math.Float32frombits(uint32(vm.Frame[sp].I32)) }
	case op.F64_REINTERPRET_I64: o.run = func(vm *Runner) { vm.Frame[sp].F64 = math.Float64frombits(uint64(vm.Frame[sp].I64)) }
	//@formatter:on
	default:
		panic("Invalid convert opcode")
	}
}

func truncF64(vm *Runner, val float64) float64 {
	if math.IsNaN(val) {
		vm.Error = InvalidConversion
		return val
	}
	return math.Trunc(val)
}
