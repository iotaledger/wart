package sections

import (
	"fmt"
	"github.com/iotaledger/wart/wasm/consts/value"
)

type Variable struct {
	I32 int32   `json:"i32"`
	F32 float32 `json:"f32"`
	I64 int64   `json:"i64"`
	F64 float64 `json:"f64"`
}

func (v *Variable) Copy(src *Variable, vt value.Type) {
	switch vt {
	//@formatter:off
	case value.I32: v.I32 = src.I32
	case value.I64: v.I64 = src.I64
	case value.F32: v.F32 = src.F32
	case value.F64: v.F64 = src.F64
	//@formatter:on
	default:
		panic(fmt.Sprintf("Invalid value type: 0x%02x", vt))
	}
}

func (v *Variable) Field(vt value.Type) string {
	switch vt {
	//@formatter:off
	case value.I32: return fmt.Sprintf("%v", v.I32)
	case value.I64: return fmt.Sprintf("%v", v.I64)
	case value.F32: return fmt.Sprintf("%v", v.F32)
	case value.F64: return fmt.Sprintf("%v", v.F64)
	//@formatter:on
	default:
		panic(fmt.Sprintf("Invalid value type: 0x%02x", vt))
	}
}

func (v *Variable) String() string {
	return fmt.Sprintf("i32=%d, f32=%f, i64=%d, f64=%f", v.I32, v.F32, v.I64, v.F64)
}
