package host

import (
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/host/interfaces/objtype"
)

type HostMap struct {
	ctx      *HostImpl
	fields   map[int32]interface{}
	readonly bool
	types    map[int32]int32
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
	if !ok {
		return 0
	}
	return value.(int32)
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
	if !h.valid(keyId, objtype.OBJTYPE_INT) {
		return
	}
	if h.readonly {
		h.ctx.SetError("Readonly")
		return
	}
	h.fields[keyId] = value
}

func (h *HostMap) SetString(keyId int32, value string) {
	if !h.valid(keyId, objtype.OBJTYPE_STRING) {
		return
	}
	if h.readonly {
		h.ctx.SetError("Readonly")
		return
	}
	h.fields[keyId] = value
}

func (h *HostMap) valid(keyId int32, typeId int32) bool {
	fieldType, ok := h.types[keyId]
	if !ok {
		if h.readonly {
			h.ctx.SetError("Readonly")
			return false
		}
		h.types[keyId] = typeId
		return true
	}
	if fieldType != typeId {
		h.ctx.SetError("Invalid access")
		return false
	}
	return true
}
