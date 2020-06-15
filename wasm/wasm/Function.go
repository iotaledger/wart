package wasm

type Function struct {
	Identifier
	Body      []Instruction
	FrameSize uint32
	Locals    []*Local
	Type      *FuncType
}

func NewFunction() *Function {
	return &Function{}
}

func (f *Function) MaxLocalIndex() uint32 {
	return uint32(len(f.Type.ParamTypes) + len(f.Locals))
}
