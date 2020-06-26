package sections

import (
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/instructions/helper"
)

type Global struct {
	Identifier
	Init     []helper.Instruction
	Mutable  bool
	DataType value.DataType
}

func NewGlobal() *Global {
	return &Global{}
}
