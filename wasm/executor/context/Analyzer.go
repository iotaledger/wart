package context

import (
	"errors"
	"fmt"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/wasm"
)

type Analyzer struct {
	Module      *wasm.Module
	BlockMark   int
	Code        []wasm.Instruction
	Error       error
	FuncNr      uint32
	Frame       []value.Type
	IP          int
	Labels      []*wasm.Label
	Locals      int
	MaxSP       int
	MinSP       int
	ResultSP    int
	SP          int
	Unreachable bool
	UnwindSP    int
}

func NewAnalyzer(m *wasm.Module, params []value.Type, locals []*wasm.Local) *Analyzer {
	a := &Analyzer{}
	a.Module = m
	a.Locals = len(params) + len(locals)
	a.Frame = make([]value.Type, a.Locals)
	copy(a.Frame, params)
	for i, local := range locals {
		a.Frame[len(params)+i] = local.Type
	}
	a.SP = len(a.Frame)
	a.BlockMark = a.SP
	a.MinSP = a.SP
	a.MaxSP = a.SP
	a.FuncNr = value.UNDEFINED
	return a
}

func (a *Analyzer) Fail(format string, args ...interface{}) {
	a.Error = errors.New(fmt.Sprintf(format, args...))
}

func (a *Analyzer) Pop() value.Type {
	a.Error = nil
	if a.SP == a.BlockMark {
		a.Fail("Cannot pop from empty stack")
		return value.NONE
	}
	a.SP--
	return a.Frame[a.SP]
}

func (a *Analyzer) PopExpected(expected value.Type) value.Type {
	a.Error = nil
	if a.SP == a.BlockMark {
		if !a.Unreachable {
			a.Fail("Cannot pop from empty stack")
			return value.NONE
		}
		return expected
	}
	a.SP--
	return a.Frame[a.SP]
}

func (a *Analyzer) Push(val value.Type) {
	// expand frame capacity when necessary
	if a.SP == len(a.Frame) {
		a.Frame = append(a.Frame, val)
	}
	a.Frame[a.SP] = val
	a.SP++
	if a.SP > a.MaxSP {
		a.MaxSP = a.SP
	}
}
