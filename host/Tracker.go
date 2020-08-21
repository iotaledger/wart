package host

import "github.com/iotaledger/wart/host/interfaces"

type Tracker struct {
	keyToKeyId map[string]int32
	keyIdToKey []string
	objIdToObj []interfaces.HostObject
}

func NewTracker() *Tracker {
	return &Tracker{
		keyToKeyId: make(map[string]int32),
		keyIdToKey: []string{},
		objIdToObj: []interfaces.HostObject{},
	}
}

func (t *Tracker) AddObject(obj interfaces.HostObject) int32 {
	objId := int32(len(t.objIdToObj))
	t.objIdToObj = append(t.objIdToObj, obj)
	return objId
}

func (t *Tracker) GetKey(keyId int32) string {
	if keyId < 0 || keyId >= int32(len(t.keyIdToKey)) {
		return ""
	}
	return t.keyIdToKey[keyId]
}

func (t *Tracker) GetKeyId(key string) int32 {
	keyId, ok := t.keyToKeyId[key]
	if !ok {
		keyId = int32(len(t.keyIdToKey))
		t.keyToKeyId[key] = keyId
		t.keyIdToKey = append(t.keyIdToKey, key)
	}
	return keyId
}

func (t *Tracker) GetObject(objId int32) interfaces.HostObject {
	if objId < 0 || objId >= int32(len(t.objIdToObj)) {
		return nil
	}
	return t.objIdToObj[objId]
}
