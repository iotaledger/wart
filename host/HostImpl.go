package host

import (
	"fmt"
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/host/interfaces/field"
	"github.com/iotaledger/wart/host/interfaces/objtype"
	"strings"
)

type HostObject interface {
	GetInt(ctx interfaces.HostInterface, keyId int32) int64
	GetLength(ctx interfaces.HostInterface) int32
	GetObject(ctx interfaces.HostInterface, keyId int32, typeId int32) int32
	GetString(ctx interfaces.HostInterface, keyId int32) string
	SetInt(ctx interfaces.HostInterface, keyId int32, value int64)
	SetString(ctx interfaces.HostInterface, keyId int32, value string)
}

type HostImpl struct {
	errorFlag  bool
	errorText  string
	keyToKeyId map[string]int32
	keyIdToKey []string
	objIdToObj []HostObject
}

func NewHostImpl() *HostImpl {
	return &HostImpl{
		errorFlag:  false,
		errorText:  "",
		keyToKeyId: make(map[string]int32),
		keyIdToKey: []string{},
		objIdToObj: []HostObject{},
	}
}

func (h *HostImpl) AddObjects() {
	field.NULL = h.add("<null>", &nullObject{})
	field.ROOT = h.add("<root>", nil)
	field.CONFIG = h.add("config", nil)
	field.PARAMS = h.add("params", nil)
	field.REQUEST = h.add("request", nil)
	field.STATE = h.add("state", nil)
}

func (h *HostImpl) add(key string, obj HostObject) int32 {
	keyId := h.GetKey(key)
	if obj == nil {
		hostMap := NewHostMap(keyId)
		hostMap.readonly = key != "state"
		obj = hostMap
		if !strings.HasPrefix(key, "<") {
			root := h.getObject(field.ROOT).(*HostMap)
			root.fields[keyId] = obj
			root.types[keyId] = objtype.OBJTYPE_MAP
		}
	}
	h.objIdToObj = append(h.objIdToObj, obj)
	return keyId
}

func (h *HostImpl) getObject(objId int32) HostObject {
	if objId < 0 || objId >= int32(len(h.objIdToObj)) {
		h.SetError("Invalid objId")
		return h.objIdToObj[0]
	}

	return h.objIdToObj[objId]
}

func (h *HostImpl) GetInt(objId int32, keyId int32) int64 {
	return h.getObject(objId).GetInt(h, keyId)
}

func (h *HostImpl) GetKey(key string) int32 {
	keyId, ok := h.keyToKeyId[key]
	if !ok {
		keyId = int32(len(h.keyIdToKey))
		h.keyToKeyId[key] = keyId
		h.keyIdToKey = append(h.keyIdToKey, key)
	}
	return keyId
}

func (h *HostImpl) GetLength(objId int32) int32 {
	return h.getObject(objId).GetLength(h)
}

func (h *HostImpl) GetObject(objId int32, keyId int32, typeId int32) int32 {
	return h.getObject(objId).GetObject(h, keyId, typeId)
}

func (h *HostImpl) GetString(objId int32, keyId int32) string {
	return h.getObject(objId).GetString(h, keyId)
}

func (h *HostImpl) HasError() bool {
	return h.errorFlag
}

func (h *HostImpl) Log(logLevel int, text string) {
	fmt.Println(text)
}

func (h *HostImpl) SetError(text string) {
	if h.errorFlag {
		return
	}
	h.errorText = text
	h.errorFlag = true
}

func (h *HostImpl) SetInt(objId int32, keyId int32, value int64) {
	h.getObject(objId).SetInt(h, keyId, value)
}

func (h *HostImpl) SetString(objId int32, keyId int32, value string) {
	h.getObject(objId).SetString(h, keyId, value)
}
