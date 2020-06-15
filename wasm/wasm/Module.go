package wasm

import "github.com/iotaledger/wart/wasm/consts/value"

type Module struct {
	Identifier
	Analyzed  bool
	Customs   []*Custom
	Datas     []*Data
	Debug     bool
	Elements  []*Element
	Exports   []*Export
	External  Entities
	FuncTypes []*FuncType
	Internal  Entities
	Start     uint32
}

func NewModule() *Module {
	return &Module{Start: value.UNDEFINED}
}

func (m *Module) MaxFunctions() uint32 {
	return uint32(len(m.Internal.Functions))
}

func (m *Module) MaxFuncTypes() uint32 {
	return uint32(len(m.FuncTypes))
}

func (m *Module) MaxGlobals() uint32 {
	return uint32(len(m.Internal.Globals))
}

func (m *Module) MaxMemories() uint32 {
	return uint32(len(m.Internal.Memories))
}

func (m *Module) MaxTables() uint32 {
	return uint32(len(m.Internal.Tables))
}
