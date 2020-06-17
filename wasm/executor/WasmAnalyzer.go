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
	m          *wasm.Module
	a          *context.Analyzer
	constValue *wasm.Variable
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
	for nr := len(ctx.m.External.Functions); nr < len(ctx.m.Internal.Functions); nr++ {
		function := ctx.m.Internal.Functions[nr]
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

func (ctx *WasmAnalyzer) analyzeCodeFunction(f *wasm.Function) {
	ctx.a = context.NewAnalyzer(ctx.m, f.Type.ParamTypes, f.Locals)
	ctx.a.FuncNr = f.Nr
	ctx.a.Code = f.Body
	label := wasm.NewLabel(f.Type, nil)
	label.UnwindSP = ctx.a.BlockMark
	ctx.a.Labels = append([]*wasm.Label{label}, ctx.a.Labels...)
	instruction.AnalyzeBlock(ctx.a)
	if ctx.a.Error != nil {
		return
	}
	f.FrameSize = uint32(ctx.a.MaxSP - ctx.a.MinSP)
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

		//todo: move this to VM init code
		//offset := uint32(data.Offset[0].(*instruction.Const).Value.I32)
		//last := offset + uint32(len(data.Data))
		//memory := ctx.m.Internal.Memories[data.MemoryIndex]
		//if last > memory.Max {
		//	ctx.a.Fail("Data range outside memory")
		//	return
		//}
		//size := uint32(len(memory.Data))
		//if last > size {
		//	memory.Data = append(memory.Data, make([]byte, last-size)...)
		//}
		//for i, b := range data.Data {
		//	index := offset + uint32(i)
		//	if memory.Data[index] != 0x00 {
		//		ctx.a.Fail("Data already defined")
		//		return
		//	}
		//	memory.Data[index] = b
		//}
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

		offset := uint32(0)
		if ctx.constValue != nil {
			offset = uint32(ctx.constValue.I32)
			ctx.constValue = nil
		}
		table := ctx.a.Module.Internal.Tables[element.TableIndex]

		end := offset + uint32(len(element.FuncIndexes))
		if end < offset || end > table.Min {
			ctx.a.Fail("Element definition outside of minimum table dimensions")
			return
		}
		for _, funcIndex := range element.FuncIndexes {
			if /* funcIndex < 0 || */ funcIndex >= ctx.a.Module.MaxFunctions() {
				ctx.a.Fail("Invalid element function index")
				return
			}
		}
		//todo:move this to VM init code
		//if element.Offset[0].Opcode() != op.I32_CONST {
		//	ctx.a.Fail("Unexpected element offset instruction")
		//	return
		//}
		//offset := uint32(element.Offset[0].(*instruction.Const).Value.I32)
		//
		//last := offset + uint32(len(element.FuncIndexes))
		//table := ctx.m.Internal.Tables[element.TableIndex]
		//if last > table.Max {
		//	ctx.a.Fail("Element range outside table")
		//	return
		//}
		//size := uint32(len(table.Functions))
		//if last > size {
		//	table.Functions = append(table.Functions, make([]*wasm.Function, last-size)...)
		//}
		//for i, funcIndex := range element.FuncIndexes {
		//	if funcIndex >= ctx.m.MaxFunctions() {
		//		ctx.a.Fail("Invalid element function index")
		//		return
		//	}
		//	elemIndex := offset + uint32(i)
		//	if table.Functions[elemIndex] != nil {
		//		ctx.a.Fail("Element already defined")
		//		return
		//	}
		//	table.Functions[elemIndex] = ctx.m.Internal.Functions[funcIndex]
		//}
	}
}

func (ctx *WasmAnalyzer) analyzeExports() {
	for nr, export := range ctx.m.Exports {
		if export.Nr != 0 && export.Nr != uint32(nr) {
			ctx.a.Fail("Invalid export numbering")
			return
		}
		export.Nr = uint32(nr)
		if export.Name == "" {
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
	for nr := len(ctx.m.External.Functions); nr < len(ctx.m.Internal.Functions); nr++ {
		function := ctx.m.Internal.Functions[nr]
		if function.Nr != 0 && function.Nr != uint32(nr) {
			ctx.a.Fail("Invalid function numbering")
			return
		}
		function.Nr = uint32(nr)
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
	for nr := len(ctx.m.External.Globals); nr < len(ctx.m.Internal.Globals); nr++ {
		global := ctx.m.Internal.Globals[nr]
		if global.Nr != 0 && global.Nr != uint32(nr) {
			ctx.a.Fail("Invalid global numbering")
			return
		}
		global.Nr = uint32(nr)
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

func (ctx *WasmAnalyzer) analyzeImportIdentifier(id *wasm.Identifier, nr int, what string) {
	if id.Nr != 0 && id.Nr != uint32(nr) {
		ctx.a.Fail("Invalid import %s numbering", what)
		return
	}
	id.Nr = uint32(nr)
	if id.Module == "" {
		ctx.a.Fail("Missing import %s module", what)
		return
	}
	if id.Name == "" {
		ctx.a.Fail("Missing import %s name", what)
		return
	}
}

func (ctx *WasmAnalyzer) analyzeImports() {
	for nr, function := range ctx.m.External.Functions {
		ctx.analyzeImportIdentifier(&function.Identifier, nr, "function")
		if ctx.a.Error != nil {
			return
		}
		if uint32(nr) >= ctx.m.MaxFunctions() || function != ctx.m.Internal.Functions[nr] {
			ctx.a.Fail("Import function missing from internals")
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

	for nr, table := range ctx.m.External.Tables {
		ctx.analyzeImportIdentifier(&table.Identifier, nr, "table")
		if ctx.a.Error != nil {
			return
		}
		if uint32(nr) >= ctx.m.MaxTables() || table != ctx.m.Internal.Tables[nr] {
			ctx.a.Fail("Import table missing from internals")
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

	for nr, memory := range ctx.m.External.Memories {
		ctx.analyzeImportIdentifier(&memory.Identifier, nr, "memory")
		if ctx.a.Error != nil {
			return
		}
		if uint32(nr) >= ctx.m.MaxMemories() || memory != ctx.m.Internal.Memories[nr] {
			ctx.a.Fail("Import memory missing from internals")
			return
		}
		if invalidMinMax(memory.Min, memory.Max) {
			ctx.a.Fail("Invalid import memory limits")
			return
		}
	}

	for nr, global := range ctx.m.External.Globals {
		ctx.analyzeImportIdentifier(&global.Identifier, nr, "global")
		if ctx.a.Error != nil {
			return
		}
		if uint32(nr) >= ctx.m.MaxGlobals() || global != ctx.m.Internal.Globals[nr] {
			ctx.a.Fail("Import global missing from internals")
			return
		}
		ctx.a.Error = global.Type.Check()
		if ctx.a.Error != nil {
			return
		}
		if len(global.Init) != 0 {
			warn("Initializer expression found for import global")
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
			ctx.a.Fail("Expression const type mismatch")
			return
		}
		ctx.constValue = &constInstr.Value
	case op.GLOBAL_GET:
		global := expr[0].(*instruction.Var)
		if /*global.Index < 0 || */ global.Index >= uint32(len(ctx.m.External.Globals)) {
			ctx.a.Fail("Expression global_get is not an import")
			return
		}
		if ctx.m.External.Globals[global.Index].Type != vt {
			ctx.a.Fail("Expression global_get type mismatch")
			return
		}
	default:
		ctx.a.Fail("Expression is not a constant expression")
		return
	}

	ctx.a = context.NewAnalyzer(ctx.m, nil, nil)
	ctx.a.Code = expr
	label := wasm.NewLabel(wasm.NewFuncType(), nil)
	label.UnwindSP = ctx.a.BlockMark
	label.BlockType.ResultTypes = []value.Type{vt}
	ctx.a.Labels = append([]*wasm.Label{label}, ctx.a.Labels...)
	instruction.AnalyzeBlock(ctx.a)
}

func (ctx *WasmAnalyzer) analyzeMemories() {
	for nr := len(ctx.m.External.Memories); nr < len(ctx.m.Internal.Memories); nr++ {
		memory := ctx.m.Internal.Memories[nr]
		if memory.Nr != 0 && memory.Nr != uint32(nr) {
			ctx.a.Fail("Invalid memory numbering")
			return
		}
		memory.Nr = uint32(nr)
		if invalidMinMax(memory.Min, memory.Max) {
			ctx.a.Fail("Invalid memory limits")
			return
		}
		// don't allocate this large blob until it is absolutely necessary
		memory.Data = nil
	}
}

func (ctx *WasmAnalyzer) analyzeStart() {
	if ctx.m.Start != value.UNDEFINED {
		if ctx.m.Start >= ctx.m.MaxFunctions() {
			ctx.a.Fail("Invalid start function index")
			return
		}
		funcType := ctx.m.Internal.Functions[ctx.m.Start].Type
		if len(funcType.ParamTypes) != 0 || len(funcType.ResultTypes) != 0 {
			ctx.a.Fail("Invalid start function type signature")
			return
		}
	}
}

func (ctx *WasmAnalyzer) analyzeTables() {
	for nr := uint32(0); nr < ctx.m.MaxTables(); nr++ {
		table := ctx.m.Internal.Tables[nr]
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
		table.Functions = make([]*wasm.Function, table.Min)
	}
}

func (ctx *WasmAnalyzer) analyzeTypes() {
	for nr, funcType := range ctx.m.FuncTypes {
		if funcType.Nr != 0 && funcType.Nr != uint32(nr) {
			ctx.a.Fail("Invalid function type numbering")
			return
		}
		funcType.Nr = uint32(nr)

		ctx.a.Error = funcType.CheckTypes()
		if ctx.a.Error != nil {
			return
		}

		// just for fun check if there are duplicate function types
		for i := 0; i < nr; i++ {
			if funcType.IsSameAs(ctx.m.FuncTypes[i]) {
				warn("duplicate function types")
			}
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
