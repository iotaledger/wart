package host

import (
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/host/interfaces/objtype"
)

type HostImpl struct {
	HostBase
	root interfaces.HostObject
}

func NewHostImpl() *HostImpl {
	h := &HostImpl{}
	h.Init(h, nil)
	h.root = NewHostMap(h)
	h.AddObject(h.root)
	return h
}

func (h *HostImpl) AddBalance(obj interfaces.HostObject, color string, amount int64) {
	colors := h.Object(obj, "colors", objtype.OBJTYPE_STRING_ARRAY)
	length := colors.GetInt(interfaces.KeyLength)
	colors.SetString(int32(length), color)
	colorId := h.GetKeyId(color)
	balance := h.Object(obj, "balance", objtype.OBJTYPE_MAP)
	balance.SetInt(colorId, amount)
}

func (h *HostImpl) Object(obj interfaces.HostObject, key string, typeId int32) interfaces.HostObject {
	if obj == nil {
		obj = h.root
	}
	return h.GetObject(obj.GetObjectId(h.GetKeyId(key), typeId))
}
