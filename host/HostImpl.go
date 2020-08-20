package host

import (
	"fmt"
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/host/interfaces/level"
	"github.com/iotaledger/wart/host/interfaces/objtype"
)

type HostObject interface {
	GetInt(keyId int32) int64
	GetObject(keyId int32, typeId int32) int32
	GetString(keyId int32) string
	SetInt(keyId int32, value int64)
	SetString(keyId int32, value string)
}

type HostImpl struct {
	error   string
	tracker *Tracker
}

func NewHostImpl() *HostImpl {
	return &HostImpl{
		error:   "",
		tracker: NewTracker(),
	}
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

}

func (h *HostImpl) getObject(objId int32) HostObject {
	o := h.tracker.GetObject(objId)
	if o == nil {
		h.SetError("Invalid objId")
		return NewNullObject(h)
	}
	return o
}

func (h *HostImpl) log(format string, a ...interface{}) {
	h.Log(level.TRACE, fmt.Sprintf(format, a...))
}

func (h *HostImpl) GetInt(objId int32, keyId int32) int64 {
	switch keyId {
	case interfaces.KeyError:
		if h.HasError() {
			return 1
		}
		return 0
	}

	value := h.getObject(objId).GetInt(keyId)
	h.log("GetInt o%d k%d = %d", objId, keyId, value)
	return value
}

func (h *HostImpl) GetKey(key string) int32 {
	keyId := h.tracker.GetKeyId(key)
	h.log("GetKey '%s'=k%d", key, keyId)
	return keyId
}

func (h *HostImpl) GetObject(objId int32, keyId int32, typeId int32) int32 {
	subId := h.getObject(objId).GetObject(keyId, typeId)
	h.log("GetObject o%d k%d t%d = o%d", objId, keyId, typeId, subId)
	return subId
}

func (h *HostImpl) GetString(objId int32, keyId int32) string {
	switch keyId {
	case interfaces.KeyError:
		return h.error
	}
	value := h.getObject(objId).GetString(keyId)
	h.log("GetString o%d k%d = '%ds'", objId, keyId, value)
	return value
}

func (h *HostImpl) HasError() bool {
	return h.error != ""
}

func (h *HostImpl) Log(logLevel int, text string) {
	if logLevel >= level.TRACE {
		fmt.Println(text)
	}
}

func (h *HostImpl) SetError(text string) {
	h.log("SetError '%s'", text)
	if !h.HasError() {
		h.error = text
	}
}

func (h *HostImpl) SetInt(objId int32, keyId int32, value int64) {
	h.getObject(objId).SetInt(keyId, value)
	h.log("SetInt o%d k%d v=%d", objId, keyId, value)
}

func (h *HostImpl) SetString(objId int32, keyId int32, value string) {
	switch keyId {
	case interfaces.KeyError:
		h.SetError(value)
		return
	case interfaces.KeyLog:
		h.Log(level.MSG, value)
		return
	case interfaces.KeyTrace:
		h.Log(level.TRACE, value)
		return
	}

	h.getObject(objId).SetString(keyId, value)
	h.log("SetString o%d k%d v='%s'", objId, keyId, value)
}
