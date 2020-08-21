package host

import (
	"fmt"
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/host/interfaces/level"
)

type HostBase struct {
	error   string
	tracker *Tracker
}

func (h *HostBase) init() {
	h.error = ""
	h.tracker = NewTracker()
}

func (h *HostBase) getObject(objId int32) interfaces.HostObject {
	o := h.tracker.GetObject(objId)
	if o == nil {
		h.SetError("Invalid objId")
		return NewNullObject(h)
	}
	return o
}

func (h *HostBase) log(format string, a ...interface{}) {
	h.Log(level.TRACE, fmt.Sprintf(format, a...))
}

func (h *HostBase) GetInt(objId int32, keyId int32) int64 {
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

func (h *HostBase) GetKey(key string) int32 {
	keyId := h.tracker.GetKeyId(key)
	h.log("GetKey '%s'=k%d", key, keyId)
	return keyId
}

func (h *HostBase) GetObject(objId int32, keyId int32, typeId int32) int32 {
	subId := h.getObject(objId).GetObject(keyId, typeId)
	h.log("GetObject o%d k%d t%d = o%d", objId, keyId, typeId, subId)
	return subId
}

func (h *HostBase) GetString(objId int32, keyId int32) string {
	switch keyId {
	case interfaces.KeyError:
		return h.error
	}
	value := h.getObject(objId).GetString(keyId)
	h.log("GetString o%d k%d = '%ds'", objId, keyId, value)
	return value
}

func (h *HostBase) HasError() bool {
	return h.error != ""
}

func (h *HostBase) Log(logLevel int, text string) {
	if logLevel >= level.TRACE {
		fmt.Println(text)
	}
}

func (h *HostBase) SetError(text string) {
	h.log("SetError '%s'", text)
	if !h.HasError() {
		h.error = text
	}
}

func (h *HostBase) SetInt(objId int32, keyId int32, value int64) {
	h.getObject(objId).SetInt(keyId, value)
	h.log("SetInt o%d k%d v=%d", objId, keyId, value)
}

func (h *HostBase) SetString(objId int32, keyId int32, value string) {
	// intercept logging keys to prevent final logging of SetString itself
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
	case interfaces.KeyTraceHost:
		h.Log(level.HOST, value)
		return
	}

	h.getObject(objId).SetString(keyId, value)
	h.log("SetString o%d k%d v='%s'", objId, keyId, value)
}
