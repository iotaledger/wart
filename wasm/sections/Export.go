package sections

import "github.com/iotaledger/wart/wasm/consts/desc"

type Export struct {
	Identifier
	Index        uint32
	ExternalType desc.ExternalType
}

func NewExport() *Export {
	return &Export{}
}
