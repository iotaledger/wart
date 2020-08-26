package host

import (
	"encoding/binary"
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors"
	"github.com/iotaledger/wart/wasm/sections"
)

func CreateRustAdapter() {
	m := sections.NewModule()
	m.ImportName = "waspRust"
	addHostCall(m, "hostGetInt", rustGetInt, []value.DataType{value.I32, value.I32}, []value.DataType{value.I64})
	addHostCall(m, "hostGetKey", rustGetKey, []value.DataType{value.I32, value.I32}, []value.DataType{value.I32})
	addHostCall(m, "hostGetObject", rustGetObject, []value.DataType{value.I32, value.I32, value.I32}, []value.DataType{value.I32})
	addHostCall(m, "hostGetString", rustGetString, []value.DataType{value.I32, value.I32, value.I32}, []value.DataType{})
	addHostCall(m, "hostSetInt", rustSetInt, []value.DataType{value.I32, value.I32, value.I64}, []value.DataType{})
	addHostCall(m, "hostSetString", rustSetString, []value.DataType{value.I32, value.I32, value.I32, value.I32}, []value.DataType{})

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

func rustGetInt(ctx *sections.HostContext) error {
	trace(ctx, "rustGetInt")
	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	if ctx.Host.HasError() &&
		(keyId != interfaces.KeyError || objId != 1) {
		ctx.Frame[ctx.SP].I64 = 0
		return nil
	}

	value := ctx.Host.GetInt(objId, keyId)
	trace(ctx, "rustGetInt o%d k%d v=%d", objId, keyId, value)
	ctx.Frame[ctx.SP].I64 = value
	return nil
}

func rustGetKey(ctx *sections.HostContext) error {
	trace(ctx, "rustGetKey")
	if ctx.Host.HasError() {
		ctx.Frame[ctx.SP].I32 = 0
		return nil
	}

	key := getStringParam(ctx, ctx.SP)
	ctx.Frame[ctx.SP].I32 = ctx.Host.GetKeyId(key)
	return nil
}

func rustGetObject(ctx *sections.HostContext) error {
	trace(ctx, "rustGetObject")
	if ctx.Host.HasError() {
		ctx.Frame[ctx.SP].I32 = 0
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	typeId := ctx.Frame[ctx.SP+2].I32
	trace(ctx, "rustGetObject o%d k%d t%d", objId, keyId, typeId)
	ctx.Frame[ctx.SP].I32 = ctx.Host.GetObjectId(objId, keyId, typeId)
	return nil
}

func rustGetString(ctx *sections.HostContext) error {
	trace(ctx, "rustGetString")
	pool := getMemPool(ctx)

	// offset[0] == string address, offset[4] == string length
	offset := ctx.Frame[ctx.SP].I32
	objId := ctx.Frame[ctx.SP+1].I32
	keyId := ctx.Frame[ctx.SP+2].I32
	if ctx.Host.HasError() &&
		(keyId != interfaces.KeyError || objId != 1) {
		// set pointer and length to zero
		copy(pool[offset:offset+8], make([]byte, 8))
		return nil
	}

	trace(ctx, "rustGetString o%d k%d", objId, keyId)
	value := ctx.Host.GetString(objId, keyId)
	trace(ctx, "rustGetString o%d k%d v='%s'", objId, keyId, value)

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

func rustSetInt(ctx *sections.HostContext) error {
	trace(ctx, "rustSetInt")
	if ctx.Host.HasError() {
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	value := ctx.Frame[ctx.SP+2].I64
	trace(ctx, "rustSetInt o%d k%d v=%d", objId, keyId, value)
	ctx.Host.SetInt(objId, keyId, value)
	return nil
}

func rustSetString(ctx *sections.HostContext) error {
	trace(ctx, "rustSetString")
	if ctx.Host.HasError() {
		return nil
	}

	objId := ctx.Frame[ctx.SP].I32
	keyId := ctx.Frame[ctx.SP+1].I32
	value := getStringParam(ctx, ctx.SP+2)
	trace(ctx, "rustSetString o%d k%d v='%s'", objId, keyId, value)
	ctx.Host.SetString(objId, keyId, value)
	return nil
}
