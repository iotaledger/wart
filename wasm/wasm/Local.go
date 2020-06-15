package wasm

import "github.com/iotaledger/wart/wasm/consts/value"

type Local struct {
	Identifier
	Type value.Type
}

func NewLocal() *Local {
	return &Local{}
}
