package host

type Tracker struct {
	keyToKeyId map[string]int32
	keyIdToKey []string
	objIdToObj []HostObject
}

func NewTracker() *Tracker {
	return &Tracker{
		keyToKeyId: make(map[string]int32),
		keyIdToKey: []string{},
		objIdToObj: []HostObject{},
	}
}

func (h *Tracker) AddObject(obj HostObject) int32 {
	objId := int32(len(h.objIdToObj))
	h.objIdToObj = append(h.objIdToObj, obj)
	return objId
}

func (h *Tracker) GetKey(keyId int32) string {
	if keyId < 0 || keyId >= int32(len(h.keyIdToKey)) {
		return ""
	}
	return h.keyIdToKey[keyId]
}

func (h *Tracker) GetKeyId(key string) int32 {
	keyId, ok := h.keyToKeyId[key]
	if !ok {
		keyId = int32(len(h.keyIdToKey))
		h.keyToKeyId[key] = keyId
		h.keyIdToKey = append(h.keyIdToKey, key)
	}
	return keyId
}

func (h *Tracker) GetObject(objId int32) HostObject {
	if objId < 0 || objId >= int32(len(h.objIdToObj)) {
		return nil
	}
	return h.objIdToObj[objId]
}
