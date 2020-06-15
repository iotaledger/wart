package wasm

import "github.com/iotaledger/wart/wasm/consts/value"

type Global struct {
	Identifier
	Init    []Instruction
	Mutable bool
	Type    value.Type
}

func NewGlobal() *Global {
	return &Global{}
}
