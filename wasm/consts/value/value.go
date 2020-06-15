// Package value contains Wasm value type values.
// It also can generate their String() representations,
// and Check() them for validity.
package value

import (
	"errors"
	"fmt"
)

type Type byte

const (
	UNDEFINED      = ^uint32(0)
	NONE      Type = 0
	I32       Type = 0x7f
	I64       Type = 0x7e
	F32       Type = 0x7d
	F64       Type = 0x7c
)

func (vt Type) Check() error {
	switch vt {
	case I32, I64, F32, F64:
		return nil
	default:
		return errors.New(fmt.Sprintf("Invalid value type: 0x%02x", byte(vt)))
	}
}

func (vt Type) String() string {
	switch vt {
	//@formatter:off
	case NONE: return " - "
	case I32:  return "i32"
	case I64:  return "i64"
	case F32:  return "f32"
	case F64:  return "f64"
	//@formatter:on
	default:
		panic(fmt.Sprintf("Invalid value type: 0x%02x", byte(vt)))
	}
}
