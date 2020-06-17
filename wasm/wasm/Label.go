package wasm

type Label struct {
	BlockInst   Instruction
	BlockType   *FuncType
	Target      Instruction
	Unreachable bool
	UnwindSP    int
}

func NewLabel(blockType *FuncType, target Instruction) *Label {
	return &Label{BlockType: blockType, Target: target}
}
