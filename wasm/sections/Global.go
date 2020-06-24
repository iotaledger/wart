package sections

import (
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/instructions/helper"
)

type Global struct {
	Identifier
	Init    []helper.Instruction
	Mutable bool
	Type    value.Type
}

func NewGlobal() *Global {
	return &Global{}
}
