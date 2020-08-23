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

func (h *HostImpl) AddBalance(color string, amount int64) {
	h.Object("colors", objtype.OBJTYPE_STRING_ARRAY).SetString(0, color)
	h.Object("balance", objtype.OBJTYPE_MAP).SetInt(h.GetKeyId(color), amount)
}

func (h *HostImpl) AddParamInt(key string, value int64) {
	h.Object("params", objtype.OBJTYPE_MAP).SetInt(h.GetKeyId(key), value)
}

func (h *HostImpl) AddParamString(key string, value string) {
	h.Object("params", objtype.OBJTYPE_MAP).SetString(h.GetKeyId(key), value)
}

func (h *HostImpl) AddReqBalance(color string, amount int64) {
	h.Object("reqColors", objtype.OBJTYPE_STRING_ARRAY).SetString(0, color)
	h.Object("reqBalance", objtype.OBJTYPE_MAP).SetInt(h.GetKeyId(color), amount)
}

func (h *HostImpl) AddStateInt(key string, value int64) {
	h.Object("state", objtype.OBJTYPE_MAP).SetInt(h.GetKeyId(key), value)
}

func (h *HostImpl) AddStateString(key string, value string) {
	h.Object("state", objtype.OBJTYPE_MAP).SetString(h.GetKeyId(key), value)
}

func (h *HostImpl) Object(key string, typeId int32) interfaces.HostObject {
	objId := h.root.GetObjectId(h.GetKeyId(key), typeId)
	return h.GetObject(objId)
}

func (h *HostImpl) RootInt(key string, value int64) {
	h.root.SetInt(h.GetKeyId(key), value)
}

func (h *HostImpl) RootString(key string, value string) {
	h.root.SetString(h.GetKeyId(key), value)
}
