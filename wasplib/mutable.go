package wasplib

type ScMutableInt struct {
	objId int32
	keyId int32
}

func (o ScMutableInt) SetValue(value int64) {
	SetInt(o.objId, o.keyId, value)
}

func (o ScMutableInt) Value() int64 {
	return GetInt(o.objId, o.keyId)
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\

type ScMutableIntArray struct {
	objId int32
}

func (o ScMutableIntArray) Clear() {
	SetInt(o.objId, KeyLength(), 0)
}

func (o ScMutableIntArray) GetInt(index int32) ScMutableInt {
	return ScMutableInt{objId: o.objId, keyId: index}
}

func (o ScMutableIntArray) Immutable() ScImmutableIntArray {
	return ScImmutableIntArray{objId: o.objId}
}

func (o ScMutableIntArray) Length() int32 {
	return int32(GetInt(o.objId, KeyLength()))
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\

type ScMutableMap struct {
	objId int32
}

func (o ScMutableMap) Clear() {
	SetInt(o.objId, KeyLength(), 0)
}

func (o ScMutableMap) GetInt(key string) ScMutableInt {
	return ScMutableInt{objId: o.objId, keyId: GetKey(key)}
}

func (o ScMutableMap) GetIntArray(key string) ScMutableIntArray {
	arrId := GetObject(o.objId, GetKey(key), OBJTYPE_INT_ARRAY)
	return ScMutableIntArray{objId: arrId}
}

func (o ScMutableMap) GetMap(key string) ScMutableMap {
	mapId := GetObject(o.objId, GetKey(key), OBJTYPE_MAP)
	return ScMutableMap{objId: mapId}
}

func (o ScMutableMap) GetMapArray(key string) ScMutableMapArray {
	arrId := GetObject(o.objId, GetKey(key), OBJTYPE_MAP_ARRAY)
	return ScMutableMapArray{objId: arrId}
}

func (o ScMutableMap) GetString(key string) ScMutableString {
	return ScMutableString{objId: o.objId, keyId: GetKey(key)}
}

func (o ScMutableMap) GetStringArray(key string) ScMutableStringArray {
	arrId := GetObject(o.objId, GetKey(key), OBJTYPE_STRING_ARRAY)
	return ScMutableStringArray{objId: arrId}
}

func (o ScMutableMap) Immutable() ScImmutableMap {
	return ScImmutableMap{objId: o.objId}
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\

type ScMutableMapArray struct {
	objId int32
}

func (o ScMutableMapArray) Clear() {
	SetInt(o.objId, KeyLength(), 0)
}

func (o ScMutableMapArray) GetMap(index int32) ScMutableMap {
	mapId := GetObject(o.objId, index, OBJTYPE_MAP)
	return ScMutableMap{objId: mapId}
}

func (o ScMutableMapArray) Immutable() ScImmutableMapArray {
	return ScImmutableMapArray{objId: o.objId}
}

func (o ScMutableMapArray) Length() int32 {
	return int32(GetInt(o.objId, KeyLength()))
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\

type ScMutableString struct {
	objId int32
	keyId int32
}

func (o ScMutableString) SetValue(value string) {
	SetString(o.objId, o.keyId, value)
}

func (o ScMutableString) Value() string {
	return GetString(o.objId, o.keyId)
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\

type ScMutableStringArray struct {
	objId int32
}

func (o ScMutableStringArray) Clear() {
	SetInt(o.objId, KeyLength(), 0)
}

func (o ScMutableStringArray) GetString(index int32) ScMutableString {
	return ScMutableString{objId: o.objId, keyId: index}
}

func (o ScMutableStringArray) Immutable() ScImmutableStringArray {
	return ScImmutableStringArray{objId: o.objId}
}

func (o ScMutableStringArray) Length() int32 {
	return int32(GetInt(o.objId, KeyLength()))
}
