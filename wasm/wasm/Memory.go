package wasm

type Memory struct {
	Identifier
	Data []byte
	Max  uint32
	Min  uint32
}

func NewMemory() *Memory {
	return &Memory{}
}
