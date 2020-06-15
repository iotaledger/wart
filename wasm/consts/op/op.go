// Package op contains Wasm instruction opcode values.
package op

const (
	UNREACHABLE byte = 0x00
	NOP         byte = 0x01
	BLOCK       byte = 0x02
	LOOP        byte = 0x03
	IF          byte = 0x04
	ELSE        byte = 0x05
	END         byte = 0x0b
	BR          byte = 0x0c
	BR_IF       byte = 0x0d
	BR_TABLE    byte = 0x0e
	RETURN      byte = 0x0f

	CALL          byte = 0x10
	CALL_INDIRECT byte = 0x11

	DROP   byte = 0x1a
	SELECT byte = 0x1b

	LOCAL_GET  byte = 0x20
	LOCAL_SET  byte = 0x21
	LOCAL_TEE  byte = 0x22
	GLOBAL_GET byte = 0x23
	GLOBAL_SET byte = 0x24

	I32_LOAD     byte = 0x28
	I64_LOAD     byte = 0x29
	F32_LOAD     byte = 0x2a
	F64_LOAD     byte = 0x2b
	I32_LOAD8_S  byte = 0x2c
	I32_LOAD8_U  byte = 0x2d
	I32_LOAD16_S byte = 0x2e
	I32_LOAD16_U byte = 0x2f
	I64_LOAD8_S  byte = 0x30
	I64_LOAD8_U  byte = 0x31
	I64_LOAD16_S byte = 0x32
	I64_LOAD16_U byte = 0x33
	I64_LOAD32_S byte = 0x34
	I64_LOAD32_U byte = 0x35
	I32_STORE    byte = 0x36
	I64_STORE    byte = 0x37
	F32_STORE    byte = 0x38
	F64_STORE    byte = 0x39
	I32_STORE8   byte = 0x3a
	I32_STORE16  byte = 0x3b
	I64_STORE8   byte = 0x3c
	I64_STORE16  byte = 0x3d
	I64_STORE32  byte = 0x3e

	MEMORY_SIZE byte = 0x3f
	MEMORY_GROW byte = 0x40

	I32_CONST byte = 0x41
	I64_CONST byte = 0x42
	F32_CONST byte = 0x43
	F64_CONST byte = 0x44

	I32_EQZ  byte = 0x45
	I32_EQ   byte = 0x46
	I32_NE   byte = 0x47
	I32_LT_S byte = 0x48
	I32_LT_U byte = 0x49
	I32_GT_S byte = 0x4a
	I32_GT_U byte = 0x4b
	I32_LE_S byte = 0x4c
	I32_LE_U byte = 0x4d
	I32_GE_S byte = 0x4e
	I32_GE_U byte = 0x4f

	I64_EQZ  byte = 0x50
	I64_EQ   byte = 0x51
	I64_NE   byte = 0x52
	I64_LT_S byte = 0x53
	I64_LT_U byte = 0x54
	I64_GT_S byte = 0x55
	I64_GT_U byte = 0x56
	I64_LE_S byte = 0x57
	I64_LE_U byte = 0x58
	I64_GE_S byte = 0x59
	I64_GE_U byte = 0x5a

	F32_EQ byte = 0x5b
	F32_NE byte = 0x5c
	F32_LT byte = 0x5d
	F32_GT byte = 0x5e
	F32_LE byte = 0x5f
	F32_GE byte = 0x60

	F64_EQ byte = 0x61
	F64_NE byte = 0x62
	F64_LT byte = 0x63
	F64_GT byte = 0x64
	F64_LE byte = 0x65
	F64_GE byte = 0x66

	I32_CLZ    byte = 0x67
	I32_CTZ    byte = 0x68
	I32_POPCNT byte = 0x69
	I32_ADD    byte = 0x6a
	I32_SUB    byte = 0x6b
	I32_MUL    byte = 0x6c
	I32_DIV_S  byte = 0x6d
	I32_DIV_U  byte = 0x6e
	I32_REM_S  byte = 0x6f
	I32_REM_U  byte = 0x70
	I32_AND    byte = 0x71
	I32_OR     byte = 0x72
	I32_XOR    byte = 0x73
	I32_SHL    byte = 0x74
	I32_SHR_S  byte = 0x75
	I32_SHR_U  byte = 0x76
	I32_ROTL   byte = 0x77
	I32_ROTR   byte = 0x78

	I64_CLZ    byte = 0x79
	I64_CTZ    byte = 0x7a
	I64_POPCNT byte = 0x7b
	I64_ADD    byte = 0x7c
	I64_SUB    byte = 0x7d
	I64_MUL    byte = 0x7e
	I64_DIV_S  byte = 0x7f
	I64_DIV_U  byte = 0x80
	I64_REM_S  byte = 0x81
	I64_REM_U  byte = 0x82
	I64_AND    byte = 0x83
	I64_OR     byte = 0x84
	I64_XOR    byte = 0x85
	I64_SHL    byte = 0x86
	I64_SHR_S  byte = 0x87
	I64_SHR_U  byte = 0x88
	I64_ROTL   byte = 0x89
	I64_ROTR   byte = 0x8a

	F32_ABS      byte = 0x8b
	F32_NEG      byte = 0x8c
	F32_CEIL     byte = 0x8d
	F32_FLOOR    byte = 0x8e
	F32_TRUNC    byte = 0x8f
	F32_NEAREST  byte = 0x90
	F32_SQRT     byte = 0x91
	F32_ADD      byte = 0x92
	F32_SUB      byte = 0x93
	F32_MUL      byte = 0x94
	F32_DIV      byte = 0x95
	F32_MIN      byte = 0x96
	F32_MAX      byte = 0x97
	F32_COPYSIGN byte = 0x98

	F64_ABS      byte = 0x99
	F64_NEG      byte = 0x9a
	F64_CEIL     byte = 0x9b
	F64_FLOOR    byte = 0x9c
	F64_TRUNC    byte = 0x9d
	F64_NEAREST  byte = 0x9e
	F64_SQRT     byte = 0x9f
	F64_ADD      byte = 0xa0
	F64_SUB      byte = 0xa1
	F64_MUL      byte = 0xa2
	F64_DIV      byte = 0xa3
	F64_MIN      byte = 0xa4
	F64_MAX      byte = 0xa5
	F64_COPYSIGN byte = 0xa6

	I32_WRAP_I64      byte = 0xa7
	I32_TRUNC_F32_S   byte = 0xa8
	I32_TRUNC_F32_U   byte = 0xa9
	I32_TRUNC_F64_S   byte = 0xaa
	I32_TRUNC_F64_U   byte = 0xab
	I64_EXTEND_I32_S  byte = 0xac
	I64_EXTEND_I32_U  byte = 0xad
	I64_TRUNC_F32_S   byte = 0xae
	I64_TRUNC_F32_U   byte = 0xaf
	I64_TRUNC_F64_S   byte = 0xb0
	I64_TRUNC_F64_U   byte = 0xb1
	F32_CONVERT_I32_S byte = 0xb2
	F32_CONVERT_I32_U byte = 0xb3
	F32_CONVERT_I64_S byte = 0xb4
	F32_CONVERT_I64_U byte = 0xb5
	F32_DEMOTE_F64    byte = 0xb6
	F64_CONVERT_I32_S byte = 0xb7
	F64_CONVERT_I32_U byte = 0xb8
	F64_CONVERT_I64_S byte = 0xb9
	F64_CONVERT_I64_U byte = 0xba
	F64_PROMOTE_F32   byte = 0xbb

	I32_REINTERPRET_F32 byte = 0xbc
	I64_REINTERPRET_F64 byte = 0xbd
	F32_REINTERPRET_I32 byte = 0xbe
	F64_REINTERPRET_I64 byte = 0xbf

	I32_EXTEND8_S  byte = 0xc0
	I32_EXTEND16_S byte = 0xc1
	I64_EXTEND8_S  byte = 0xc2
	I64_EXTEND16_S byte = 0xc3
	I64_EXTEND32_S byte = 0xc4

	// todo: properly add these
	TRUNC_PREFIX byte = 0xfc
	// note: actual opcodes are two bytes
	// but we encode them as single byte
	// 0xf<n> is actually be 0xfc 0x0<n>
	I32_TRUNC_SAT_F32_S byte = 0xf0
	I32_TRUNC_SAT_F32_U byte = 0xf1
	I32_TRUNC_SAT_F64_S byte = 0xf2
	I32_TRUNC_SAT_F64_U byte = 0xf3
	I64_TRUNC_SAT_F32_S byte = 0xf4
	I64_TRUNC_SAT_F32_U byte = 0xf5
	I64_TRUNC_SAT_F64_S byte = 0xf6
	I64_TRUNC_SAT_F64_U byte = 0xf7
)
