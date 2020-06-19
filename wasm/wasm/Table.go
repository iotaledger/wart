package wasm

type Table struct {
	Identifier
	FuncIndexes []uint32
	ElemType    byte
	Max         uint32
	Min         uint32
}

func NewTable() *Table {
	return &Table{}
}
