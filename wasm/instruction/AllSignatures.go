package instruction

import (
	"errors"
	"fmt"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/wasm"
)

var AllSignatures [256]wasm.Signature
var DivZero error
var FunctionSignature error
var MemAccess error
var StackOverflow error
var UndefinedElement error
var UninitializedElement error
var Unreachable error

func initSignature(opcode byte, mnemonic string, result value.Type, arg1 value.Type, arg2 value.Type, factory func() wasm.Instruction) {
	sig := &AllSignatures[opcode]
	sig.NewSignature(mnemonic, result, arg1, arg2, factory)
}

func newBinary(opcode byte, mnemonic string) {
	arg := valueTypeOf(mnemonic[0:3])
	initSignature(opcode, mnemonic, arg, arg, arg, NewBinary)
}

func newBlock(opcode byte, mnemonic string) {
	arg := value.NONE
	switch opcode {
	case op.IF:
		arg = value.I32
	}
	initSignature(opcode, mnemonic, value.NONE, arg, value.NONE, NewBlock)
}

func newBool(opcode byte, mnemonic string) {
	arg := valueTypeOf(mnemonic[0:3])
	initSignature(opcode, mnemonic, value.I32, arg, arg, NewBool)
}

func newBranch(opcode byte, mnemonic string) {
	arg := value.NONE
	switch opcode {
	case op.BR_IF, op.BR_TABLE:
		arg = value.I32
	}
	initSignature(opcode, mnemonic, value.NONE, arg, value.NONE, NewBranch)
}

func newCall(opcode byte, mnemonic string) {
	arg := value.I32
	result := value.NONE
	switch opcode {
	case op.CALL:
		arg = value.NONE
	case op.MEMORY_SIZE:
		arg = value.NONE
		result = value.I32
	case op.MEMORY_GROW:
		result = value.I32
	}
	initSignature(opcode, mnemonic, result, arg, value.NONE, NewCall)
}

func newConst(opcode byte, mnemonic string) {
	result := valueTypeOf(mnemonic[0:3])
	initSignature(opcode, mnemonic, result, value.NONE, value.NONE, NewConst)
}

func newConvert(opcode byte, mnemonic string) {
	result := valueTypeOf(mnemonic[0:3])
	inType := len(mnemonic) - 5
	if mnemonic[inType+3] != '_' {
		inType += 2
	}
	arg := valueTypeOf(mnemonic[inType : inType+3])
	initSignature(opcode, mnemonic, result, arg, value.NONE, NewConvert)
}

func newLoad(opcode byte, mnemonic string, align byte) {
	result := valueTypeOf(mnemonic[0:3])
	initSignature(opcode, mnemonic, result, value.I32, value.NONE, NewMem)
	AllSignatures[opcode].Align = align
}

func newMisc(opcode byte, mnemonic string) {
	arg := value.NONE
	switch opcode {
	case op.SELECT:
		arg = value.I32
	}
	initSignature(opcode, mnemonic, value.NONE, arg, value.NONE, NewMisc)
	switch opcode {
	case op.SELECT:
		AllSignatures[opcode].StackChange = -2
	}
}

func newStore(opcode byte, mnemonic string, align byte) {
	arg := valueTypeOf(mnemonic[0:3])
	initSignature(opcode, mnemonic, value.NONE, value.I32, arg, NewMem)
	AllSignatures[opcode].Align = align
}

func newUnary(opcode byte, mnemonic string) {
	arg := valueTypeOf(mnemonic[0:3])
	result := arg
	switch opcode {
	case op.I64_EQZ:
		result = value.I32
	}
	initSignature(opcode, mnemonic, result, arg, value.NONE, NewUnary)
}

func newVar(opcode byte, mnemonic string) {
	initSignature(opcode, mnemonic, value.NONE, value.NONE, value.NONE, NewVar)
	switch opcode {
	case op.LOCAL_GET, op.GLOBAL_GET:
		AllSignatures[opcode].StackChange = 1
	case op.LOCAL_SET, op.GLOBAL_SET:
		AllSignatures[opcode].StackChange = -1
	}
}

func valueTypeOf(typeName string) value.Type {
	switch typeName {
	//@formatter:off
	case "i32": return value.I32
	case "i64": return value.I64
	case "f32": return value.F32
	case "f64": return value.F64
	//@formatter:on
	default:
		panic(fmt.Sprintf("Invalid value type name: %s", typeName))
	}
}

func init() {
	DivZero = errors.New("integer divide by zero")
	FunctionSignature = errors.New("indirect call type mismatch")
	MemAccess = errors.New("out of bounds memory access")
	StackOverflow = errors.New("call stack exhausted")
	UndefinedElement = errors.New("undefined element")
	UninitializedElement = errors.New("uninitialized element")
	Unreachable = errors.New("Unreachable")

	newMisc(op.UNREACHABLE, "unreachable")
	newMisc(op.NOP, "nop")
	newBlock(op.BLOCK, "block")
	newBlock(op.LOOP, "loop")
	newBlock(op.IF, "if")
	newMisc(op.ELSE, "else")
	newMisc(op.END, "end")

	newBranch(op.BR, "br")
	newBranch(op.BR_IF, "br_if")
	newBranch(op.BR_TABLE, "br_table")
	newBranch(op.RETURN, "return")

	newCall(op.CALL, "call")
	newCall(op.CALL_INDIRECT, "call_indirect")

	newMisc(op.DROP, "drop")
	newMisc(op.SELECT, "select")

	newVar(op.LOCAL_GET, "local.get")
	newVar(op.LOCAL_SET, "local.set")
	newVar(op.LOCAL_TEE, "local.tee")
	newVar(op.GLOBAL_GET, "global.get")
	newVar(op.GLOBAL_SET, "global.set")

	newLoad(op.I32_LOAD, "i32.load", 2)
	newLoad(op.I64_LOAD, "i64.load", 3)
	newLoad(op.F32_LOAD, "f32.load", 2)
	newLoad(op.F64_LOAD, "f64.load", 3)
	newLoad(op.I32_LOAD8_S, "i32.load8_s", 0)
	newLoad(op.I32_LOAD8_U, "i32.load8_u", 0)
	newLoad(op.I32_LOAD16_S, "i32.load16_s", 1)
	newLoad(op.I32_LOAD16_U, "i32.load16_u", 1)
	newLoad(op.I64_LOAD8_S, "i64.load8_s", 0)
	newLoad(op.I64_LOAD8_U, "i64.load8_u", 0)
	newLoad(op.I64_LOAD16_S, "i64.load16_s", 1)
	newLoad(op.I64_LOAD16_U, "i64.load16_u", 1)
	newLoad(op.I64_LOAD32_S, "i64.load32_s", 2)
	newLoad(op.I64_LOAD32_U, "i64.load32_u", 2)

	newStore(op.I32_STORE, "i32.store", 2)
	newStore(op.I64_STORE, "i64.store", 3)
	newStore(op.F32_STORE, "f32.store", 2)
	newStore(op.F64_STORE, "f64.store", 3)
	newStore(op.I32_STORE8, "i32.store8", 0)
	newStore(op.I32_STORE16, "i32.store16", 1)
	newStore(op.I64_STORE8, "i64.store8", 0)
	newStore(op.I64_STORE16, "i64.store16", 1)
	newStore(op.I64_STORE32, "i64.store32", 2)

	newCall(op.MEMORY_SIZE, "memory.size")
	newCall(op.MEMORY_GROW, "memory.grow")

	newConst(op.I32_CONST, "i32.const")
	newConst(op.I64_CONST, "i64.const")
	newConst(op.F32_CONST, "f32.const")
	newConst(op.F64_CONST, "f64.const")

	newUnary(op.I32_EQZ, "i32.eqz")
	newBool(op.I32_EQ, "i32.eq")
	newBool(op.I32_NE, "i32.ne")
	newBool(op.I32_LT_S, "i32.lt_s")
	newBool(op.I32_LT_U, "i32.lt_u")
	newBool(op.I32_GT_S, "i32.gt_s")
	newBool(op.I32_GT_U, "i32.gt_u")
	newBool(op.I32_LE_S, "i32.le_s")
	newBool(op.I32_LE_U, "i32.le_u")
	newBool(op.I32_GE_S, "i32.ge_s")
	newBool(op.I32_GE_U, "i32.ge_u")

	newUnary(op.I64_EQZ, "i64.eqz")
	newBool(op.I64_EQ, "i64.eq")
	newBool(op.I64_NE, "i64.ne")
	newBool(op.I64_LT_S, "i64.lt_s")
	newBool(op.I64_LT_U, "i64.lt_u")
	newBool(op.I64_GT_S, "i64.gt_s")
	newBool(op.I64_GT_U, "i64.gt_u")
	newBool(op.I64_LE_S, "i64.le_s")
	newBool(op.I64_LE_U, "i64.le_u")
	newBool(op.I64_GE_S, "i64.ge_s")
	newBool(op.I64_GE_U, "i64.ge_u")

	newBool(op.F32_EQ, "f32.eq")
	newBool(op.F32_NE, "f32.ne")
	newBool(op.F32_LT, "f32.lt")
	newBool(op.F32_GT, "f32.gt")
	newBool(op.F32_LE, "f32.le")
	newBool(op.F32_GE, "f32.ge")

	newBool(op.F64_EQ, "f64.eq")
	newBool(op.F64_NE, "f64.ne")
	newBool(op.F64_LT, "f64.lt")
	newBool(op.F64_GT, "f64.gt")
	newBool(op.F64_LE, "f64.le")
	newBool(op.F64_GE, "f64.ge")

	newUnary(op.I32_CLZ, "i32.clz")
	newUnary(op.I32_CTZ, "i32.ctz")
	newUnary(op.I32_POPCNT, "i32.popcnt")

	newBinary(op.I32_ADD, "i32.add")
	newBinary(op.I32_SUB, "i32.sub")
	newBinary(op.I32_MUL, "i32.mul")
	newBinary(op.I32_DIV_S, "i32.div_s")
	newBinary(op.I32_DIV_U, "i32.div_u")
	newBinary(op.I32_REM_S, "i32.rem_s")
	newBinary(op.I32_REM_U, "i32.rem_u")
	newBinary(op.I32_AND, "i32.and")
	newBinary(op.I32_OR, "i32.or")
	newBinary(op.I32_XOR, "i32.xor")
	newBinary(op.I32_SHL, "i32.shl")
	newBinary(op.I32_SHR_S, "i32.shr_s")
	newBinary(op.I32_SHR_U, "i32.shr_u")
	newBinary(op.I32_ROTL, "i32.rotl")
	newBinary(op.I32_ROTR, "i32.rotr")

	newUnary(op.I64_CLZ, "i64.clz")
	newUnary(op.I64_CTZ, "i64.ctz")
	newUnary(op.I64_POPCNT, "i64.popcnt")

	newBinary(op.I64_ADD, "i64.add")
	newBinary(op.I64_SUB, "i64.sub")
	newBinary(op.I64_MUL, "i64.mul")
	newBinary(op.I64_DIV_S, "i64.div_s")
	newBinary(op.I64_DIV_U, "i64.div_u")
	newBinary(op.I64_REM_S, "i64.rem_s")
	newBinary(op.I64_REM_U, "i64.rem_u")
	newBinary(op.I64_AND, "i64.and")
	newBinary(op.I64_OR, "i64.or")
	newBinary(op.I64_XOR, "i64.xor")
	newBinary(op.I64_SHL, "i64.shl")
	newBinary(op.I64_SHR_S, "i64.shr_s")
	newBinary(op.I64_SHR_U, "i64.shr_u")
	newBinary(op.I64_ROTL, "i64.rotl")
	newBinary(op.I64_ROTR, "i64.rotr")

	newUnary(op.F32_ABS, "f32.abs")
	newUnary(op.F32_NEG, "f32.neg")
	newUnary(op.F32_CEIL, "f32.ceil")
	newUnary(op.F32_FLOOR, "f32.floor")
	newUnary(op.F32_TRUNC, "f32.trunc")
	newUnary(op.F32_NEAREST, "f32.nearest")
	newUnary(op.F32_SQRT, "f32.sqrt")

	newBinary(op.F32_ADD, "f32.add")
	newBinary(op.F32_SUB, "f32.sub")
	newBinary(op.F32_MUL, "f32.mul")
	newBinary(op.F32_DIV, "f32.div")
	newBinary(op.F32_MIN, "f32.min")
	newBinary(op.F32_MAX, "f32.max")
	newBinary(op.F32_COPYSIGN, "f32.copysign")

	newUnary(op.F64_ABS, "f64.abs")
	newUnary(op.F64_NEG, "f64.neg")
	newUnary(op.F64_CEIL, "f64.ceil")
	newUnary(op.F64_FLOOR, "f64.floor")
	newUnary(op.F64_TRUNC, "f64.trunc")
	newUnary(op.F64_NEAREST, "f64.nearest")
	newUnary(op.F64_SQRT, "f64.sqrt")

	newBinary(op.F64_ADD, "f64.add")
	newBinary(op.F64_SUB, "f64.sub")
	newBinary(op.F64_MUL, "f64.mul")
	newBinary(op.F64_DIV, "f64.div")
	newBinary(op.F64_MIN, "f64.min")
	newBinary(op.F64_MAX, "f64.max")
	newBinary(op.F64_COPYSIGN, "f64.copysign")

	newConvert(op.I32_WRAP_I64, "i32.wrap_i64")
	newConvert(op.I32_TRUNC_F32_S, "i32.trunc_f32_s")
	newConvert(op.I32_TRUNC_F32_U, "i32.trunc_f32_u")
	newConvert(op.I32_TRUNC_F64_S, "i32.trunc_f64_s")
	newConvert(op.I32_TRUNC_F64_U, "i32.trunc_f64_u")
	newConvert(op.I64_EXTEND_I32_S, "i64.extend_i32_s")
	newConvert(op.I64_EXTEND_I32_U, "i64.extend_i32_u")
	newConvert(op.I64_TRUNC_F32_S, "i64.trunc_f32_s")
	newConvert(op.I64_TRUNC_F32_U, "i64.trunc_f32_u")
	newConvert(op.I64_TRUNC_F64_S, "i64.trunc_f64_s")
	newConvert(op.I64_TRUNC_F64_U, "i64.trunc_f64_u")
	newConvert(op.F32_CONVERT_I32_S, "f32.convert_i32_s")
	newConvert(op.F32_CONVERT_I32_U, "f32.convert_i32_u")
	newConvert(op.F32_CONVERT_I64_S, "f32.convert_i64_s")
	newConvert(op.F32_CONVERT_I64_U, "f32.convert_i64_u")
	newConvert(op.F32_DEMOTE_F64, "f32.demote_f64")
	newConvert(op.F64_CONVERT_I32_S, "f64.convert_i32_s")
	newConvert(op.F64_CONVERT_I32_U, "f64.convert_i32_u")
	newConvert(op.F64_CONVERT_I64_S, "f64.convert_i64_s")
	newConvert(op.F64_CONVERT_I64_U, "f64.convert_i64_u")
	newConvert(op.F64_PROMOTE_F32, "f64.promote_f32")

	newConvert(op.I32_REINTERPRET_F32, "i32.reinterpret_f32")
	newConvert(op.I64_REINTERPRET_F64, "i64.reinterpret_f64")
	newConvert(op.F32_REINTERPRET_I32, "f32.reinterpret_i32")
	newConvert(op.F64_REINTERPRET_I64, "f64.reinterpret_i64")

	newUnary(op.I32_EXTEND8_S, "i32.extend8_s")
	newUnary(op.I32_EXTEND16_S, "i32.extend16_s")
	newUnary(op.I64_EXTEND8_S, "i64.extend8_s")
	newUnary(op.I64_EXTEND16_S, "i64.extend16_s")
	newUnary(op.I64_EXTEND32_S, "i64.extend32_s")
}
