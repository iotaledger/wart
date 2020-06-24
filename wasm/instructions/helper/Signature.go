package helper

import (
	"github.com/iotaledger/wart/wasm/consts/value"
)

type Signature struct {
	Factory     func() Instruction
	Mnemonic    string
	Result      value.Type
	Arg1        value.Type
	Arg2        value.Type
	Align       byte
	StackChange int
}

func (s *Signature) NewSignature(mnemonic string, result value.Type, arg1 value.Type, arg2 value.Type, factory func() Instruction) {
	if s.Factory != nil {
		panic("Duplicate opcode byte value")
	}
	s.Factory = factory
	s.Mnemonic = mnemonic
	s.Result = result
	s.Arg1 = arg1
	s.Arg2 = arg2
	if s.Arg2 != value.NONE {
		s.StackChange--
	}
	if s.Arg1 != value.NONE {
		s.StackChange--
	}
	if s.Result != value.NONE {
		s.StackChange++
	}
}
