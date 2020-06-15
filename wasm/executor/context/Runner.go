package context

import (
	"github.com/iotaledger/wart/wasm/wasm"
)

const PAGE_SIZE = 0x10000

type Runner struct {
	Addr      uint32
	CallDepth int
	Error     error
	Frame     []wasm.Value
	Globals   []wasm.Value
	MaxPages  uint32
	Memory    []byte
	Module    *wasm.Module
	Next      wasm.Instruction
	SP        int
}

func NewRunner(m *wasm.Module) *Runner {
	return &Runner{Module: m}
}
