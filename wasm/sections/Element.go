package sections

import "github.com/iotaledger/wart/wasm/instructions/helper"

type Element struct {
	Identifier
	FuncIndexes []uint32
	Offset      []helper.Instruction
	TableIndex  uint32
}

func NewElement() *Element {
	return &Element{}
}
