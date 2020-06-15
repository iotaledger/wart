package wasm

type Table struct {
	Identifier
	Functions []*Function
	ElemType  byte
	Max       uint32
	Min       uint32
}

func NewTable() *Table {
	return &Table{}
}
