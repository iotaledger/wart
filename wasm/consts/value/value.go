// Package value contains Wasm data type values.
// It also can generate their String() representations,
// and Check() them for validity.
package value

//todo rename to val in tandem with Java version after implementing changes in Java

import (
	"github.com/iotaledger/wart/utils"
)

type DataType byte

const (
	UNDEFINED          = ^uint32(0)
	NONE      DataType = 0
	I32       DataType = 0x7f
	I64       DataType = 0x7e
	F32       DataType = 0x7d
	F64       DataType = 0x7c
)

func (dt DataType) Check() error {
	switch dt {
	case I32, I64, F32, F64:
		return nil
	default:
		return utils.Error("Invalid data type: 0x%02x", byte(dt))
	}
}

func (dt DataType) String() string {
	switch dt {
	//@formatter:off
	case NONE: return " - "
	case I32:  return "i32"
	case I64:  return "i64"
	case F32:  return "f32"
	case F64:  return "f64"
	//@formatter:on
	default:
		panic("Invalid data type")
	}
}
