package instructions

import (
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/instructions/helper"
)

type Bool struct {
	Base
}

func NewBool() helper.Instruction {
	return &Bool{}
}

func (o *Bool) setRunner() {
	sp := o.SP
	switch o.opcode {
	//@formatter:off
	case op.I32_EQ  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].I32  ==        vm.Frame[sp+1].I32 ) }
	case op.I32_NE  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].I32  !=        vm.Frame[sp+1].I32 ) }
	case op.I32_LT_S: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].I32  <         vm.Frame[sp+1].I32 ) }
	case op.I32_GT_S: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].I32  >         vm.Frame[sp+1].I32 ) }
	case op.I32_LE_S: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].I32  <=        vm.Frame[sp+1].I32 ) }
	case op.I32_GE_S: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].I32  >=        vm.Frame[sp+1].I32 ) }
	case op.I32_LT_U: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(uint32(vm.Frame[sp].I32) <  uint32(vm.Frame[sp+1].I32)) }
	case op.I32_GT_U: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(uint32(vm.Frame[sp].I32) >  uint32(vm.Frame[sp+1].I32)) }
	case op.I32_LE_U: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(uint32(vm.Frame[sp].I32) <= uint32(vm.Frame[sp+1].I32)) }
	case op.I32_GE_U: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(uint32(vm.Frame[sp].I32) >= uint32(vm.Frame[sp+1].I32)) }
	case op.I64_EQ  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].I64  ==        vm.Frame[sp+1].I64 ) }
	case op.I64_NE  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].I64  !=        vm.Frame[sp+1].I64 ) }
	case op.I64_LT_S: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].I64  <         vm.Frame[sp+1].I64 ) }
	case op.I64_GT_S: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].I64  >         vm.Frame[sp+1].I64 ) }
	case op.I64_LE_S: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].I64  <=        vm.Frame[sp+1].I64 ) }
	case op.I64_GE_S: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].I64  >=        vm.Frame[sp+1].I64 ) }
	case op.I64_LT_U: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(uint64(vm.Frame[sp].I64) <  uint64(vm.Frame[sp+1].I64)) }
	case op.I64_GT_U: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(uint64(vm.Frame[sp].I64) >  uint64(vm.Frame[sp+1].I64)) }
	case op.I64_LE_U: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(uint64(vm.Frame[sp].I64) <= uint64(vm.Frame[sp+1].I64)) }
	case op.I64_GE_U: o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(uint64(vm.Frame[sp].I64) >= uint64(vm.Frame[sp+1].I64)) }
	case op.F32_EQ  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].F32  ==        vm.Frame[sp+1].F32 ) }
	case op.F32_NE  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].F32  !=        vm.Frame[sp+1].F32 ) }
	case op.F32_LT  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].F32  <         vm.Frame[sp+1].F32 ) }
	case op.F32_GT  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].F32  >         vm.Frame[sp+1].F32 ) }
	case op.F32_LE  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].F32  <=        vm.Frame[sp+1].F32 ) }
	case op.F32_GE  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].F32  >=        vm.Frame[sp+1].F32 ) }
	case op.F64_EQ  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].F64  ==        vm.Frame[sp+1].F64 ) }
	case op.F64_NE  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].F64  !=        vm.Frame[sp+1].F64 ) }
	case op.F64_LT  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].F64  <         vm.Frame[sp+1].F64 ) }
	case op.F64_GT  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].F64  >         vm.Frame[sp+1].F64 ) }
	case op.F64_LE  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].F64  <=        vm.Frame[sp+1].F64 ) }
	case op.F64_GE  : o.run = func(vm *Runner) { vm.Frame[sp].I32 = b2i(       vm.Frame[sp].F64  >=        vm.Frame[sp+1].F64 ) }
	//@formatter:on)
	default:
		panic("Invalid const opcode")
	}
}