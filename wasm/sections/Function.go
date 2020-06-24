package sections

import (
	"github.com/iotaledger/wart/wasm/instructions/helper"
)

type HostInterface func(f *Function, frame []Variable, sp int) error

type Function struct {
	Identifier
	Body      []helper.Instruction
	FrameSize uint32
	HostCall  HostInterface
	Locals    []*Local
	Module    *Module
	Type      *FuncType
}

func NewFunction() *Function {
	return &Function{}
}

func (f *Function) MaxLocalIndex() uint32 {
	return uint32(len(f.Type.ParamTypes) + len(f.Locals))
}
