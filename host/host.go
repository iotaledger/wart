package host

import (
	"fmt"
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/instructions"
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"github.com/iotaledger/wart/wasm/sections"
)

func addHostCall(m *sections.Module, exportName string, hostCall sections.HostCall, hostParams []value.DataType, hostResults []value.DataType) {
	funcType := sections.NewFuncType()
	funcType.ParamTypes = hostParams
	funcType.ResultTypes = hostResults
	m.FuncTypes = append(m.FuncTypes, funcType)
	function := sections.NewFunction()
	function.FuncType = funcType
	function.HostCall = hostCall
	function.Body = []helper.Instruction{instructions.CreateInstruction(op.END)}
	m.Functions = append(m.Functions, function)
	export := sections.NewExport()
	export.Index = uint32(len(m.Exports))
	export.ExternalType = desc.FUNC
	export.ImportName = exportName
	m.Exports = append(m.Exports, export)
}

func getMemPool(ctx *sections.HostContext) []byte {
	mem := ctx.Function.Module.Memories
	if len(mem) == 0 {
		mem = ctx.Module.Memories
	}
	return mem[0].Pool
}

func getStringParam(ctx *sections.HostContext, offset int) string {
	address := ctx.Frame[offset].I32
	length := ctx.Frame[offset+1].I32
	// make sure to copy string out of mem Pool
	pool := getMemPool(ctx)
	bytes := make([]byte, length)
	copy(bytes, pool[address:address+length])
	return string(bytes)
}

func trace(ctx *sections.HostContext, format string, a ...interface{}) {
	ctx.Host.SetString(1, interfaces.KeyTraceHost, fmt.Sprintf(format, a...))
}
