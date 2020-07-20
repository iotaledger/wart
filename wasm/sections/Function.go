package sections

import (
	"github.com/iotaledger/wart/wasm/instructions/helper"
)

type HostContext struct {
	Frame        []Variable
	Function     *Function
	OuterContext interface{}
	SP           int
}

type HostInterface func(ctx *HostContext) error

type Function struct {
	Identifier
	Body      []helper.Instruction
	FrameSize uint32
	FuncType  *FuncType
	HostCall  HostInterface
	Locals    []*Local
	Module    *Module
}

func NewFunction() *Function {
	return &Function{}
}

func (f *Function) MaxLocalIndex() uint32 {
	return uint32(len(f.FuncType.ParamTypes) + len(f.Locals))
}
