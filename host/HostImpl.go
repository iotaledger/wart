package host

import (
	"github.com/iotaledger/wart/host/interfaces/objtype"
)

type HostImpl struct {
	HostBase
}

func NewHostImpl() *HostImpl {
	h := &HostImpl{}
	h.init()
	return h
}

func (h *HostImpl) AddObjects() {
	keyId := h.tracker.GetKeyId("<null>")
	h.tracker.AddObject(NewNullObject(h))

	keyId = h.tracker.GetKeyId("<root>")
	root := NewHostMap(h)
	root.readonly = true
	h.tracker.AddObject(root)

	keyId = h.tracker.GetKeyId("config")
	config := NewHostMap(h)
	config.readonly = true
	root.fields[keyId] = h.tracker.AddObject(config)
	root.types[keyId] = objtype.OBJTYPE_MAP

	keyId = h.tracker.GetKeyId("params")
	params := NewHostMap(h)
	params.readonly = true
	root.fields[keyId] = h.tracker.AddObject(params)
	root.types[keyId] = objtype.OBJTYPE_MAP

	keyId = h.tracker.GetKeyId("state")
	root.fields[keyId] = h.tracker.AddObject(NewHostMap(h))
	root.types[keyId] = objtype.OBJTYPE_MAP

	keyId = h.tracker.GetKeyId("requests")
	root.fields[keyId] = h.tracker.AddObject(NewHostArray(h, objtype.OBJTYPE_MAP))
	root.types[keyId] = objtype.OBJTYPE_MAP_ARRAY

	keyId = h.tracker.GetKeyId("transfers")
	root.fields[keyId] = h.tracker.AddObject(NewHostArray(h, objtype.OBJTYPE_MAP))
	root.types[keyId] = objtype.OBJTYPE_MAP_ARRAY
}
