package executor

import (
	"fmt"
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executor/context"
	"github.com/iotaledger/wart/wasm/instruction"
	"github.com/iotaledger/wart/wasm/wasm"
)

// When a function has an error, display the error and continue
// with next function instead of passing error back up.
const allFunctions = true

// Displays some additional warnings on the console when analyzing.
// Mostly used for sanity checks and non-fatal issues.
const printWarnings = true

// WasmAnalyzer is an executor that analyzes the wasm.Module for validity
// and prepares it for running by other executors.
type WasmAnalyzer struct {
	m *wasm.Module
	a *context.Analyzer
}

func NewWasmAnalyzer(m *wasm.Module) *WasmAnalyzer {
	return &WasmAnalyzer{m: m, a: context.NewAnalyzer(m, nil, nil)}
}

func (ctx *WasmAnalyzer) Analyze() error {
	ctx.a.Error = nil
	//@formatter:off
	ctx.analyzeTypes    (); if ctx.a.Error != nil { return ctx.a.Error }
	ctx.analyzeImports  (); if ctx.a.Error != nil { return ctx.a.Error }
	ctx.analyzeFunctions(); if ctx.a.Error != nil { return ctx.a.Error }
	ctx.analyzeTables   (); if ctx.a.Error != nil { return ctx.a.Error }
	ctx.analyzeMemories (); if ctx.a.Error != nil { return ctx.a.Error }
	ctx.analyzeGlobals  (); if ctx.a.Error != nil { return ctx.a.Error }
	ctx.analyzeExports  (); if ctx.a.Error != nil { return ctx.a.Error }
	ctx.analyzeStart    (); if ctx.a.Error != nil { return ctx.a.Error }
	ctx.analyzeElements (); if ctx.a.Error != nil { return ctx.a.Error }
	ctx.analyzeCode     (); if ctx.a.Error != nil { return ctx.a.Error }
	ctx.analyzeData     (); if ctx.a.Error != nil { return ctx.a.Error }
	//@formatter:on
	ctx.m.Analyzed = true
	return nil
}

func (ctx *WasmAnalyzer) analyzeCode() {
	for nr := ctx.m.ExternalFunctions; nr < ctx.m.MaxFunctions(); nr++ {
		function := ctx.m.Functions[nr]
		ctx.analyzeCodeFunction(function)
		if ctx.a.Error != nil {
			if allFunctions {
				fmt.Printf("Func %d:%d, Error: %v\n\n", function.Nr, ctx.a.IP, ctx.a.Error)
				continue
			}
			ctx.a.Fail("Func %d:%d, %v", function.Nr, ctx.a.IP, ctx.a.Error)
			return
		}
	}
}

func (ctx *WasmAnalyzer) analyzeCodeFunction(function *wasm.Function) {
	ctx.a = context.NewAnalyzer(ctx.m, function.Type.ParamTypes, function.Locals)
	ctx.a.FuncNr = function.Nr
	ctx.a.Code = function.Body
	outerBlockLabel := wasm.NewLabel(function.Type, nil)
	outerBlockLabel.UnwindSP = ctx.a.BlockMark
	ctx.a.Labels = []*wasm.Label{outerBlockLabel}
	instruction.AnalyzeBlock(ctx.a)
	if ctx.a.Error != nil {
		return
	}
	function.FrameSize = uint32(ctx.a.MaxSP - ctx.a.MinSP)
}

func (ctx *WasmAnalyzer) analyzeData() {
	for nr, data := range ctx.m.Datas {
		if data.Nr != 0 && data.Nr != uint32(nr) {
			ctx.a.Fail("Invalid data numbering")
			return
		}
		data.Nr = uint32(nr)
		if /* data.MemoryIndex < 0 || */ data.MemoryIndex >= ctx.m.MaxMemories() {
			ctx.a.Fail("Invalid data memory index")
			return
		}
		ctx.analyzeInitializerExpression(data.Offset, value.I32)
		if ctx.a.Error != nil {
			return
		}
	}
}

func (ctx *WasmAnalyzer) analyzeElements() {
	for nr, element := range ctx.m.Elements {
		if element.Nr != 0 && element.Nr != uint32(nr) {
			ctx.a.Fail("Invalid element numbering")
			return
		}
		element.Nr = uint32(nr)

		if /* element.TableIndex < 0 || */ element.TableIndex >= ctx.m.MaxTables() {
			ctx.a.Fail("Invalid element table index")
			return
		}
		ctx.analyzeInitializerExpression(element.Offset, value.I32)
		if ctx.a.Error != nil {
			return
		}
		for _, funcIndex := range element.FuncIndexes {
			if /* funcIndex < 0 || */ funcIndex >= ctx.a.Module.MaxFunctions() {
				ctx.a.Fail("Invalid element function index")
				return
			}
		}
	}
}

func (ctx *WasmAnalyzer) analyzeExports() {
	for nr, export := range ctx.m.Exports {
		if export.Nr != 0 && export.Nr != uint32(nr) {
			ctx.a.Fail("Invalid export numbering")
			return
		}
		export.Nr = uint32(nr)
		if export.ImportName == "" {
			warn("Missing export name")
		}
		switch export.Type {
		case desc.FUNC:
			if /* export.Index < 0 || */ export.Index >= ctx.m.MaxFunctions() {
				ctx.a.Fail("Invalid export function index")
				return
			}
		case desc.TABLE:
			if /* export.Index < 0 || */ export.Index >= ctx.m.MaxTables() {
				ctx.a.Fail("Invalid export table index")
				return
			}
		case desc.MEM:
			if /* export.Index < 0 || */ export.Index >= ctx.m.MaxMemories() {
				ctx.a.Fail("Invalid export memory index")
				return
			}
		case desc.GLOBAL:
			if /* export.Index < 0 || */ export.Index >= ctx.m.MaxGlobals() {
				ctx.a.Fail("Invalid export global index")
				return
			}
		default:
			ctx.a.Fail("Invalid export descriptor")
			return
		}
	}
}

func (ctx *WasmAnalyzer) analyzeFunctions() {
	for nr := ctx.m.ExternalFunctions; nr < ctx.m.MaxFunctions(); nr++ {
		function := ctx.m.Functions[nr]
		if function.Nr != 0 && function.Nr != nr {
			ctx.a.Fail("Invalid function numbering")
			return
		}
		function.Nr = nr
		function.Module = ctx.m
		if function.Type == nil {
			ctx.a.Fail("Missing function type")
			return
		}
		if /* function.Type.Nr < 0 || */ function.Type.Nr >= ctx.m.MaxFuncTypes() {
			ctx.a.Fail("Invalid function type")
			return
		}
		if function.Type != ctx.m.FuncTypes[function.Type.Nr] {
			ctx.a.Fail("Invalid function type reference")
			return
		}
	}
}

func (ctx *WasmAnalyzer) analyzeGlobals() {
	for nr := ctx.m.ExternalGlobals; nr < ctx.m.MaxGlobals(); nr++ {
		global := ctx.m.Globals[nr]
		if global.Nr != 0 && global.Nr != nr {
			ctx.a.Fail("Invalid global numbering")
			return
		}
		global.Nr = nr
		ctx.a.Error = global.Type.Check()
		if ctx.a.Error != nil {
			return
		}
		if len(global.Init) != 0 {
			ctx.analyzeInitializerExpression(global.Init, global.Type)
			if ctx.a.Error != nil {
				return
			}
		}
	}
}

func (ctx *WasmAnalyzer) analyzeImportIdentifier(id *wasm.Identifier, nr uint32, what string) {
	if id.Nr != 0 && id.Nr != nr {
		ctx.a.Fail("Invalid import %s numbering", what)
		return
	}
	id.Nr = nr
	if id.ModuleName == "" {
		ctx.a.Fail("Missing import %s module", what)
		return
	}
	if id.ImportName == "" {
		ctx.a.Fail("Missing import %s name", what)
		return
	}
}

func (ctx *WasmAnalyzer) analyzeImports() {
	for nr := uint32(0); nr < ctx.m.ExternalFunctions; nr++ {
		function := ctx.m.Functions[nr]
		ctx.analyzeImportIdentifier(&function.Identifier, nr, "function")
		if ctx.a.Error != nil {
			return
		}
		if function.Type == nil {
			ctx.a.Fail("Missing import function type")
			return
		}
		if /* function.Type.Nr < 0 || */ function.Type.Nr >= ctx.m.MaxFuncTypes() {
			ctx.a.Fail("Invalid import function type")
			return
		}
		if function.Type != ctx.m.FuncTypes[function.Type.Nr] {
			ctx.a.Fail("Invalid import function type reference")
			return
		}
	}

	for nr := uint32(0); nr < ctx.m.ExternalGlobals; nr++ {
		global := ctx.m.Globals[nr]
		ctx.analyzeImportIdentifier(&global.Identifier, nr, "global")
		if ctx.a.Error != nil {
			return
		}
		ctx.a.Error = global.Type.Check()
		if ctx.a.Error != nil {
			return
		}
		if len(global.Init) != 0 {
			warn("Initializer expression found for global import")
		}
	}

	for nr := uint32(0); nr < ctx.m.ExternalMemories; nr++ {
		memory := ctx.m.Memories[nr]
		ctx.analyzeImportIdentifier(&memory.Identifier, nr, "memory")
		if ctx.a.Error != nil {
			return
		}
		if invalidMinMax(memory.Min, memory.Max) {
			ctx.a.Fail("Invalid import memory limits")
			return
		}
	}

	for nr := uint32(0); nr < ctx.m.ExternalTables; nr++ {
		table := ctx.m.Tables[nr]
		ctx.analyzeImportIdentifier(&table.Identifier, nr, "table")
		if ctx.a.Error != nil {
			return
		}
		if table.ElemType != 0x70 {
			ctx.a.Fail("Expected import table element type 0x70")
			return
		}
		if invalidMinMax(table.Min, table.Max) {
			ctx.a.Fail("Invalid import table limits")
			return
		}
	}
}

func (ctx *WasmAnalyzer) analyzeInitializerExpression(expr []wasm.Instruction, vt value.Type) {
	if len(expr) != 2 {
		ctx.a.Fail("Expression size is invalid")
		return
	}
	if expr[1].Opcode() != op.END {
		ctx.a.Fail("Expression without terminating end instruction")
		return
	}
	switch expr[0].Opcode() {
	case op.I32_CONST, op.I64_CONST, op.F32_CONST, op.F64_CONST:
		constInstr := expr[0].(*instruction.Const)
		if constInstr.Type() != vt {
			ctx.a.Fail("type mismatch")
			return
		}
	case op.GLOBAL_GET:
		getInstr := expr[0].(*instruction.Var)
		if /*getInstr.Index < 0 || */ getInstr.Index >= ctx.m.ExternalGlobals {
			ctx.a.Fail("invalid global index")
			return
		}
		if getInstr.Index >= ctx.m.ExternalGlobals {
			ctx.a.Fail("global must be import")
			return
		}
		if ctx.m.Globals[getInstr.Index].Type != vt {
			ctx.a.Fail("type mismatch")
			return
		}
	default:
		ctx.a.Fail("constant expression required")
		return
	}

	ctx.a = context.NewAnalyzer(ctx.m, nil, nil)
	ctx.a.Code = expr
	outerBlockLabel := wasm.NewLabel(wasm.NewFuncType(), nil)
	outerBlockLabel.UnwindSP = ctx.a.BlockMark
	outerBlockLabel.BlockType.ResultTypes = []value.Type{vt}
	ctx.a.Labels = []*wasm.Label{outerBlockLabel}
	instruction.AnalyzeBlock(ctx.a)
}

func (ctx *WasmAnalyzer) analyzeMemories() {
	for nr := ctx.m.ExternalMemories; nr < ctx.m.MaxMemories(); nr++ {
		memory := ctx.m.Memories[nr]
		if memory.Nr != 0 && memory.Nr != nr {
			ctx.a.Fail("Invalid memory numbering")
			return
		}
		memory.Nr = nr
		if invalidMinMax(memory.Min, memory.Max) {
			ctx.a.Fail("Invalid memory limits")
			return
		}
	}
}

func (ctx *WasmAnalyzer) analyzeStart() {
	if ctx.m.Start != value.UNDEFINED {
		if ctx.m.Start >= ctx.m.MaxFunctions() {
			ctx.a.Fail("Invalid start function index")
			return
		}
		funcType := ctx.m.Functions[ctx.m.Start].Type
		if len(funcType.ParamTypes) != 0 || len(funcType.ResultTypes) != 0 {
			ctx.a.Fail("Invalid start function type signature")
			return
		}
	}
}

func (ctx *WasmAnalyzer) analyzeTables() {
	for nr := uint32(0); nr < ctx.m.MaxTables(); nr++ {
		table := ctx.m.Tables[nr]
		if table.Nr != 0 && table.Nr != nr {
			ctx.a.Fail("Invalid table numbering")
			return
		}
		table.Nr = nr
		if table.ElemType != 0x70 {
			ctx.a.Fail("Expected table element type 0x70")
			return
		}
		if invalidMinMax(table.Min, table.Max) {
			ctx.a.Fail("Invalid table limits")
			return
		}
	}
}

func (ctx *WasmAnalyzer) analyzeTypes() {
	for nr := uint32(0); nr < ctx.m.MaxFuncTypes(); nr++ {
		funcType := ctx.m.FuncTypes[nr]
		if funcType.Nr != 0 && funcType.Nr != nr {
			ctx.a.Fail("Invalid function type numbering")
			return
		}
		funcType.Nr = nr
		ctx.a.Error = funcType.CheckTypes()
		if ctx.a.Error != nil {
			return
		}
	}
}

func invalidMinMax(min uint32, max uint32) bool {
	if (min&0x80000000) != 0 || ((max&0x80000000) != 0 && max != value.UNDEFINED) {
		return true
	}
	return max < min && max != value.UNDEFINED
}

func warn(format string, a ...interface{}) {
	if printWarnings {
		fmt.Print("  Warning: ")
		fmt.Printf(format, a...)
		fmt.Println()
	}
}
