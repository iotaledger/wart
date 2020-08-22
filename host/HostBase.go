package host

import (
	"fmt"
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/host/interfaces/level"
)

type LogInterface interface {
	Log(logLevel int, text string)
}

type HostBase struct {
	error   string
	logger  LogInterface
	tracker *Tracker
}

func (h *HostBase) Init(logger LogInterface) {
	h.error = ""
	h.logger = logger
	h.tracker = NewTracker()
	h.AddObject(NewNullObject(h))
}

func (h *HostBase) AddObject(obj interfaces.HostObject) int32 {
	return h.tracker.AddObject(obj)
}

func (h *HostBase) GetInt(objId int32, keyId int32) int64 {
	switch keyId {
	case interfaces.KeyError:
		if h.HasError() {
			return 1
		}
		return 0
	}
	value := h.GetObject(objId).GetInt(keyId)
	h.Logf("GetInt o%d k%d = %d", objId, keyId, value)
	return value
}

func (h *HostBase) GetKey(keyId int32) string {
	return h.tracker.GetKey(keyId)
}

func (h *HostBase) GetKeyId(key string) int32 {
	keyId := h.tracker.GetKeyId(key)
	h.Logf("GetKeyId '%s'=k%d", key, keyId)
	return keyId
}

func (h *HostBase) GetObject(objId int32) interfaces.HostObject {
	o := h.tracker.GetObject(objId)
	if o == nil {
		h.SetError("Invalid objId")
		return NewNullObject(h)
	}
	return o
}

func (h *HostBase) GetObjectId(objId int32, keyId int32, typeId int32) int32 {
	subId := h.GetObject(objId).GetObjectId(keyId, typeId)
	h.Logf("GetObjectId o%d k%d t%d = o%d", objId, keyId, typeId, subId)
	return subId
}

func (h *HostBase) GetString(objId int32, keyId int32) string {
	switch keyId {
	case interfaces.KeyError:
		return h.error
	}
	value := h.GetObject(objId).GetString(keyId)
	h.Logf("GetString o%d k%d = '%ds'", objId, keyId, value)
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

func (h *HostBase) Logf(format string, a ...interface{}) {
	h.logger.Log(level.TRACE, fmt.Sprintf(format, a...))
}

func (h *HostBase) SetError(text string) {
	h.Logf("SetError '%s'", text)
	if !h.HasError() {
		h.error = text
	}
}

func (h *HostBase) SetInt(objId int32, keyId int32, value int64) {
	h.GetObject(objId).SetInt(keyId, value)
	h.Logf("SetInt o%d k%d v=%d", objId, keyId, value)
}

func (h *HostBase) SetString(objId int32, keyId int32, value string) {
	// intercept logging keys to prevent final logging of SetString itself
	switch keyId {
	case interfaces.KeyError:
		h.SetError(value)
		return
	case interfaces.KeyLog:
		h.logger.Log(level.MSG, value)
		return
	case interfaces.KeyTrace:
		h.logger.Log(level.TRACE, value)
		return
	case interfaces.KeyTraceHost:
		h.logger.Log(level.HOST, value)
		return
	}

	h.GetObject(objId).SetString(keyId, value)
	h.Logf("SetString o%d k%d v='%s'", objId, keyId, value)
}
