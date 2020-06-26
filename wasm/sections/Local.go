package sections

import "github.com/iotaledger/wart/wasm/consts/value"

type Local struct {
	Identifier
	DataType value.DataType
}

func NewLocal() *Local {
	return &Local{}
}
