package instruction

import (
	"fmt"
	"github.com/iotaledger/wart/utils"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/executor/context"
	"github.com/iotaledger/wart/wasm/wasm"
	"math"
)

type Mem struct {
	Base
	align  byte
	offset uint32
	size   uint32
}

var alignment = [...]uint32{1, 2, 4, 8}

func NewMem() wasm.Instruction {
	return &Mem{}
}

func (o *Mem) Analyze(a *context.Analyzer) {
	maxAlign := AllSignatures[o.opcode].Align
	if /* o.align < 0 || */ o.align > maxAlign {
		a.Error = o.fail("Invalid memory alignment value")
		return
	}
	o.size = alignment[maxAlign]
}

func getI8(vm *Runner) int8 {
	return int8(vm.Memory.Pool[vm.Addr])
}

func getI16(vm *Runner) int16 {
	addr := vm.Addr
	return int16(uint16(vm.Memory.Pool[addr]) |
		uint16(vm.Memory.Pool[addr+1])<<8)
}

func getI32(vm *Runner) int32 {
	addr := vm.Addr
	return int32(uint32(vm.Memory.Pool[addr]) |
		uint32(vm.Memory.Pool[addr+1])<<8 |
		uint32(vm.Memory.Pool[addr+2])<<16 |
		uint32(vm.Memory.Pool[addr+3])<<24)
}

func getI64(vm *Runner) int64 {
	addr := vm.Addr
	return int64(uint64(vm.Memory.Pool[addr]) |
		uint64(vm.Memory.Pool[addr+1])<<8 |
		uint64(vm.Memory.Pool[addr+2])<<16 |
		uint64(vm.Memory.Pool[addr+3])<<24 |
		uint64(vm.Memory.Pool[addr+4])<<32 |
		uint64(vm.Memory.Pool[addr+5])<<40 |
		uint64(vm.Memory.Pool[addr+6])<<48 |
		uint64(vm.Memory.Pool[addr+7])<<56)
}

func (o *Mem) Read(r *context.Reader) {
	o.align = byte(r.GetU32())
	if r.Error != nil {
		return
	}
	if /* o.align < 0 || */ o.align > 3 {
		r.Error = utils.Error("Invalid alignment value: %d", o.align)
		return
	}
	o.offset = r.GetU32()
}

func setF32(vm *Runner, v float32) {
	setI32(vm, int32(math.Float32bits(v)))
}

func setF64(vm *Runner, v float64) {
	setI64(vm, int64(math.Float64bits(v)))
}

func setI8(vm *Runner, v int32) {
	vm.Memory.Pool[vm.Addr] = byte(v)
}

func setI16(vm *Runner, v int32) {
	addr := vm.Addr
	vm.Memory.Pool[addr+0] = byte(v)
	vm.Memory.Pool[addr+1] = byte(v >> 8)
}

func setI32(vm *Runner, v int32) {
	addr := vm.Addr
	vm.Memory.Pool[addr+0] = byte(v)
	vm.Memory.Pool[addr+1] = byte(v >> 8)
	vm.Memory.Pool[addr+2] = byte(v >> 16)
	vm.Memory.Pool[addr+3] = byte(v >> 24)
}

func setI64(vm *Runner, v int64) {
	addr := vm.Addr
	vm.Memory.Pool[addr+0] = byte(v)
	vm.Memory.Pool[addr+1] = byte(v >> 8)
	vm.Memory.Pool[addr+2] = byte(v >> 16)
	vm.Memory.Pool[addr+3] = byte(v >> 24)
	vm.Memory.Pool[addr+4] = byte(v >> 32)
	vm.Memory.Pool[addr+5] = byte(v >> 40)
	vm.Memory.Pool[addr+6] = byte(v >> 48)
	vm.Memory.Pool[addr+7] = byte(v >> 56)
}

func (o *Mem) setRunner() {
	sp := o.SP
	var runner instructionRunner
	switch o.opcode {
	//@formatter:off
	case op.I32_LOAD    : runner = func(vm *Runner) { vm.Frame[sp].I32 = getI32(vm) }
	case op.I64_LOAD    : runner = func(vm *Runner) { vm.Frame[sp].I64 = getI64(vm) }
	case op.F32_LOAD    : runner = func(vm *Runner) { vm.Frame[sp].F32 = math.Float32frombits(uint32(getI32(vm))) }
	case op.F64_LOAD    : runner = func(vm *Runner) { vm.Frame[sp].F64 = math.Float64frombits(uint64(getI64(vm))) }
	case op.I32_LOAD8_S : runner = func(vm *Runner) { vm.Frame[sp].I32 = int32(       getI8 (vm)) }
	case op.I32_LOAD8_U : runner = func(vm *Runner) { vm.Frame[sp].I32 = int32(uint8 (getI8 (vm))) }
	case op.I32_LOAD16_S: runner = func(vm *Runner) { vm.Frame[sp].I32 = int32(       getI16(vm)) }
	case op.I32_LOAD16_U: runner = func(vm *Runner) { vm.Frame[sp].I32 = int32(uint16(getI16(vm))) }
	case op.I64_LOAD8_S : runner = func(vm *Runner) { vm.Frame[sp].I64 = int64(       getI8 (vm)) }
	case op.I64_LOAD8_U : runner = func(vm *Runner) { vm.Frame[sp].I64 = int64(uint8 (getI8 (vm))) }
	case op.I64_LOAD16_S: runner = func(vm *Runner) { vm.Frame[sp].I64 = int64(       getI16(vm)) }
	case op.I64_LOAD16_U: runner = func(vm *Runner) { vm.Frame[sp].I64 = int64(uint16(getI16(vm))) }
	case op.I64_LOAD32_S: runner = func(vm *Runner) { vm.Frame[sp].I64 = int64(       getI32(vm)) }
	case op.I64_LOAD32_U: runner = func(vm *Runner) { vm.Frame[sp].I64 = int64(uint32(getI32(vm))) }
	case op.I32_STORE   : runner = func(vm *Runner) { setI32(vm, vm.Frame[sp+1].I32) }
	case op.I64_STORE   : runner = func(vm *Runner) { setI64(vm, vm.Frame[sp+1].I64) }
	case op.F32_STORE   : runner = func(vm *Runner) { setF32(vm, vm.Frame[sp+1].F32) }
	case op.F64_STORE   : runner = func(vm *Runner) { setF64(vm, vm.Frame[sp+1].F64) }
	case op.I32_STORE8  : runner = func(vm *Runner) { setI8 (vm, vm.Frame[sp+1].I32) }
	case op.I32_STORE16 : runner = func(vm *Runner) { setI16(vm, vm.Frame[sp+1].I32) }
	case op.I64_STORE8  : runner = func(vm *Runner) { setI8 (vm, int32(vm.Frame[sp+1].I64)) }
	case op.I64_STORE16 : runner = func(vm *Runner) { setI16(vm, int32(vm.Frame[sp+1].I64)) }
	case op.I64_STORE32 : runner = func(vm *Runner) { setI32(vm, int32(vm.Frame[sp+1].I64)) }
	//@formatter:on
	default:
		panic("Invalid mem opcode")
	}

	offset := o.offset
	size := o.size
	o.run = func(vm *Runner) {
		addr := uint32(vm.Frame[sp].I32)
		memSize := uint32(len(vm.Memory.Pool))
		vm.Addr = offset + addr
		// make sure that no wrapping occurs and that memory is accessible
		if vm.Addr < addr || /* vm.Addr < offset || */ vm.Addr >= memSize || vm.Addr+size > memSize {
			vm.Error = MemAccess
			return
		}
		runner(vm)
	}
}

func (o *Mem) String() string {
	offsetText := ""
	if o.offset != 0 {
		offsetText = fmt.Sprintf(" offset=%d", o.offset)
	}
	alignText := ""
	if o.align != AllSignatures[o.opcode].Align {
		alignText = fmt.Sprintf(" align=%d", o.align)
	}
	return fmt.Sprintf("%s%s%s", o.Mnemonic(), offsetText, alignText)
	// todo o.table
}

func (o *Mem) Write(w *context.Writer) {
	w.PutU32(uint32(o.align))
	w.PutU32(o.offset)
}
