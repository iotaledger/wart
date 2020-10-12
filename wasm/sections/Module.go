package sections

import (
	"github.com/iotaledger/wart/wasm/consts/value"
)

type Module struct {
	Identifier
	Analyzed          bool
	Customs           []*Custom
	Datas             []*Data
	Debug             bool
	Elements          []*Element
	Exports           []*Export
	ExternalFunctions uint32
	ExternalGlobals   uint32
	ExternalMemories  uint32
	ExternalTables    uint32
	Functions         []*Function
	FuncTypes         []*FuncType
	Globals           []*Global
	GlobalVars        []*Variable
	IsLinked          bool
	Memories          []*Memory
	Start             uint32
	Tables            []*Table
}

func NewModule() *Module {
	return &Module{Start: value.UNDEFINED}
}

func (m *Module) MaxExports() uint32 {
	return uint32(len(m.Exports))
}

func (m *Module) MaxFunctions() uint32 {
	return uint32(len(m.Functions))
}

func (m *Module) MaxFuncTypes() uint32 {
	return uint32(len(m.FuncTypes))
}

func (m *Module) MaxGlobals() uint32 {
	return uint32(len(m.Globals))
}

func (m *Module) MaxMemories() uint32 {
	return uint32(len(m.Memories))
}

func (m *Module) MaxTables() uint32 {
	return uint32(len(m.Tables))
}
