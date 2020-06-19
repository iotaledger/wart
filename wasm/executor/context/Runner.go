package context

import (
	"github.com/iotaledger/wart/wasm/wasm"
)

const PAGE_SIZE = 0x10000

type Runner struct {
	Addr      uint32
	CallDepth int
	Error     error
	Frame     []wasm.Variable
	Globals   []wasm.Variable
	Memory    *wasm.Memory
	Module    *wasm.Module
	Next      wasm.Instruction
	SP        int
	Table     *wasm.Table
}

func NewRunner(m *wasm.Module) *Runner {
	return &Runner{Module: m}
}
