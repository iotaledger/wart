package wasm

type Custom struct {
	Identifier
	Data      []byte
	SectionId byte
}

func NewCustom() *Custom {
	return &Custom{}
}
