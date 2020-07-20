package context

import (
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"github.com/iotaledger/wart/wasm/sections"
)

const PAGE_SIZE = 0x10000

type Runner struct {
	Addr         uint32
	Buffer       []byte
	CallDepth    int
	Error        error
	Frame        []sections.Variable
	Module       *sections.Module
	Next         helper.Instruction
	OuterContext interface{}
	SP           int
}

func NewRunner(m *sections.Module, outerContext interface{}) *Runner {
	return &Runner{Module: m, OuterContext: outerContext}
}
