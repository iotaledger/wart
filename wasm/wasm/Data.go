package wasm

type Data struct {
	Identifier
	Data        []byte
	MemoryIndex uint32
	Offset      []Instruction
}

func NewData() *Data {
	return &Data{}
}
