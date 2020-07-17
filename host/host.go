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
var errorText  = ""

var keyToKeyId = make(map[string]int32)
var keyIdToKey = make([]string, 0)
var objIdToObj = make([]HostObject, 0)

var hostCalls = []sections.HostInterface{
	hostError, hostGetInt, hostGetKey, hostGetLength,
	hostGetObject, hostGetString, hostRandom, hostSetError,
	hostSetInt, hostSetString,
}
var hostExports = []string{
	"hostError", "hostGetInt", "hostGetKey", "hostGetLength",
	"hostGetObject", "hostGetString", "hostRandom", "hostSetError",
	"hostSetInt", "hostSetString",
}
var hostParams = [][]value.DataType{
	{}, {value.I32, value.I32}, {value.I32, value.I32}, {value.I32},
	{value.I32, value.I32, value.I32}, {value.I32, value.I32}, {},
	{value.I32, value.I32}, {value.I32, value.I32, value.I32},
	{value.I32, value.I32, value.I32, value.I32},
}
var hostResults = [][]value.DataType{
	{value.I32}, {value.I32}, {value.I32}, {value.I32},
	{value.I32}, {}, {value.I32}, {}, {}, {},
}

type Logger func (text string)
var HostLogger Logger = nil

func CreateHostModule() {
	m := sections.NewModule()
	m.ImportName = "wasp"

	m.Start = value.UNDEFINED
	m.Exports = make([]*sections.Export, 10)

	m.FuncTypes = make([]*sections.FuncType, 10)
	m.Functions = make([]*sections.Function, 10)
	for i := 0; i < 10; i++ {
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

func hostLog(text string) {
	if HostLogger != nil {
		HostLogger(text)
	}
}

func hostError(f *sections.Function, frame []sections.Variable, sp int) error {
	hostLog("hostError")
	value := int32(0)
	if errorState {
		value = 1
	}
	frame[sp].I32 = value
	return nil
}

func hostGetInt(f *sections.Function, frame []sections.Variable, sp int) error {
	hostLog("hostGetInt")
	if errorState {
		frame[sp].I32 = 0
		return nil
	}

	objId := frame[sp].I32
	keyId := frame[sp+1].I32
	frame[sp].I32 = getObject(objId).GetInt(keyId);
	return nil
}

func getObject(objId int32) HostObject {
	if objId < 0 || objId >= int32(len(objIdToObj)) {
		setError("Invalid objId")
		return objIdToObj[0]
	}
	
	return objIdToObj[objId]
}

func hostGetKey(f *sections.Function, frame []sections.Variable, sp int) error {
	hostLog("hostGetKey")
	if errorState {
		frame[sp].I32 = 0
		return nil
	}

	key := getString(f, frame, sp)
	hostLog("hostGetKey key='" + key + "'")
	keyId, ok := keyToKeyId[key]
	if ok {
		frame[sp].I32 = keyId
		return nil
	}

	frame[sp].I32 = 0
	return nil
}

func getString(f *sections.Function, frame []sections.Variable, sp int) string {
	address := frame[sp].I32
	length := frame[sp+1].I32
	mem := f.Module.Memories[0]
	// make sure to copy string out of mem.Pool
	return string(copy(make([]byte, length), mem.Pool[address:address+length]))
}

func hostGetLength(f *sections.Function, frame []sections.Variable, sp int) error {
	hostLog("hostGetLength")
	if errorState {
		frame[sp].I32 = 0
		return nil
	}

	objId := frame[sp].I32
	_ = objId
	frame[sp].I32 = 0
	return nil
}

func hostGetObject(f *sections.Function, frame []sections.Variable, sp int) error {
	hostLog("hostGetObject")
	if errorState {
		frame[sp].I32 = 0
		return nil
	}

	objId := frame[sp].I32
	keyId := frame[sp+1].I32
	typeId := frame[sp+2].I32
	_,_,_ = objId,keyId,typeId
	frame[sp].I32 = 0
	return nil
}

func hostGetString(f *sections.Function, frame []sections.Variable, sp int) error {
	hostLog("hostGetString")
	if errorState {
		offset := frame[sp+2].I32
		mem := f.Module.Memories[0]
		copy(mem.Pool[offset+8:offset+16], make([]byte, 8))
		return nil
	}

	objId := frame[sp].I32
	keyId := frame[sp+1].I32
	// length 16, offset[8] == string address, offset[12] == string length
	// can use space before offset to put string, which will be copied
	// immediately after returning into a caller environment type string
	offset := frame[sp+2].I32
	_,_,_ = objId,keyId,offset
	return nil
}

func hostRandom(f *sections.Function, frame []sections.Variable, sp int) error {
	hostLog("hostRandom")
	if errorState {
		frame[sp].I32 = 0
		return nil
	}

	frame[sp].I32 = 0
	return nil
}

func hostSetError(f *sections.Function, frame []sections.Variable, sp int) error {
	hostLog("hostSetError")
	if errorState {
		return nil
	}

	error := getString(f, frame, sp)
	setError(error)
	return nil
}

func setError(error string) {
	errorText = error
	errorState = true
}

func hostSetInt(f *sections.Function, frame []sections.Variable, sp int) error {
	hostLog("hostSetInt")
	if errorState {
		return nil
	}

	objId := frame[sp].I32
	keyId := frame[sp+1].I32
	value := frame[sp+2].I32
	hostLog("hostSetString value=" + string(value))
	_,_ = objId,keyId
	return nil
}

func hostSetString(f *sections.Function, frame []sections.Variable, sp int) error {
	hostLog("hostSetString")
	if errorState {
		return nil
	}

	objId := frame[sp].I32
	keyId := frame[sp+1].I32
	value := getString(f, frame, sp+2)
	hostLog("hostSetString value='" + value + "'")
	_,_ = objId,keyId
	return nil
}
