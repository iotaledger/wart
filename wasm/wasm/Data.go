package wasm

type Data struct {
	Identifier
	Bytes       []byte
	MemoryIndex uint32
	Offset      []Instruction
}

func NewData() *Data {
	return &Data{}
}
