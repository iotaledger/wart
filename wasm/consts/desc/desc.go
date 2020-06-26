// Package desc contains Wasm import/export type descriptor values.
// It also can generate their String() representations.
package desc

type ExternalType byte

const (
	FUNC   ExternalType = 0x00
	TABLE  ExternalType = 0x01
	MEM    ExternalType = 0x02
	GLOBAL ExternalType = 0x03
)

func (et ExternalType) String() string {
	switch et {
	//@formatter:off
	case FUNC  : return "func"
	case TABLE : return "table"
	case MEM   : return "memory"
	case GLOBAL: return "global"
	//@formatter:on
	default:
		panic("Invalid external type")
	}
}
