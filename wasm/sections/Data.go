package sections

import "github.com/iotaledger/wart/wasm/instructions/helper"

type Data struct {
	Identifier
	Bytes       []byte
	MemoryIndex uint32
	Offset      []helper.Instruction
}

func NewData() *Data {
	return &Data{}
}
