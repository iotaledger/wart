package host

import (
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/host/interfaces/objtype"
)

type HostArray struct {
	items    []interface{}
	objId    int32
	readonly bool
	typeId   int32
}

func NewHostArray(objId int32, typeId int32) *HostArray {
	return &HostArray{objId: objId, typeId: typeId}
}

func (h *HostArray) GetInt(ctx interfaces.HostInterface, keyId int32) int64 {
	if !h.valid(ctx, keyId, objtype.OBJTYPE_INT_ARRAY) {
		return 0
	}
	return h.items[keyId].(int64)
}

func (h *HostArray) GetLength(ctx interfaces.HostInterface) int32 {
	return int32(len(h.items))
}

func (h *HostArray) GetObject(ctx interfaces.HostInterface, keyId int32, typeId int32) int32 {
	if !h.valid(ctx, keyId, typeId) {
		return 0
	}
	return h.items[keyId].(int32)
}

func (h *HostArray) GetString(ctx interfaces.HostInterface, keyId int32) string {
	if !h.valid(ctx, keyId, objtype.OBJTYPE_STRING_ARRAY) {
		return ""
	}
	return h.items[keyId].(string)
}

func (h *HostArray) SetInt(ctx interfaces.HostInterface, keyId int32, value int64) {
	if !h.valid(ctx, keyId, objtype.OBJTYPE_INT_ARRAY) {
		return
	}
	if h.readonly {
		ctx.SetError("Readonly")
		return
	}
	h.items[keyId] = value
}

func (h *HostArray) SetString(ctx interfaces.HostInterface, keyId int32, value string) {
	if !h.valid(ctx, keyId, objtype.OBJTYPE_STRING_ARRAY) {
		return
	}
	if h.readonly {
		ctx.SetError("Readonly")
		return
	}
	h.items[keyId] = value
}

func (h *HostArray) valid(ctx interfaces.HostInterface, keyId int32, typeId int32) bool {
	if h.typeId != typeId {
		ctx.SetError("Invalid access")
		return false
	}
	max := int32(len(h.items))
	if keyId == max {
		if h.readonly {
			ctx.SetError("Readonly")
			return false
		}
		if typeId == objtype.OBJTYPE_MAP_ARRAY {

		}
	}
	if keyId < 0 || keyId > max {
		ctx.SetError("Invalid index")
		return false
	}
	return true
}
