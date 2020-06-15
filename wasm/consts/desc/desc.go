// Package desc contains Wasm import/export type descriptor values.
// It also can generate their String() representations.
package desc

import "fmt"

type Type byte

const (
	FUNC   Type = 0x00
	TABLE  Type = 0x01
	MEM    Type = 0x02
	GLOBAL Type = 0x03
)

func (t Type) String() string {
	switch t {
	//@formatter:off
	case FUNC  : return "func"
	case TABLE : return "table"
	case MEM   : return "memory"
	case GLOBAL: return "global"
	//@formatter:on
	default:
		panic(fmt.Sprintf("Invalid descriptor: 0x%02x", byte(t)))
	}
}
