package context

import (
	"github.com/iotaledger/wart/utils"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"github.com/iotaledger/wart/wasm/sections"
)

type Analyzer struct {
	BlockMark int
	Code      []helper.Instruction
	Error     error
	Frame     []value.Type
	FuncNr    uint32
	IP        int
	Labels    []*Label
	Locals    int
	MaxSP     int
	MinSP     int
	Module    *sections.Module
	SP        int
}

func NewAnalyzer(m *sections.Module, params []value.Type, locals []*sections.Local) *Analyzer {
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
	a.Error = utils.Error(format, args...)
}

func (a *Analyzer) Pop() value.Type {
	a.Error = nil
	if a.SP == a.BlockMark {
		if !a.Labels[0].Unreachable {
			a.Fail("type mismatch")
			return value.NONE
		}
		return value.NONE
	}
	a.SP--
	return a.Frame[a.SP]
}

func (a *Analyzer) PopExpected(expected value.Type) value.Type {
	actual := a.Pop()
	if a.Error != nil {
		return value.NONE
	}
	if actual == value.NONE {
		return expected
	}
	if actual != expected && expected != value.NONE {
		a.Fail("type mismatch")
		return value.NONE

	}
	return actual
}

func (a *Analyzer) PopMulti(values []value.Type) {
	for i := len(values) - 1; i >= 0; i-- {
		a.PopExpected(values[i])
		if a.Error != nil {
			return
		}
	}
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

func (a *Analyzer) PushMulti(values []value.Type) {
	for _, vt := range values {
		a.Push(vt)
	}
}
