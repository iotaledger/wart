package executors

import (
	"fmt"
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/consts/sec"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors/context"
	"github.com/iotaledger/wart/wasm/instructions"
	"github.com/iotaledger/wart/wasm/sections"
)

// WasmWriter is an executor that creates binary Wasm data from a Module.
type WasmWriter struct {
	m *sections.Module
	w *context.Writer
}

func NewWasmWriter(m *sections.Module) *WasmWriter {
	return &WasmWriter{m: m, w: context.NewWriter()}
}

func (ctx *WasmWriter) compressLocals(locals []*sections.Local) {
	if len(locals) == 0 {
		ctx.w.PutU32(0)
		return
	}
	counts := make([]uint32, 0)
	values := make([]value.DataType, 0)
	count := uint32(0)
	lastVt := locals[0].DataType
	for _, local := range locals {
		if local.DataType != lastVt {
			counts = append(counts, count)
			values = append(values, lastVt)
			count = 0
			lastVt = local.DataType
		}
		count++
	}
	if count != 0 {
		counts = append(counts, count)
		values = append(values, lastVt)
	}
	ctx.w.PutU32(uint32(len(counts)))
	for i, count := range counts {
		ctx.w.PutU32(count)
		ctx.w.PutDataType(values[i])
	}
}

func (ctx *WasmWriter) Data() []byte {
	return ctx.w.Data()
}

func (ctx *WasmWriter) putLen(l int) {
	ctx.w.PutU32(uint32(l))
}

func putSubWriter(dst *context.Writer, w *context.Writer) {
	dst.PutU32(w.Size())
	dst.PutBytes(w.Data())
}

func (ctx *WasmWriter) sectionCode() {
	functions := ctx.m.Functions[ctx.m.ExternalFunctions:]
	ctx.putLen(len(functions))
	sectionWriter := ctx.w
	for _, function := range functions {
		ctx.w = context.NewWriter()
		ctx.compressLocals(function.Locals)
		instructions.WriteBlock(ctx.w, function.Body)
		if ctx.m.Debug {
			fmt.Printf("  Function %d: %d bytes\n", function.Nr, ctx.w.Size())
		}
		putSubWriter(sectionWriter, ctx.w)
	}
	ctx.w = sectionWriter
}

func (ctx *WasmWriter) sectionData() {
	ctx.putLen(len(ctx.m.Datas))
	for _, data := range ctx.m.Datas {
		ctx.w.PutU32(data.MemoryIndex)
		instructions.WriteBlock(ctx.w, data.Offset)
		ctx.w.PutU32(uint32(len(data.Bytes)))
		ctx.w.PutBytes(data.Bytes)
	}
}

func (ctx *WasmWriter) sectionElement() {
	ctx.putLen(len(ctx.m.Elements))
	for _, element := range ctx.m.Elements {
		ctx.w.PutU32(element.TableIndex)
		instructions.WriteBlock(ctx.w, element.Offset)
		ctx.w.PutU32(uint32(len(element.FuncIndexes)))
		for _, funcIndex := range element.FuncIndexes {
			ctx.w.PutU32(funcIndex)
		}
	}
}

func (ctx *WasmWriter) sectionExport() {
	ctx.putLen(len(ctx.m.Exports))
	for _, export := range ctx.m.Exports {
		ctx.w.PutString(export.ImportName)
		ctx.w.PutByte(byte(export.ExternalType))
		ctx.w.PutU32(export.Index)
	}
}

func (ctx *WasmWriter) sectionFunction() {
	functions := ctx.m.Functions[ctx.m.ExternalFunctions:]
	ctx.putLen(len(functions))
	for _, function := range functions {
		ctx.w.PutU32(function.FuncType.Nr)
	}
}

func (ctx *WasmWriter) sectionGlobal() {
	globals := ctx.m.Globals[ctx.m.ExternalGlobals:]
	ctx.putLen(len(globals))
	for _, global := range globals {
		ctx.writeGlobal(global)
		instructions.WriteBlock(ctx.w, global.Init)
	}
}

func (ctx *WasmWriter) sectionImport() {
	total := ctx.m.ExternalFunctions
	total += ctx.m.ExternalGlobals
	total += ctx.m.ExternalMemories
	total += ctx.m.ExternalTables
	ctx.putLen(int(total))
	for i := uint32(0); i < ctx.m.ExternalFunctions; i++ {
		function := ctx.m.Functions[i]
		ctx.w.PutString(function.ModuleName)
		ctx.w.PutString(function.ImportName)
		ctx.w.PutByte(byte(desc.FUNC))
		ctx.w.PutU32(function.FuncType.Nr)
	}
	for i := uint32(0); i < ctx.m.ExternalMemories; i++ {
		memory := ctx.m.Memories[i]
		ctx.w.PutString(memory.ModuleName)
		ctx.w.PutString(memory.ImportName)
		ctx.w.PutByte(byte(desc.MEM))
		ctx.w.PutLimits(memory.Min, memory.Max)
	}
	for i := uint32(0); i < ctx.m.ExternalTables; i++ {
		table := ctx.m.Tables[i]
		ctx.w.PutString(table.ModuleName)
		ctx.w.PutString(table.ImportName)
		ctx.w.PutByte(byte(desc.TABLE))
		ctx.w.PutByte(0x70)
		ctx.w.PutLimits(table.Min, table.Max)
	}
	for i := uint32(0); i < ctx.m.ExternalGlobals; i++ {
		global := ctx.m.Globals[i]
		ctx.w.PutString(global.ModuleName)
		ctx.w.PutString(global.ImportName)
		ctx.w.PutByte(byte(desc.GLOBAL))
		ctx.writeGlobal(global)
	}
}

func (ctx *WasmWriter) sectionMemory() {
	memories := ctx.m.Memories[ctx.m.ExternalMemories:]
	ctx.putLen(len(memories))
	for _, memory := range memories {
		ctx.w.PutLimits(memory.Min, memory.Max)
	}
}

func (ctx *WasmWriter) sectionStart() {
	if ctx.m.Start != value.UNDEFINED {
		ctx.w.PutU32(ctx.m.Start)
	}
}

func (ctx *WasmWriter) sectionTable() {
	tables := ctx.m.Tables[ctx.m.ExternalTables:]
	ctx.putLen(len(tables))
	for _, table := range tables {
		ctx.w.PutByte(table.ElemType) // this better be 0x70
		ctx.w.PutLimits(table.Min, table.Max)
	}
}

func (ctx *WasmWriter) sectionType() {
	ctx.putLen(len(ctx.m.FuncTypes))
	for _, funcType := range ctx.m.FuncTypes {
		ctx.w.PutByte(0x60)
		ctx.w.PutDataTypes(funcType.ParamTypes)
		ctx.w.PutDataTypes(funcType.ResultTypes)
	}
}

func (ctx *WasmWriter) Write() {
	ctx.w.PutBytes([]byte{0, 'a', 's', 'm'})
	ctx.w.PutBytes([]byte{1, 0, 0, 0})
	ctx.writeSections()
}

func (ctx *WasmWriter) writeGlobal(global *sections.Global) {
	ctx.w.PutDataType(global.DataType)
	var mut byte
	if global.Mutable {
		mut = 0x01
	}
	ctx.w.PutByte(mut)
}

func (ctx *WasmWriter) writeSection(secId byte, sectionWriter func()) {
	mainWriter := ctx.w
	ctx.w = context.NewWriter()
	sectionWriter()
	if ctx.w.Size() != 0 {
		// filter out zero-entry vectors (single 0x00 byte)
		if ctx.w.Size() != 1 || secId == sec.CUSTOM || secId == sec.START {
			if ctx.m.Debug {
				fmt.Printf("Section %d: %d bytes\n", secId, ctx.w.Size())
			}
			mainWriter.PutByte(secId)
			putSubWriter(mainWriter, ctx.w)
		}
	}
	ctx.w = mainWriter
	ctx.writeSectionCustom(secId)
}

func (ctx *WasmWriter) writeSections() {
	ctx.writeSectionCustom(sec.CUSTOM)
	ctx.writeSection(sec.TYPE, ctx.sectionType)
	ctx.writeSection(sec.IMPORT, ctx.sectionImport)
	ctx.writeSection(sec.FUNCTION, ctx.sectionFunction)
	ctx.writeSection(sec.TABLE, ctx.sectionTable)
	ctx.writeSection(sec.MEMORY, ctx.sectionMemory)
	ctx.writeSection(sec.GLOBAL, ctx.sectionGlobal)
	ctx.writeSection(sec.EXPORT, ctx.sectionExport)
	ctx.writeSection(sec.START, ctx.sectionStart)
	ctx.writeSection(sec.ELEMENT, ctx.sectionElement)
	ctx.writeSection(sec.CODE, ctx.sectionCode)
	ctx.writeSection(sec.DATA, ctx.sectionData)
}

func (ctx *WasmWriter) writeSectionCustom(secId byte) {
	for _, custom := range ctx.m.Customs {
		if custom.SectionId == secId && len(custom.Data) != 0 {
			wTmp := context.NewWriter()
			wTmp.PutString(custom.ImportName)
			wTmp.PutBytes(custom.Data)
			if ctx.m.Debug {
				fmt.Printf("Custom %s: %d bytes\n", custom.ImportName, len(custom.Data))
			}
			ctx.w.PutByte(sec.CUSTOM)
			putSubWriter(ctx.w, wTmp)
		}
	}
}
