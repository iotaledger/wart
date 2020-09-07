package host

import (
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/host/interfaces/objtype"
)

type HostMap struct {
	ctx       *HostImpl
	fields    map[int32]interface{}
	immutable bool
	types     map[int32]int32
}

func NewHostMap(h *HostImpl) *HostMap {
	return &HostMap{ctx: h, fields: make(map[int32]interface{}), types: make(map[int32]int32)}
}

func (h *HostMap) GetInt(keyId int32) int64 {
	switch keyId {
	case interfaces.KeyLength:
		return int64(len(h.fields))
	}

	if !h.valid(keyId, objtype.OBJTYPE_INT) {
		return 0
	}

	value, ok := h.fields[keyId]
	if !ok {
		return 0
	}
	return value.(int64)
}

func (h *HostMap) GetLength() int32 {
	return int32(len(h.fields))
}

func (h *HostMap) GetObjectId(keyId int32, typeId int32) int32 {
	if !h.valid(keyId, typeId) {
		return 0
	}
	value, ok := h.fields[keyId]
	if ok {
		return value.(int32)
	}

	var o interfaces.HostObject
	switch typeId {
	case objtype.OBJTYPE_INT_ARRAY:
		o = NewHostArray(h.ctx, objtype.OBJTYPE_INT)
	case objtype.OBJTYPE_MAP:
		o = NewHostMap(h.ctx)
	case objtype.OBJTYPE_MAP_ARRAY:
		o = NewHostArray(h.ctx, objtype.OBJTYPE_MAP)
	case objtype.OBJTYPE_STRING_ARRAY:
		o = NewHostArray(h.ctx, objtype.OBJTYPE_STRING)
	default:
		h.ctx.SetError("Map.GetObjectId: Invalid type id")
		return 0
	}
	objId := h.ctx.AddObject(o)
	h.fields[keyId] = objId
	return objId
}

func (h *HostMap) GetString(keyId int32) string {
	if !h.valid(keyId, objtype.OBJTYPE_STRING) {
		return ""
	}
	value, ok := h.fields[keyId]
	if !ok {
		return ""
	}
	return value.(string)
}

func (h *HostMap) SetInt(keyId int32, value int64) {
	if EnableImmutableChecks && h.immutable {
		h.ctx.SetError("Map.SetInt: Immutable")
		return
	}
	if !h.valid(keyId, objtype.OBJTYPE_INT) {
		return
	}
	h.fields[keyId] = value
}

func (h *HostMap) SetString(keyId int32, value string) {
	if EnableImmutableChecks && h.immutable {
		h.ctx.SetError("Map.SetString: Immutable")
		return
	}
	if !h.valid(keyId, objtype.OBJTYPE_STRING) {
		return
	}
	h.fields[keyId] = value
}

func (h *HostMap) valid(keyId int32, typeId int32) bool {
	fieldType, ok := h.types[keyId]
	if !ok {
		if EnableImmutableChecks && h.immutable {
			h.ctx.SetError("Map.valid: Immutable")
			return false
		}
		h.types[keyId] = typeId
		return true
	}
	if fieldType != typeId {
		h.ctx.SetError("Map.valid: Invalid typeId")
		return false
	}
	return true
}
