package host

import (
	"encoding/binary"
	"fmt"
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors"
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

func CreateHostModule() {
	m := sections.NewModule()
	m.ImportName = "wasp"
	addHostCall(m, "hostGetInt", hostGetInt, []value.DataType{value.I32, value.I32}, []value.DataType{value.I64})
	addHostCall(m, "hostGetKey", hostGetKey, []value.DataType{value.I32, value.I32}, []value.DataType{value.I32})
	addHostCall(m, "hostGetObject", hostGetObject, []value.DataType{value.I32, value.I32, value.I32}, []value.DataType{value.I32})
	addHostCall(m, "hostGetString", hostGetString, []value.DataType{value.I32, value.I32, value.I32}, []value.DataType{})
	addHostCall(m, "hostSetInt", hostSetInt, []value.DataType{value.I32, value.I32, value.I64}, []value.DataType{})
	addHostCall(m, "hostSetString", hostSetString, []value.DataType{value.I32, value.I32, value.I32, value.I32}, []value.DataType{})

	a := executors.NewWasmAnalyzer(m)
	err := a.Analyze()
	if err != nil {
		panic("WTF?")
	}

	linker := executors.NewWasmLinker(m)
	err = linker.Link()
	if err != nil {
		panic("WTF?")
	}
}

func getStringParam(ctx *sections.HostContext, offset int) string {
	address := ctx.Frame[offset].I32
	length := ctx.Frame[offset+1].I32
	mem := ctx.Function.Module.Memories
	if len(mem) == 0 {
		mem = ctx.Module.Memories
	}
	// make sure to copy string out of mem.Pool
	bytes := make([]byte, length)
	copy(bytes, mem[0].Pool[address:address+length])
	return string(bytes)
}

func hostGetInt(ctx *sections.HostContext) error {
	trace(ctx, "hostGetInt")
	if ctx.Host.HasError() {
		ctx.Frame[ctx.SP].I64 = 0
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	value := ctx.Host.GetInt(objId, keyId)
	trace(ctx, "hostGetInt o%d k%d v=%d", objId, keyId, value)
	ctx.Frame[ctx.SP].I64 = value
	return nil
}

func hostGetKey(ctx *sections.HostContext) error {
	trace(ctx, "hostGetKey")
	if ctx.Host.HasError() {
		ctx.Frame[ctx.SP].I32 = 0
		return nil
	}

	key := getStringParam(ctx, ctx.SP)
	ctx.Frame[ctx.SP].I32 = ctx.Host.GetKey(key)
	return nil
}

func hostGetObject(ctx *sections.HostContext) error {
	trace(ctx, "hostGetObject")
	if ctx.Host.HasError() {
		ctx.Frame[ctx.SP].I32 = 0
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	typeId := ctx.Frame[ctx.SP+2].I32
	trace(ctx, "hostGetObject o%d k%d t%d", objId, keyId, typeId)
	ctx.Frame[ctx.SP].I32 = ctx.Host.GetObject(objId, keyId, typeId)
	return nil
}

func hostGetString(ctx *sections.HostContext) error {
	trace(ctx, "hostGetString")
	offset := ctx.Frame[ctx.SP+2].I32
	mem := ctx.Function.Module.Memories
	if len(mem) == 0 {
		mem = ctx.Module.Memories
	}
	pool := mem[0].Pool

	if ctx.Host.HasError() {
		copy(pool[offset+8:offset+16], make([]byte, 8))
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	value := ctx.Host.GetString(objId, keyId)
	trace(ctx, "hostGetString o%d k%d v='%s'", objId, keyId, value)
	// length 16, offset[8] == string address, offset[12] == string length
	// can use space before offset to put string, which will be copied
	// immediately after returning into a caller environment type string
	bytes := []byte(value)
	length := uint32(len(bytes))
	start := uint32(offset) - length
	copy(pool[start:offset], bytes)
	binary.LittleEndian.PutUint32(pool[offset+8:offset+12], start)
	binary.LittleEndian.PutUint32(pool[offset+12:offset+16], length)
	return nil
}

func hostSetInt(ctx *sections.HostContext) error {
	trace(ctx, "hostSetInt")
	if ctx.Host.HasError() {
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	value := ctx.Frame[ctx.SP+2].I64
	trace(ctx, "hostSetInt o%d k%d v=%d", objId, keyId, value)
	ctx.Host.SetInt(objId, keyId, value)
	return nil
}

func hostSetString(ctx *sections.HostContext) error {
	trace(ctx, "hostSetString")
	if ctx.Host.HasError() {
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	value := getStringParam(ctx, ctx.SP+2)
	trace(ctx, "hostSetString o%d k%d v='%s'", objId, keyId, value)
	ctx.Host.SetString(objId, keyId, value)
	return nil
}

func trace(ctx *sections.HostContext, format string, a ...interface{}) {
	ctx.Host.SetString(1, interfaces.KeyTrace, fmt.Sprintf(format, a...))
}
