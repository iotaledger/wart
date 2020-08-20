package host

import (
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/host/interfaces/objtype"
)

type HostArray struct {
	ctx      *HostImpl
	items    []interface{}
	readonly bool
	typeId   int32
}

func NewHostArray(h *HostImpl, typeId int32) *HostArray {
	return &HostArray{ctx: h, typeId: typeId}
}

func (h *HostArray) GetInt(keyId int32) int64 {
	switch keyId {
	case interfaces.KeyLength:
		return int64(len(h.items))
	}

	if !h.valid(keyId, objtype.OBJTYPE_INT) {
		return 0
	}
	return h.items[keyId].(int64)
}

func (h *HostArray) GetLength() int32 {
	return int32(len(h.items))
}

func (h *HostArray) GetObject(keyId int32, typeId int32) int32 {
	if !h.valid(keyId, typeId) {
		return 0
	}
	return h.items[keyId].(int32)
}

func (h *HostArray) GetString(keyId int32) string {
	if !h.valid(keyId, objtype.OBJTYPE_STRING) {
		return ""
	}
	return h.items[keyId].(string)
}

func (h *HostArray) SetInt(keyId int32, value int64) {
	if !h.valid(keyId, objtype.OBJTYPE_INT_ARRAY) {
		return
	}
	if h.readonly {
		h.ctx.SetError("Readonly")
		return
	}
	h.items[keyId] = value
}

func (h *HostArray) SetString(keyId int32, value string) {
	if !h.valid(keyId, objtype.OBJTYPE_STRING_ARRAY) {
		return
	}
	if h.readonly {
		h.ctx.SetError("Readonly")
		return
	}
	h.items[keyId] = value
}

func (h *HostArray) valid(keyId int32, typeId int32) bool {
	if h.typeId != typeId {
		h.ctx.SetError("Invalid access")
		return false
	}
	max := int32(len(h.items))
	if keyId == max {
		if h.readonly {
			h.ctx.SetError("Readonly")
			return false
		}
		switch typeId {
		case objtype.OBJTYPE_INT:
			h.items = append(h.items, int64(0))
		case objtype.OBJTYPE_MAP:
			objId := h.ctx.tracker.AddObject(NewHostMap(h.ctx))
			h.items = append(h.items, objId)
		case objtype.OBJTYPE_STRING:
			h.items = append(h.items, "")
		default:
			h.ctx.SetError("Invalid type id")
			return false
		}
		return true
	}
	if keyId < 0 || keyId > max {
		h.ctx.SetError("Invalid index")
		return false
	}
	return true
}
