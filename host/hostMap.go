package host

import "github.com/iotaledger/wart/host/interfaces/objtype"

type HostMap struct {
	fields   map[int32]interface{}
	objId    int32
	readonly bool
	types    map[int32]int32
}

func NewHostMap(objId int32) *HostMap {
	return &HostMap{objId: objId, fields: make(map[int32]interface{}), types: make(map[int32]int32)}
}

func (h *HostMap) GetInt(ctx *HostImpl, keyId int32) int64 {
	if !h.valid(ctx, keyId, objtype.OBJTYPE_INT) {
		return 0
	}

	value, ok := h.fields[keyId]
	if !ok {
		return 0
	}
	return value.(int64)
}

func (h *HostMap) GetLength(ctx *HostImpl) int32 {
	return int32(len(h.fields))
}

func (h *HostMap) GetObject(ctx *HostImpl, keyId int32, typeId int32) int32 {
	if !h.valid(ctx, keyId, typeId) {
		return 0
	}
	value, ok := h.fields[keyId]
	if !ok {
		return 0
	}
	return value.(*HostMap).objId
}

func (h *HostMap) GetString(ctx *HostImpl, keyId int32) string {
	if !h.valid(ctx, keyId, objtype.OBJTYPE_STRING) {
		return ""
	}
	value, ok := h.fields[keyId]
	if !ok {
		return ""
	}
	return value.(string)
}

func (h *HostMap) SetInt(ctx *HostImpl, keyId int32, value int64) {
	if !h.valid(ctx, keyId, objtype.OBJTYPE_INT) {
		return
	}
	if h.readonly {
		ctx.SetError("Readonly")
		return
	}
	h.fields[keyId] = value
}

func (h *HostMap) SetString(ctx *HostImpl, keyId int32, value string) {
	if !h.valid(ctx, keyId, objtype.OBJTYPE_STRING) {
		return
	}
	if h.readonly {
		ctx.SetError("Readonly")
		return
	}
	h.fields[keyId] = value
}

func (h *HostMap) valid(ctx *HostImpl, keyId int32, typeId int32) bool {
	fieldType, ok := h.types[keyId]
	if !ok {
		if h.readonly {
			ctx.SetError("Readonly")
			return false
		}
		h.types[keyId] = typeId
		return true
	}
	if fieldType != typeId {
		ctx.SetError("Invalid access")
		return false
	}
	return true
}
