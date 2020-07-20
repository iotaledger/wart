package host

import (
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors"
	"github.com/iotaledger/wart/wasm/instructions"
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"github.com/iotaledger/wart/wasm/sections"
)

type HostObject interface {
	GetInt(keyId int32) int32
	GetString(keyId int32) string
	SetInt(keyId int32, value int32)
	SetString(keyId int32, value string)
}

var errorState = false
var errorText = ""

var keyToKeyId = make(map[string]int32)
var keyIdToKey = make([]string, 0)
var objIdToObj = make([]HostObject, 0)

var hostCalls = []sections.HostInterface{
	hostError, hostGetInt, hostGetKey, hostGetLength,
	hostGetObject, hostGetString, hostLog, hostRandom,
	hostSetError, hostSetInt, hostSetString,
}
var hostExports = []string{
	"hostError", "hostGetInt", "hostGetKey", "hostGetLength",
	"hostGetObject", "hostGetString", "hostLog", "hostRandom",
	"hostSetError", "hostSetInt", "hostSetString",
}
var hostParams = [][]value.DataType{
	{}, {value.I32, value.I32}, {value.I32, value.I32}, {value.I32},
	{value.I32, value.I32, value.I32}, {value.I32, value.I32}, {value.I32, value.I32},
	{},	{value.I32, value.I32}, {value.I32, value.I32, value.I32},
	{value.I32, value.I32, value.I32, value.I32},
}
var hostResults = [][]value.DataType{
	{value.I32}, {value.I32}, {value.I32}, {value.I32},
	{value.I32}, {}, {}, {value.I32}, {}, {}, {},
}

type Logger func(text string)

var HostLogger Logger = nil

func CreateHostModule() {
	m := sections.NewModule()
	m.ImportName = "wasp"

	m.Start = value.UNDEFINED
	m.Exports = make([]*sections.Export, len(hostCalls))

	m.FuncTypes = make([]*sections.FuncType, len(hostCalls))
	m.Functions = make([]*sections.Function, len(hostCalls))
	for i := 0; i < len(hostCalls); i++ {
		funcType := sections.NewFuncType()
		funcType.ParamTypes = hostParams[i]
		funcType.ResultTypes = hostResults[i]
		m.FuncTypes[i] = funcType
		function := sections.NewFunction()
		function.FuncType = funcType
		function.HostCall = hostCalls[i]
		function.Body = []helper.Instruction{instructions.CreateInstruction(op.END)}
		m.Functions[i] = function
		export := sections.NewExport()
		export.Index = uint32(i)
		export.ExternalType = desc.FUNC
		export.ImportName = hostExports[i]
		m.Exports[i] = export
	}

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

func hostError(ctx *sections.HostContext) error {
	log("hostError")
	value := int32(0)
	if errorState {
		value = 1
	}
	ctx.Frame[ctx.SP].I32 = value
	return nil
}

func hostGetInt(ctx *sections.HostContext) error {
	log("hostGetInt")
	if errorState {
		ctx.Frame[ctx.SP].I32 = 0
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	ctx.Frame[ctx.SP].I32 = getObject(objId).GetInt(keyId)
	return nil
}

func getObject(objId int32) HostObject {
	if objId < 0 || objId >= int32(len(objIdToObj)) {
		setError("Invalid objId")
		return objIdToObj[0]
	}

	return objIdToObj[objId]
}

func hostGetKey(ctx *sections.HostContext) error {
	log("hostGetKey")
	if errorState {
		ctx.Frame[ctx.SP].I32 = 0
		return nil
	}

	key := getStringParam(ctx, ctx.SP)
	log("hostGetKey key='" + key + "'")
	keyId, ok := keyToKeyId[key]
	if ok {
		ctx.Frame[ctx.SP].I32 = keyId
		return nil
	}

	ctx.Frame[ctx.SP].I32 = 0
	return nil
}

func getStringParam(ctx *sections.HostContext, offset int) string {
	address := ctx.Frame[offset].I32
	length := ctx.Frame[offset+1].I32
	mem := ctx.Function.Module.Memories[0]
	// make sure to copy string out of mem.Pool
	return string(copy(make([]byte, length), mem.Pool[address:address+length]))
}

func hostGetLength(ctx *sections.HostContext) error {
	log("hostGetLength")
	if errorState {
		ctx.Frame[ctx.SP].I32 = 0
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	_ = objId
	ctx.Frame[ctx.SP].I32 = 0
	return nil
}

func hostGetObject(ctx *sections.HostContext) error {
	log("hostGetObject")
	if errorState {
		ctx.Frame[ctx.SP].I32 = 0
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	typeId := ctx.Frame[ctx.SP+2].I32
	_, _, _ = objId, keyId, typeId
	ctx.Frame[ctx.SP].I32 = 0
	return nil
}

func hostGetString(ctx *sections.HostContext) error {
	log("hostGetString")
	if errorState {
		offset := ctx.Frame[ctx.SP+2].I32
		mem := ctx.Function.Module.Memories[0]
		copy(mem.Pool[offset+8:offset+16], make([]byte, 8))
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	// length 16, offset[8] == string address, offset[12] == string length
	// can use space before offset to put string, which will be copied
	// immediately after returning into a caller environment type string
	offset := ctx.Frame[ctx.SP+2].I32
	_, _, _ = objId, keyId, offset
	return nil
}

func hostLog(ctx *sections.HostContext) error {
	log("hostLog")
	text := getStringParam(ctx, ctx.SP)
	log("hostLog text='" + text + "'")
	return nil
}

func hostRandom(ctx *sections.HostContext) error {
	log("hostRandom")
	if errorState {
		ctx.Frame[ctx.SP].I32 = 0
		return nil
	}

	ctx.Frame[ctx.SP].I32 = 0
	return nil
}

func hostSetError(ctx *sections.HostContext) error {
	log("hostSetError")
	if errorState {
		return nil
	}

	error := getStringParam(ctx, ctx.SP)
	setError(error)
	return nil
}

func log(text string) {
	if HostLogger != nil {
		HostLogger(text)
	}
}

func setError(error string) {
	errorText = error
	errorState = true
}

func hostSetInt(ctx *sections.HostContext) error {
	log("hostSetInt")
	if errorState {
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	value := ctx.Frame[ctx.SP+2].I32
	log("hostSetString value=" + string(value))
	_, _ = objId, keyId
	return nil
}

func hostSetString(ctx *sections.HostContext) error {
	log("hostSetString")
	if errorState {
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	value := getStringParam(ctx, ctx.SP+2)
	log("hostSetString value='" + value + "'")
	_, _ = objId, keyId
	return nil
}
