package executor

import (
	"fmt"
	"github.com/iotaledger/wart/utils"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/wasm"
	"io"
	"strconv"
)

const debug bool = true

// WatWriter is an executor that creates a  Wasm disassembly text file from a wasm.Module.
type WatWriter struct {
	m   *wasm.Module
	w   io.Writer
	tab *utils.Indenter
}

func NewWatWriter(m *wasm.Module, w io.Writer) *WatWriter {
	return &WatWriter{m: m, w: w, tab: &utils.Indenter{}}
}

func (ctx *WatWriter) funcTypes(what string, types []value.Type, code bool) string {
	if len(types) == 0 {
		return ""
	}
	s := " (" + what
	for i, vt := range types {
		if code {
			s += " (;" + strconv.Itoa(i) + ";)"
		}
		s += " " + vt.String()
	}
	return s + ")"
}

func (ctx *WatWriter) funcTypeUse(funcType *wasm.FuncType, code bool) string {
	params := ctx.funcTypes("param", funcType.ParamTypes, code)
	results := ctx.funcTypes("result", funcType.ResultTypes, false)
	return fmt.Sprintf(" (type %d)%s%s", funcType.Nr, params, results)
}

func limits(min uint32, max uint32) string {
	smin := fmt.Sprintf(" (min %d)", min)
	smax := ""
	if max != value.UNDEFINED {
		smax = fmt.Sprintf(" (max %d)", max)
	}
	return smin + smax
}

func mutable(g *wasm.Global) string {
	mut := fmt.Sprintf(" %v", g.Type)
	if g.Mutable {
		mut = fmt.Sprintf(" (mut %v)", g.Type)
	}
	return mut
}

func (ctx *WatWriter) sectionCode() bool {
	ctx.writeFunctions(true)
	return false
}

func (ctx *WatWriter) sectionData() bool {
	for _, data := range ctx.m.Datas {
		fmt.Fprintf(ctx.w, "%v(data %d", ctx.tab, data.MemoryIndex)
		if len(data.Offset) != 0 {
			fmt.Fprintf(ctx.w, " (offset")
			ctx.writeExpr(data.Offset)
			fmt.Fprintf(ctx.w, ")")
		}
		fmt.Fprintf(ctx.w, " \"")
		for _, b := range data.Data {
			format := "\\%02x"
			if b >= 0x20 && b < 0x7f {
				format = "%c"
			}
			fmt.Fprintf(ctx.w, format, b)
		}
		fmt.Fprintf(ctx.w, "\")\n")
	}
	return len(ctx.m.Datas) != 0
}

func (ctx *WatWriter) sectionElement() bool {
	for _, element := range ctx.m.Elements {
		fmt.Fprintf(ctx.w, "%v(elem %d", ctx.tab, element.TableIndex)
		if len(element.Offset) != 0 {
			fmt.Fprintf(ctx.w, " (offset")
			ctx.writeExpr(element.Offset)
			fmt.Fprintf(ctx.w, ")")
		}
		for _, funcIndex := range element.FuncIndexes {
			fmt.Fprintf(ctx.w, " %d", funcIndex)
		}
		fmt.Fprintf(ctx.w, ")\n")
	}
	return len(ctx.m.Elements) != 0
}

func (ctx *WatWriter) sectionExport() bool {
	for _, export := range ctx.m.Exports {
		ctx.writeId("export", export.Identifier)
		fmt.Fprintf(ctx.w, " (%v %d))\n", export.Type, export.Index)
	}
	return len(ctx.m.Exports) != 0
}

func (ctx *WatWriter) sectionFunction() bool {
	return ctx.writeFunctions(false)
}

func (ctx *WatWriter) sectionGlobal() bool {
	globals := ctx.m.Internal.Globals[len(ctx.m.External.Globals):]
	for _, global := range globals {
		ctx.writeId("global", global.Identifier)
		fmt.Fprintf(ctx.w, " (;%d;)%s", global.Nr, mutable(global))
		ctx.writeExpr(global.Init)
		fmt.Fprintf(ctx.w, ")\n")
	}
	return len(globals) != 0
}

func (ctx *WatWriter) sectionImport() bool {
	var done bool
	for _, function := range ctx.m.External.Functions {
		ctx.writeId("import", function.Identifier)
		fmt.Fprintf(ctx.w, " (func (;%d;)%s))\n", function.Nr, ctx.funcTypeUse(function.Type, false))
		done = true
	}
	for _, memory := range ctx.m.External.Memories {
		ctx.writeId("import", memory.Identifier)
		fmt.Fprintf(ctx.w, " (memory (;%d;)%s))\n", memory.Nr, limits(memory.Min, memory.Max))
		done = true
	}
	for _, table := range ctx.m.External.Tables {
		ctx.writeId("import", table.Identifier)
		fmt.Fprintf(ctx.w, " (table (;%d;)%s))\n", table.Nr, limits(table.Min, table.Max))
		done = true
	}
	for _, global := range ctx.m.External.Globals {
		ctx.writeId("import", global.Identifier)
		fmt.Fprintf(ctx.w, " (global (;%d;)%s))\n", global.Nr, mutable(global))
		done = true
	}
	return done
}

func (ctx *WatWriter) sectionMemory() bool {
	memories := ctx.m.Internal.Memories[len(ctx.m.External.Memories):]
	for _, memory := range memories {
		fmt.Fprintf(ctx.w, "%v(memory (;%d;)%s))\n", ctx.tab, memory.Nr, limits(memory.Min, memory.Max))
	}
	return len(memories) != 0
}

func (ctx *WatWriter) sectionStart() bool {
	if ctx.m.Start == value.UNDEFINED {
		return false
	}
	fmt.Fprintf(ctx.w, "%v(start %d)\n", ctx.tab, ctx.m.Start)
	return true
}

func (ctx *WatWriter) sectionTable() bool {
	tables := ctx.m.Internal.Tables[len(ctx.m.External.Tables):]
	for _, table := range tables {
		fmt.Fprintf(ctx.w, "%v(table (;%d;)%s))\n", ctx.tab, table.Nr, limits(table.Min, table.Max))
	}
	return len(tables) != 0
}

func (ctx *WatWriter) sectionType() bool {
	for _, funcType := range ctx.m.FuncTypes {
		params := ctx.funcTypes("param", funcType.ParamTypes, false)
		results := ctx.funcTypes("result", funcType.ResultTypes, false)
		fmt.Fprintf(ctx.w, "%v(type (;%d;) (func%s%s))\n", ctx.tab, funcType.Nr, params, results)
	}
	return len(ctx.m.FuncTypes) != 0
}

func (ctx *WatWriter) Write() {
	fmt.Fprintf(ctx.w, "(module\n")
	ctx.tab.Indent(2)
	ctx.writeSections()
	ctx.tab.Indent(-2)
	fmt.Fprintf(ctx.w, ")\n")
}

func (ctx *WatWriter) writeCustom() {
	for _, custom := range ctx.m.Customs {
		fmt.Fprintf(ctx.w, "%v(custom (;%d;) %d (size %d))\n", ctx.tab, custom.Nr, custom.SectionId, len(custom.Data))
	}
}

func (ctx *WatWriter) writeExpr(expr []wasm.Instruction) {
	for _, instr := range expr {
		if instr.Opcode() != op.END {
			fmt.Fprintf(ctx.w, " (%v)", instr)
		}
	}
}

func (ctx *WatWriter) writeId(what string, identifier wasm.Identifier) {
	fmt.Fprintf(ctx.w, "%v(%s", ctx.tab, what)
	if identifier.Module != "" {
		fmt.Fprintf(ctx.w, " \"%s\"", identifier.Module)
	}
	if identifier.Name != "" {
		fmt.Fprintf(ctx.w, " \"%s\"", identifier.Name)
	}
}

func (ctx *WatWriter) writeFunctions(code bool) bool {
	imports := len(ctx.m.External.Functions)
	functions := ctx.m.Internal.Functions[imports:]
	for _, function := range functions {
		ctx.writeId("func", function.Identifier)
		fmt.Fprintf(ctx.w, " (;%d;)%s", function.Nr, ctx.funcTypeUse(function.Type, code))
		if code {
			fmt.Fprintln(ctx.w)
			ctx.tab.Indent(2)
			offset := len(function.Type.ParamTypes)
			for j, local := range function.Locals {
				ctx.writeId("local", local.Identifier)
				fmt.Fprintf(ctx.w, " (;%d;) %v)\n", offset+j, local.Type)
			}
			ctx.tab.Indent(2)
			blocks := make([]int, 0, 1)
			stack := 0
			blocks = append(blocks, stack)
			for _, instr := range function.Body {
				switch instr.Opcode() {
				case op.ELSE, op.END:
					ctx.tab.Indent(-2)
					stack = blocks[len(blocks)-1]
					blocks = blocks[:len(blocks)-1]
				}
				stack += instr.StackChange(ctx.m)
				if debug {
					ctx.tab.Indent(-2)
					info := fmt.Sprintf("(;%d:%d;)", instr.GetIP(), stack)
					fmt.Fprintf(ctx.w, "    %-9s", info)
				}
				fmt.Fprintf(ctx.w, "%v%v\n", ctx.tab, instr)
				if debug {
					ctx.tab.Indent(2)
				}
				switch instr.Opcode() {
				case op.IF, op.ELSE, op.BLOCK, op.LOOP:
					ctx.tab.Indent(2)
					blocks = append(blocks, stack)
				}
			}
			ctx.tab.Indent(-2)
			fmt.Fprintf(ctx.w, "%v", ctx.tab)
		}
		fmt.Fprintf(ctx.w, ")\n")
		if code {
			fmt.Fprintln(ctx.w)
		}
	}
	return len(functions) != 0
}

func (ctx *WatWriter) writeSection(sectionWriter func() bool) {
	if sectionWriter() {
		fmt.Fprintln(ctx.w)
	}
}

func (ctx *WatWriter) writeSections() {
	ctx.writeSection(ctx.sectionType)
	ctx.writeSection(ctx.sectionImport)
	ctx.writeSection(ctx.sectionFunction)
	ctx.writeSection(ctx.sectionTable)
	ctx.writeSection(ctx.sectionMemory)
	ctx.writeSection(ctx.sectionGlobal)
	ctx.writeSection(ctx.sectionExport)
	ctx.writeSection(ctx.sectionStart)
	ctx.writeSection(ctx.sectionElement)
	ctx.writeSection(ctx.sectionCode)
	ctx.writeSection(ctx.sectionData)
	ctx.writeCustom()
}
