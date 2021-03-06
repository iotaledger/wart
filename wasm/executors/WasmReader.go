package executors

import (
	"fmt"
	"github.com/iotaledger/wart/utils"
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/consts/sec"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors/context"
	"github.com/iotaledger/wart/wasm/instructions"
	"github.com/iotaledger/wart/wasm/sections"
)

// test-guard-page-skip tests with 1056 i64 = 8448 bytes of locals
const MAX_LOCALS = 1060

// WasmReader is an executor that reads a binary Wasm file and converts
// it to a Module.
type WasmReader struct {
	m             *sections.Module
	r             *context.Reader
	prevSecId     byte
	sectionsDone  uint32
	functionCount uint32
	codeCount     uint32
}

func NewWasmReader(m *sections.Module, data []byte) *WasmReader {
	return &WasmReader{m: m, r: context.NewReader(m, data)}
}

func (ctx *WasmReader) entryCode(nr uint32) {
	nr += ctx.m.ExternalFunctions
	if nr >= ctx.m.MaxFunctions() {
		ctx.r.Error = utils.Error("function and code section have inconsistent lengths")
		return
	}
	function := ctx.m.Functions[nr]
	if function.Nr != nr {
		panic("Unexpected function")
	}
	rSaved := ctx.getSubReader()
	if ctx.r.Error != nil {
		return
	}
	count := ctx.r.GetU32()
	if ctx.r.Error != nil {
		return
	}
	for ; count != 0; count-- {
		n := ctx.r.GetU32()
		if ctx.r.Error != nil {
			return
		}
		if /* n < 0 || */ n > MAX_LOCALS {
			ctx.r.Error = utils.Error("too many locals")
			return
		}
		dataType := ctx.r.GetDataType()
		if ctx.r.Error != nil {
			return
		}
		for ; n != 0; n-- {
			local := sections.NewLocal()
			local.DataType = dataType
			local.Nr = uint32(len(function.Locals))
			function.Locals = append(function.Locals, local)
		}
	}

	function.Body = instructions.ReadBlock(ctx.r)
	if ctx.r.Error != nil {
		return
	}
	if ctx.r.Size() != 0 {
		ctx.r.Error = utils.Error("Function body not entirely processed")
		return
	}
	ctx.r = rSaved
}

func (ctx *WasmReader) entryData() {
	data := sections.NewData()
	data.MemoryIndex = ctx.r.GetU32()
	if ctx.r.Error != nil {
		return
	}
	data.Offset = instructions.ReadBlock(ctx.r)
	if ctx.r.Error != nil {
		return
	}
	count := ctx.r.GetU32()
	if ctx.r.Error != nil {
		return
	}
	data.Bytes = ctx.r.GetBytes(count)
	if ctx.r.Error != nil {
		return
	}
	data.Nr = uint32(len(ctx.m.Datas))
	ctx.m.Datas = append(ctx.m.Datas, data)
}

func (ctx *WasmReader) entryElement() {
	element := sections.NewElement()
	element.TableIndex = ctx.r.GetU32()
	if ctx.r.Error != nil {
		return
	}
	element.Offset = instructions.ReadBlock(ctx.r)
	if ctx.r.Error != nil {
		return
	}
	count := ctx.r.GetU32()
	if ctx.r.Error != nil {
		return
	}
	for ; count != 0; count-- {
		index := ctx.r.GetU32()
		if ctx.r.Error != nil {
			return
		}
		if /* index < 0 || */ index >= ctx.m.MaxFunctions() {
			ctx.r.Error = utils.Error("unknown function")
			return
		}
		element.FuncIndexes = append(element.FuncIndexes, index)
	}
	element.Nr = uint32(len(ctx.m.Elements))
	ctx.m.Elements = append(ctx.m.Elements, element)
}

func (ctx *WasmReader) entryExport() {
	export := sections.NewExport()
	export.ImportName = ctx.r.GetString()
	if ctx.r.Error != nil {
		return
	}
	descId := ctx.r.GetByte()
	if ctx.r.Error != nil {
		return
	}
	export.ExternalType = desc.ExternalType(descId)
	export.Index = ctx.r.GetU32()
	if ctx.r.Error != nil {
		return
	}
	switch export.ExternalType {
	case desc.FUNC:
		if /* export.Index < 0 || */ export.Index >= ctx.m.MaxFunctions() {
			ctx.r.Error = utils.Error("unknown function")
			return
		}
	case desc.GLOBAL:
		if /* export.Index < 0 || */ export.Index >= ctx.m.MaxGlobals() {
			ctx.r.Error = utils.Error("unknown global")
			return
		}
	case desc.MEM:
		if /* export.Index < 0 || */ export.Index >= ctx.m.MaxMemories() {
			ctx.r.Error = utils.Error("unknown memory")
			return
		}
	case desc.TABLE:
		if /* export.Index < 0 || */ export.Index >= ctx.m.MaxTables() {
			ctx.r.Error = utils.Error("unknown table")
			return
		}
	default:
		ctx.r.Error = utils.Error("Invalid export descriptor: 0x%02x", descId)
		return
	}
	export.Nr = ctx.m.MaxExports()
	ctx.m.Exports = append(ctx.m.Exports, export)
}

func (ctx *WasmReader) entryFunction() {
	function := sections.NewFunction()
	ctx.readFunction(function)
	if ctx.r.Error != nil {
		return
	}
	function.Nr = ctx.m.MaxFunctions()
	ctx.m.Functions = append(ctx.m.Functions, function)
}

func (ctx *WasmReader) entryGlobal() {
	global := sections.NewGlobal()
	ctx.readGlobal(global)
	if ctx.r.Error != nil {
		return
	}
	global.Init = instructions.ReadBlock(ctx.r)
	if ctx.r.Error != nil {
		return
	}
	global.Nr = ctx.m.MaxGlobals()
	ctx.m.Globals = append(ctx.m.Globals, global)
}

func (ctx *WasmReader) entryImport() {
	module := ctx.r.GetString()
	if ctx.r.Error != nil {
		return
	}
	name := ctx.r.GetString()
	if ctx.r.Error != nil {
		return
	}
	descId := ctx.r.GetByte()
	if ctx.r.Error != nil {
		return
	}
	switch desc.ExternalType(descId) {
	case desc.FUNC:
		function := sections.NewFunction()
		function.ModuleName = module
		function.ImportName = name
		ctx.readFunction(function)
		if ctx.r.Error != nil {
			return
		}
		function.Nr = ctx.m.MaxFunctions()
		ctx.m.Functions = append(ctx.m.Functions, function)
		ctx.m.ExternalFunctions = uint32(len(ctx.m.Functions))
	case desc.GLOBAL:
		global := sections.NewGlobal()
		global.ModuleName = module
		global.ImportName = name
		ctx.readGlobal(global)
		if ctx.r.Error != nil {
			return
		}
		global.Nr = ctx.m.MaxGlobals()
		ctx.m.Globals = append(ctx.m.Globals, global)
		ctx.m.ExternalGlobals = uint32(len(ctx.m.Globals))
	case desc.MEM:
		memory := sections.NewMemory()
		memory.ModuleName = module
		memory.ImportName = name
		ctx.r.GetLimits()
		if ctx.r.Error != nil {
			return
		}
		if ctx.r.Min < 0 || ctx.r.Min > 0x10000 || (ctx.r.Flag == 0x01 && (ctx.r.Max < 0 || ctx.r.Max > 0x10000)) {
			ctx.r.Error = utils.Error("memory size must be at most 65536 pages (4GiB)")
			return
		}
		memory.Min = ctx.r.Min
		memory.Max = ctx.r.Max
		memory.Nr = ctx.m.MaxMemories()
		ctx.m.Memories = append(ctx.m.Memories, memory)
		if len(ctx.m.Memories) > 1 {
			ctx.r.Error = utils.Error("multiple memories")
			return
		}
		ctx.m.ExternalMemories = uint32(len(ctx.m.Memories))
	case desc.TABLE:
		table := sections.NewTable()
		table.ModuleName = module
		table.ImportName = name
		ctx.readTable(table)
		if ctx.r.Error != nil {
			return
		}
		table.Nr = ctx.m.MaxTables()
		ctx.m.Tables = append(ctx.m.Tables, table)
		if len(ctx.m.Tables) > 1 {
			ctx.r.Error = utils.Error("multiple tables")
			return
		}
		ctx.m.ExternalTables = uint32(len(ctx.m.Tables))
	default:
		ctx.r.Error = utils.Error("Invalid import descriptor: 0x%02x", descId)
	}
}

func (ctx *WasmReader) entryMemory() {
	memory := sections.NewMemory()
	ctx.r.GetLimits()
	if ctx.r.Error != nil {
		return
	}
	if ctx.r.Min < 0 || ctx.r.Min > 0x10000 || (ctx.r.Flag == 0x01 && (ctx.r.Max < 0 || ctx.r.Max > 0x10000)) {
		ctx.r.Error = utils.Error("memory size must be at most 65536 pages (4GiB)")
		return
	}
	memory.Min = ctx.r.Min
	memory.Max = ctx.r.Max
	memory.Nr = ctx.m.MaxMemories()
	ctx.m.Memories = append(ctx.m.Memories, memory)
	if len(ctx.m.Memories) > 1 {
		ctx.r.Error = utils.Error("multiple memories")
		return
	}
}

func (ctx *WasmReader) entryTable() {
	table := sections.NewTable()
	ctx.readTable(table)
	if ctx.r.Error != nil {
		return
	}
	table.Nr = ctx.m.MaxTables()
	ctx.m.Tables = append(ctx.m.Tables, table)
	if len(ctx.m.Tables) > 1 {
		ctx.r.Error = utils.Error("multiple tables")
		return
	}
}

func (ctx *WasmReader) entryType() {
	funcType := sections.NewFuncType()
	tag := ctx.r.GetByte()
	if ctx.r.Error != nil {
		return
	}
	if tag != 0x60 {
		ctx.r.Error = utils.Error("Expected TypeUnit tag 0x60")
		return
	}
	funcType.ParamTypes = ctx.r.GetDataTypes()
	if ctx.r.Error != nil {
		return
	}
	funcType.ResultTypes = ctx.r.GetDataTypes()
	if ctx.r.Error != nil {
		return
	}
	funcType.Nr = ctx.m.MaxFuncTypes()
	ctx.m.FuncTypes = append(ctx.m.FuncTypes, funcType)
}

func (ctx *WasmReader) getSubReader() *context.Reader {
	dataLen := ctx.r.GetU32()
	if ctx.r.Error != nil {
		return nil
	}
	data := ctx.r.GetBytes(dataLen)
	if ctx.r.Error != nil {
		return nil
	}
	rSave := ctx.r
	ctx.r = context.NewReader(ctx.m, data)
	return rSave
}

func (ctx *WasmReader) Read() error {
	ctx.r.Error = nil
	ctx.readHeader()
	if ctx.r.Error != nil {
		return ctx.r.Error
	}
	ctx.readSections()
	return ctx.r.Error
}

func (ctx *WasmReader) readFunction(function *sections.Function) {
	funcType := ctx.r.GetU32()
	if ctx.r.Error != nil {
		return
	}
	if /* funcType < 0 || */ funcType >= ctx.m.MaxFuncTypes() {
		ctx.r.Error = utils.Error("unknown type: %d", function.FuncType)
		return
	}
	function.FuncType = ctx.m.FuncTypes[funcType]
}

func (ctx *WasmReader) readGlobal(global *sections.Global) {
	global.DataType = ctx.r.GetDataType()
	if ctx.r.Error != nil {
		return
	}
	mut := ctx.r.GetByte()
	if ctx.r.Error != nil {
		return
	}
	if /* mut < 0x00 || */ mut > 0x01 {
		ctx.r.Error = utils.Error("malformed mutability")
		return
	}
	global.Mutable = mut != 0
}

func (ctx *WasmReader) readHeader() {
	asm := ctx.r.GetBytes(4)
	if ctx.r.Error != nil {
		return
	}
	magic := string([]byte{0, 'a', 's', 'm'})
	if string(asm) != magic {
		ctx.r.Error = utils.Error("magic header not detected")
		return
	}

	ver := ctx.r.GetBytes(4)
	if ctx.r.Error != nil {
		return
	}
	version := uint32(0)
	for i := 3; i >= 0; i-- {
		version = (version << 8) | uint32(ver[i])
	}
	if version != 1 {
		ctx.r.Error = utils.Error("unknown binary version")
	}
}

func (ctx *WasmReader) readSections() {
	ctx.m.Start = value.UNDEFINED
	for ctx.r.Size() != 0 {
		secId := ctx.r.GetByte()
		if /* secId >= 0 && */ secId != sec.CUSTOM && secId <= ctx.prevSecId {
			ctx.r.Error = utils.Error("junk after last section")
			return
		}
		rSaved := ctx.getSubReader()
		if ctx.r.Error != nil {
			return
		}
		if ctx.m.Debug && secId != sec.CUSTOM {
			fmt.Printf("Section %d: %d bytes\n", secId, ctx.r.Size())
		}
		switch {
		//@formatter:off
		case secId == sec.CUSTOM : ctx.readSectionCustom()
		case secId == sec.START  : ctx.readSectionStart()
		case /* secId >= 0 && */ secId < sec.SECTIONS: ctx.readSectionOther(secId)
		//@formatter:on
		default:
			ctx.r.Error = utils.Error("malformed section id")
		}
		if ctx.r.Error != nil {
			return
		}
		if ctx.r.Size() != 0 {
			ctx.r.Error = utils.Error("section size mismatch")
			return
		}
		ctx.r = rSaved
		if secId != sec.CUSTOM {
			ctx.prevSecId = secId
		}
	}
	if ctx.codeCount != ctx.functionCount {
		ctx.r.Error = utils.Error("function and code section have inconsistent lengths")
	}
}

func (ctx *WasmReader) readSectionCustom() {
	custom := sections.NewCustom()
	custom.SectionId = ctx.prevSecId
	custom.ImportName = ctx.r.GetString()
	if ctx.r.Error != nil {
		return
	}
	custom.Data = ctx.r.GetBytes(ctx.r.Size())
	if ctx.r.Error != nil {
		return
	}
	if ctx.m.Debug {
		fmt.Printf("Custom %s: %d bytes\n", custom.ImportName, len(custom.Data))
	}
	custom.Nr = uint32(len(ctx.m.Customs))
	ctx.m.Customs = append(ctx.m.Customs, custom)
	if custom.ImportName == "name" {
		rSave := ctx.r
		ctx.r = context.NewReader(ctx.m, custom.Data)
		ctx.readSectionCustomName()
		ctx.r = rSave
	}
}

func (ctx *WasmReader) readSectionCustomName() {
	next := byte(0)
	for ctx.r.Size() != 0 {
		subSecId := ctx.r.GetByte()
		if /* subSecId >= 0 && */ subSecId < next {
			ctx.r.Error = utils.Error("Invalid subsection order")
			return
		}
		rSaved := ctx.getSubReader()
		if ctx.r.Error != nil {
			return
		}
		switch subSecId {
		//@formatter:off
		case 0x00: ctx.readSectionCustomNameModule()
		case 0x01: ctx.readSectionCustomNameFunction()
		case 0x02: ctx.readSectionCustomNameLocal()
		//@formatter:on
		default:
			ctx.r.Error = utils.Error("Invalid subsection id")
		}
		if ctx.r.Error != nil {
			return
		}
		if ctx.r.Size() != 0 {
			ctx.r.Error = utils.Error("Subsection data not entirely processed")
			return
		}
		ctx.r = rSaved
		next = subSecId
		next++
	}
}

func (ctx *WasmReader) readSectionCustomNameFunction() {
	count := ctx.r.GetU32()
	if ctx.r.Error != nil {
		return
	}
	next := uint32(0)
	for ; count != 0; count-- {
		index := ctx.r.GetU32()
		if ctx.r.Error != nil {
			return
		}
		if index < next || index >= ctx.m.MaxFunctions() {
			ctx.r.Error = utils.Error("Invalid function index")
			return
		}
		next = index + 1
		function := ctx.m.Functions[index]
		function.ImportName = ctx.r.GetString()
		if ctx.r.Error != nil {
			return
		}
	}
}

func (ctx *WasmReader) readSectionCustomNameLocal() {
	funCount := ctx.r.GetU32()
	if ctx.r.Error != nil {
		return
	}
	funNext := uint32(0)
	for ; funCount != 0; funCount-- {
		index := ctx.r.GetU32()
		if ctx.r.Error != nil {
			return
		}
		if index < funNext || index >= ctx.m.MaxFunctions() {
			ctx.r.Error = utils.Error("Invalid function index")
			return
		}
		funNext = index + 1
		function := ctx.m.Functions[index]
		locCount := ctx.r.GetU32()
		if ctx.r.Error != nil {
			return
		}
		locNext := uint32(0)
		for ; locCount != 0; locCount-- {
			index = ctx.r.GetU32()
			if ctx.r.Error != nil {
				return
			}
			if index < locNext || index >= uint32(len(function.Locals)) {
				ctx.r.Error = utils.Error("unknown local")
				return
			}
			locNext = index + 1
			local := function.Locals[index]
			local.ImportName = ctx.r.GetString()
			if ctx.r.Error != nil {
				return
			}
		}
	}
}

func (ctx *WasmReader) readSectionCustomNameModule() {
	ctx.m.ImportName = ctx.r.GetString()
}

func (ctx *WasmReader) readSectionOther(secId byte) {
	ctx.sectionAlreadyDone(secId)
	if ctx.r.Error != nil {
		return
	}
	count := ctx.r.GetU32()
	if ctx.r.Error != nil {
		return
	}
	if count == 0 {
		fmt.Printf("  Warning: Zero entries for section id %d\n", secId)
	}
	if secId == sec.FUNCTION {
		ctx.functionCount = count
	}
	if secId == sec.CODE {
		ctx.codeCount = count
		if ctx.codeCount != ctx.functionCount {
			ctx.r.Error = utils.Error("function and code section have inconsistent lengths")
			return
		}
	}
	for nr := uint32(0); ctx.r.Error == nil && nr < count; nr++ {
		switch secId {
		//@formatter:off
		case sec.TYPE    : ctx.entryType    ()
		case sec.IMPORT  : ctx.entryImport  ()
		case sec.FUNCTION: ctx.entryFunction()
		case sec.TABLE   : ctx.entryTable   ()
		case sec.MEMORY  : ctx.entryMemory  ()
		case sec.GLOBAL  : ctx.entryGlobal  ()
		case sec.EXPORT  : ctx.entryExport  ()
		case sec.ELEMENT : ctx.entryElement ()
		case sec.CODE    : ctx.entryCode    (nr)
		case sec.DATA    : ctx.entryData    ()
		//@formatter:on
		default:
			panic("Unexpected section id")
		}
	}
}

func (ctx *WasmReader) readSectionStart() {
	ctx.sectionAlreadyDone(sec.START)
	if ctx.r.Error != nil {
		return
	}
	ctx.m.Start = ctx.r.GetU32()
	if ctx.r.Error != nil {
		return
	}
	if /* m.Start < 0 || */ ctx.m.Start >= ctx.m.MaxFunctions() {
		ctx.r.Error = utils.Error("unknown function")
	}
}

func (ctx *WasmReader) readTable(table *sections.Table) {
	table.ElemType = ctx.r.GetByte()
	if ctx.r.Error != nil {
		return
	}
	if table.ElemType != 0x70 {
		ctx.r.Error = utils.Error("Expected Table element type 0x70")
		return
	}
	ctx.r.GetLimits()
	if ctx.r.Error != nil {
		return
	}
	table.Min = ctx.r.Min
	table.Max = ctx.r.Max
}

func (ctx *WasmReader) sectionAlreadyDone(secId byte) {
	flag := uint32(1 << secId)
	done := ctx.sectionsDone & flag
	if done != 0 {
		ctx.r.Error = utils.Error("Duplicate section id: %d", secId)
		return
	}
	ctx.sectionsDone |= flag
}
