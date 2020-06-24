package instructions

import (
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"math"
	"math/bits"
)

type Binary struct {
	Base
}

func NewBinary() helper.Instruction {
	return &Binary{}
}

func (o *Binary) setRunner() {
	sp := o.SP
	switch o.opcode {
	//@formatter:off
	case op.I32_ADD     : o.run = func(vm *Runner) { vm.Frame[sp].I32 += vm.Frame[sp+1].I32 }
	case op.I32_SUB     : o.run = func(vm *Runner) { vm.Frame[sp].I32 -= vm.Frame[sp+1].I32 }
	case op.I32_MUL     : o.run = func(vm *Runner) { vm.Frame[sp].I32 *= vm.Frame[sp+1].I32 }
	case op.I32_DIV_S   : o.run = func(vm *Runner) { i32Div(vm, sp) }
	case op.I32_DIV_U   : o.run = func(vm *Runner) { u32Div(vm, sp) }
	case op.I32_REM_S   : o.run = func(vm *Runner) { i32Rem(vm, sp) }
	case op.I32_REM_U   : o.run = func(vm *Runner) { u32Rem(vm, sp) }
	case op.I32_AND     : o.run = func(vm *Runner) { vm.Frame[sp].I32 &= vm.Frame[sp+1].I32 }
	case op.I32_OR      : o.run = func(vm *Runner) { vm.Frame[sp].I32 |= vm.Frame[sp+1].I32 }
	case op.I32_XOR     : o.run = func(vm *Runner) { vm.Frame[sp].I32 ^= vm.Frame[sp+1].I32 }
	case op.I32_SHL     : o.run = func(vm *Runner) { vm.Frame[sp].I32 <<= vm.Frame[sp+1].I32 }
	case op.I32_SHR_S   : o.run = func(vm *Runner) { vm.Frame[sp].I32 >>= vm.Frame[sp+1].I32 }
	case op.I32_SHR_U   : o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(uint32(vm.Frame[sp].I32) >> vm.Frame[sp+1].I32) }
	case op.I32_ROTL    : o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(bits.RotateLeft32(uint32(vm.Frame[sp].I32), int(vm.Frame[sp+1].I32))) }
	case op.I32_ROTR    : o.run = func(vm *Runner) { vm.Frame[sp].I32 = int32(bits.RotateLeft32(uint32(vm.Frame[sp].I32), -int(vm.Frame[sp+1].I32))) }
	case op.I64_ADD     : o.run = func(vm *Runner) { vm.Frame[sp].I64 += vm.Frame[sp+1].I64 }
	case op.I64_SUB     : o.run = func(vm *Runner) { vm.Frame[sp].I64 -= vm.Frame[sp+1].I64 }
	case op.I64_MUL     : o.run = func(vm *Runner) { vm.Frame[sp].I64 *= vm.Frame[sp+1].I64 }
	case op.I64_DIV_S   : o.run = func(vm *Runner) { i64Div(vm, sp) }
	case op.I64_DIV_U   : o.run = func(vm *Runner) { u64Div(vm, sp) }
	case op.I64_REM_S   : o.run = func(vm *Runner) { i64Rem(vm, sp) }
	case op.I64_REM_U   : o.run = func(vm *Runner) { u64Rem(vm, sp) }
	case op.I64_AND     : o.run = func(vm *Runner) { vm.Frame[sp].I64 &= vm.Frame[sp+1].I64 }
	case op.I64_OR      : o.run = func(vm *Runner) { vm.Frame[sp].I64 |= vm.Frame[sp+1].I64 }
	case op.I64_XOR     : o.run = func(vm *Runner) { vm.Frame[sp].I64 ^= vm.Frame[sp+1].I64 }
	case op.I64_SHL     : o.run = func(vm *Runner) { vm.Frame[sp].I64 <<= vm.Frame[sp+1].I64 }
	case op.I64_SHR_S   : o.run = func(vm *Runner) { vm.Frame[sp].I64 >>= vm.Frame[sp+1].I64 }
	case op.I64_SHR_U   : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(uint64(vm.Frame[sp].I64) >> vm.Frame[sp+1].I64) }
	case op.I64_ROTL    : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(bits.RotateLeft64(uint64(vm.Frame[sp].I64), int(vm.Frame[sp+1].I64))) }
	case op.I64_ROTR    : o.run = func(vm *Runner) { vm.Frame[sp].I64 = int64(bits.RotateLeft64(uint64(vm.Frame[sp].I64), -int(vm.Frame[sp+1].I64))) }
	case op.F32_ADD     : o.run = func(vm *Runner) { vm.Frame[sp].F32 += vm.Frame[sp+1].F32 }
	case op.F32_SUB     : o.run = func(vm *Runner) { vm.Frame[sp].F32 -= vm.Frame[sp+1].F32 }
	case op.F32_MUL     : o.run = func(vm *Runner) { vm.Frame[sp].F32 *= vm.Frame[sp+1].F32 }
	case op.F32_DIV     : o.run = func(vm *Runner) { vm.Frame[sp].F32 /= vm.Frame[sp+1].F32 }
	case op.F32_MIN     : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(f64Min(float64(vm.Frame[sp].F32), float64(vm.Frame[sp+1].F32))) }
	case op.F32_MAX     : o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(f64Max(float64(vm.Frame[sp].F32), float64(vm.Frame[sp+1].F32))) }
	case op.F32_COPYSIGN: o.run = func(vm *Runner) { vm.Frame[sp].F32 = float32(math.Copysign(float64(vm.Frame[sp].F32), float64(vm.Frame[sp+1].F32))) }
	case op.F64_ADD     : o.run = func(vm *Runner) { vm.Frame[sp].F64 += vm.Frame[sp+1].F64 }
	case op.F64_SUB     : o.run = func(vm *Runner) { vm.Frame[sp].F64 -= vm.Frame[sp+1].F64 }
	case op.F64_MUL     : o.run = func(vm *Runner) { vm.Frame[sp].F64 *= vm.Frame[sp+1].F64 }
	case op.F64_DIV     : o.run = func(vm *Runner) { vm.Frame[sp].F64 /= vm.Frame[sp+1].F64 }
	case op.F64_MIN     : o.run = func(vm *Runner) { vm.Frame[sp].F64 = f64Min(vm.Frame[sp].F64, vm.Frame[sp+1].F64) }
	case op.F64_MAX     : o.run = func(vm *Runner) { vm.Frame[sp].F64 = f64Max(vm.Frame[sp].F64, vm.Frame[sp+1].F64) }
	case op.F64_COPYSIGN: o.run = func(vm *Runner) { vm.Frame[sp].F64 = math.Copysign(vm.Frame[sp].F64, vm.Frame[sp+1].F64) }
		//@formatter:on
	default:
		panic("Invalid binary opcode")
	}
}

func f64Max(x, y float64) float64 {
	// special cases, order in math.Max is wrong
	switch {
	case math.IsNaN(x) || math.IsNaN(y):
		return math.NaN()
	case math.IsInf(x, 1) || math.IsInf(y, 1):
		return math.Inf(1)
	case x == 0 && x == y:
		if math.Signbit(x) {
			return y
		}
		return x
	}
	if x > y {
		return x
	}
	return y
}

func f64Min(x, y float64) float64 {
	// special cases, order in math.Min is wrong
	switch {
	case math.IsNaN(x) || math.IsNaN(y):
		return math.NaN()
	case math.IsInf(x, -1) || math.IsInf(y, -1):
		return math.Inf(-1)
	case x == 0 && x == y:
		if math.Signbit(x) {
			return x
		}
		return y
	}
	if x < y {
		return x
	}
	return y
}

func i32Div(vm *Runner, sp int) {
	rhs := vm.Frame[sp+1].I32
	if rhs == 0 {
		vm.Error = DivZero
		return
	}
	if rhs == -1 && vm.Frame[sp].I32 == -0x80000000 {
		vm.Error = IntOverflow
		return
	}
	vm.Frame[sp].I32 /= rhs
}

func i32Rem(vm *Runner, sp int) {
	rhs := vm.Frame[sp+1].I32
	if rhs == 0 {
		vm.Error = DivZero
		return
	}
	vm.Frame[sp].I32 %= rhs
}

func i64Div(vm *Runner, sp int) {
	rhs := vm.Frame[sp+1].I64
	if rhs == 0 {
		vm.Error = DivZero
		return
	}
	if rhs == -1 && vm.Frame[sp].I64 == -0x8000000000000000 {
		vm.Error = IntOverflow
		return
	}
	vm.Frame[sp].I64 /= rhs
}

func i64Rem(vm *Runner, sp int) {
	rhs := vm.Frame[sp+1].I64
	if rhs == 0 {
		vm.Error = DivZero
		return
	}
	vm.Frame[sp].I64 %= rhs
}

func u32Div(vm *Runner, sp int) {
	rhs := vm.Frame[sp+1].I32
	if rhs == 0 {
		vm.Error = DivZero
		return
	}
	vm.Frame[sp].I32 = int32(uint32(vm.Frame[sp].I32) / uint32(rhs))
}

func u32Rem(vm *Runner, sp int) {
	rhs := vm.Frame[sp+1].I32
	if rhs == 0 {
		vm.Error = DivZero
		return
	}
	vm.Frame[sp].I32 = int32(uint32(vm.Frame[sp].I32) % uint32(rhs))
}

func u64Div(vm *Runner, sp int) {
	rhs := vm.Frame[sp+1].I64
	if rhs == 0 {
		vm.Error = DivZero
		return
	}
	vm.Frame[sp].I64 = int64(uint64(vm.Frame[sp].I64) / uint64(rhs))
}

func u64Rem(vm *Runner, sp int) {
	rhs := vm.Frame[sp+1].I64
	if rhs == 0 {
		vm.Error = DivZero
		return
	}
	vm.Frame[sp].I64 = int64(uint64(vm.Frame[sp].I64) % uint64(rhs))
}
