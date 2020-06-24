package context

import (
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"github.com/iotaledger/wart/wasm/sections"
)

type Label struct {
	BlockInst   helper.Instruction
	BlockType   *sections.FuncType
	HasElse     bool
	Target      helper.Instruction
	Unreachable bool
	UnwindSP    int
}

func NewLabel(blockType *sections.FuncType, target helper.Instruction) *Label {
	return &Label{BlockType: blockType, Target: target}
}
