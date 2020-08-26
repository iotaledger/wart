package host

import (
	"encoding/binary"
	"fmt"
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors"
	"github.com/iotaledger/wart/wasm/sections"
)

func CreateGoAdapter() {
	m := sections.NewModule()
	m.ImportName = "waspGo"
	addHostCall(m, "hostGetInt", goGetInt, []value.DataType{value.I32, value.I32, value.I32}, []value.DataType{})
	addHostCall(m, "hostGetKey", goGetKey, []value.DataType{value.I32, value.I32}, []value.DataType{value.I32})
	addHostCall(m, "hostGetObject", goGetObject, []value.DataType{value.I32, value.I32, value.I32}, []value.DataType{value.I32})
	addHostCall(m, "hostGetString", goGetString, []value.DataType{value.I32, value.I32, value.I32}, []value.DataType{})
	addHostCall(m, "hostSetInt", goSetInt, []value.DataType{value.I32, value.I32, value.I32}, []value.DataType{})
	addHostCall(m, "hostSetString", goSetString, []value.DataType{value.I32, value.I32, value.I32, value.I32}, []value.DataType{})

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

	m = sections.NewModule()
	m.ImportName = "wasi_unstable"
	addHostCall(m, "fd_write", goFdWrite, []value.DataType{value.I32, value.I32, value.I32, value.I32}, []value.DataType{value.I32})

	a = executors.NewWasmAnalyzer(m)
	err = a.Analyze()
	if err != nil {
		panic("WTF?")
	}

	linker = executors.NewWasmLinker(m)
	err = linker.Link()
	if err != nil {
		panic("WTF?")
	}
}

func goFdWrite(ctx *sections.HostContext) error {
	fmt.Printf("%c", ctx.Frame[0].I32)
	return nil
}

func goGetInt(ctx *sections.HostContext) error {
	trace(ctx, "goGetInt")
	pool := getMemPool(ctx)

	// offset[0] == string address, offset[4] == string length
	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	offset := ctx.Frame[ctx.SP+2].I32
	if ctx.Host.HasError() &&
		(keyId != interfaces.KeyError || objId != 1) {
		// set I64 value to zero
		binary.LittleEndian.PutUint64(pool[offset:offset+8], 0)
		return nil
	}

	value := ctx.Host.GetInt(objId, keyId)
	trace(ctx, "goGetInt o%d k%d v=%d", objId, keyId, value)
	binary.LittleEndian.PutUint64(pool[offset:offset+8], uint64(value))
	return nil
}

func goGetKey(ctx *sections.HostContext) error {
	trace(ctx, "goGetKey")
	if ctx.Host.HasError() {
		ctx.Frame[ctx.SP].I32 = 0
		return nil
	}

	key := getStringParam(ctx, ctx.SP)
	ctx.Frame[ctx.SP].I32 = ctx.Host.GetKeyId(key)
	return nil
}

func goGetObject(ctx *sections.HostContext) error {
	trace(ctx, "goGetObject")
	if ctx.Host.HasError() {
		ctx.Frame[ctx.SP].I32 = 0
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	typeId := ctx.Frame[ctx.SP+2].I32
	trace(ctx, "goGetObject o%d k%d t%d", objId, keyId, typeId)
	ctx.Frame[ctx.SP].I32 = ctx.Host.GetObjectId(objId, keyId, typeId)
	return nil
}

func goGetString(ctx *sections.HostContext) error {
	trace(ctx, "goGetString")
	pool := getMemPool(ctx)

	// offset[0] == string address, offset[4] == string length
	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	offset := ctx.Frame[ctx.SP+2].I32
	text := int32(binary.LittleEndian.Uint32(pool[offset:]))
	_ = text
	if ctx.Host.HasError() &&
		(keyId != interfaces.KeyError || objId != 1) {
		// set length to zero
		binary.LittleEndian.PutUint32(pool[offset+4:offset+8], 0)
		return nil
	}

	trace(ctx, "goGetString o%d k%d", objId, keyId)
	value := ctx.Host.GetString(objId, keyId)
	trace(ctx, "goGetString o%d k%d v='%s'", objId, keyId, value)

	// we use unused allocate space at address 64 to put a copy of the
	// string data, which immediately after returning should be copied
	// into a caller environment type string

	bytes := []byte(value)
	length := uint32(len(bytes))
	//TODO can we do better than using this magic address 64
	start := uint32(64)
	copy(pool[start:start+length], bytes)
	binary.LittleEndian.PutUint32(pool[offset:offset+4], start)
	binary.LittleEndian.PutUint32(pool[offset+4:offset+8], length)
	return nil
}

func goSetInt(ctx *sections.HostContext) error {
	trace(ctx, "goSetInt")
	if ctx.Host.HasError() {
		return nil
	}
	pool := getMemPool(ctx)

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	offset := ctx.Frame[ctx.SP+2].I32
	value := binary.LittleEndian.Uint64(pool[offset : offset+8])
	trace(ctx, "goSetInt o%d k%d v=%d", objId, keyId, value)
	ctx.Host.SetInt(objId, keyId, int64(value))
	return nil
}

func goSetString(ctx *sections.HostContext) error {
	trace(ctx, "goSetString")
	if ctx.Host.HasError() {
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	value := getStringParam(ctx, ctx.SP+2)
	trace(ctx, "goSetString o%d k%d v='%s'", objId, keyId, value)
	ctx.Host.SetString(objId, keyId, value)
	return nil
}
