package wasm

type Element struct {
	Identifier
	FuncIndexes []uint32
	Offset      []Instruction
	TableIndex  uint32
}

func NewElement() *Element {
	return &Element{}
}
