package host

import (
	"fmt"
	"github.com/iotaledger/wart/wasm/sections"
)

type HostObject interface {
	GetInt(ctx *HostImpl, keyId int32) int32
	GetString(ctx *HostImpl, keyId int32) string
	SetInt(ctx *HostImpl, keyId int32, value int32)
	SetString(ctx *HostImpl, keyId int32, value string)
}

type HostImpl struct {
	errorFlag  bool
	errorText  string
	keyToKeyId map[string]int32
	keyIdToKey []string
	module *sections.Module
	objIdToObj []HostObject
}

func NewHostImpl(Module *sections.Module) *HostImpl {
	return &HostImpl{
		errorFlag: false,
		errorText: "",
		keyToKeyId: make(map[string]int32),
		keyIdToKey: []string{ "<null>" },
		module: Module,
		objIdToObj: []HostObject{ &nullObject{}},
	}
}

func (h *HostImpl) getObject(objId int32) HostObject {
	if objId < 0 || objId >= int32(len(h.objIdToObj)) {
		h.SetError("Invalid objId")
		return h.objIdToObj[0]
	}

	return h.objIdToObj[objId]
}

func (h *HostImpl) GetInt(objId int32, keyId int32) int32 {
	panic("implement me")
}

func (h *HostImpl) GetKey(key string) int32 {
	keyId,ok := h.keyToKeyId[key]
	if !ok {
		keyId = int32(len(h.keyIdToKey))
		h.keyToKeyId[key] = keyId
		h.keyIdToKey = append(h.keyIdToKey, key)
	}
	return keyId
}

func (h *HostImpl) GetLength(objId int32) int32 {
	panic("implement me")
}

func (h *HostImpl) GetObject(objId int32, keyId int32, typeId int32) int32 {
	panic("implement me")
}

func (h *HostImpl) GetString(objId int32, keyId int32) string {
	panic("implement me")
}

func (h *HostImpl) HasError() bool {
	return h.errorFlag
}

func (h *HostImpl) Log(level int, text string) {
	fmt.Println(text)
}

func (h *HostImpl) Random() int32 {
	panic("implement me")
}

func (h *HostImpl) SetError(text string) {
	if h.errorFlag {
		return
	}
	h.errorText = text
	h.errorFlag = true
}

func (h *HostImpl) SetInt(objId int32, keyId int32, value int32) {
	panic("implement me")
}

func (h *HostImpl) SetString(objId int32, keyId int32, value string) {
	panic("implement me")
}
