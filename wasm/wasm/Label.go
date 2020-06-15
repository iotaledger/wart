package wasm

type Label struct {
	BlockInst Instruction
	BlockType *FuncType
	OldMark   int
	Outer     bool
	Target    Instruction
	UnwindSP  int
}

func NewLabel(blockType *FuncType, target Instruction) *Label {
	return &Label{BlockType: blockType, Target: target}
}
