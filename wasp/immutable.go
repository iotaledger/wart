package wasp

import "github.com/iotaledger/wart/host/interfaces/objtype"

type ScImmutableInt struct {
	objId int32
	keyId int32
}

func (o *ScImmutableInt) Value() int64 {
	return GetInt(o.objId, o.keyId)
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\

type ScImmutableIntArray struct {
	objId int32
}

func (o *ScImmutableIntArray) GetInt(index int32) *ScImmutableInt {
	return &ScImmutableInt{objId: o.objId, keyId: index}
}

func (o *ScImmutableIntArray) Length() int32 {
	return int32(GetInt(o.objId, KeyLength()))
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\

type ScImmutableMap struct {
	objId int32
}

func (o *ScImmutableMap) GetInt(key string) *ScImmutableInt {
	return &ScImmutableInt{objId: o.objId, keyId: GetKey(key)}
}

func (o *ScImmutableMap) GetIntArray(key string) *ScImmutableIntArray {
	objId := GetObject(o.objId, GetKey(key), objtype.OBJTYPE_INT_ARRAY)
	return &ScImmutableIntArray{objId: objId}
}

func (o *ScImmutableMap) GetMap(key string) *ScImmutableMap {
	objId := GetObject(o.objId, GetKey(key), objtype.OBJTYPE_MAP)
	return &ScImmutableMap{objId: objId}
}

func (o *ScImmutableMap) GetMaprray(key string) *ScImmutableMapArray {
	objId := GetObject(o.objId, GetKey(key), objtype.OBJTYPE_MAP_ARRAY)
	return &ScImmutableMapArray{objId: objId}
}

func (o *ScImmutableMap) GetString(key string) *ScImmutableString {
	return &ScImmutableString{objId: o.objId, keyId: GetKey(key)}
}

func (o *ScImmutableMap) GetStringArray(key string) *ScImmutableStringArray {
	objId := GetObject(o.objId, GetKey(key), objtype.OBJTYPE_STRING_ARRAY)
	return &ScImmutableStringArray{objId: objId}
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\

type ScImmutableMapArray struct {
	objId int32
}

func (o *ScImmutableMapArray) GetMap(index int32) *ScImmutableMap {
	objId := GetObject(o.objId, index, objtype.OBJTYPE_MAP)
	return &ScImmutableMap{objId: objId}
}

func (o *ScImmutableMapArray) Length() int32 {
	return int32(GetInt(o.objId, KeyLength()))
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\

type ScImmutableString struct {
	objId int32
	keyId int32
}

func (o *ScImmutableString) Value() string {
	return GetString(o.objId, o.keyId)
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\

type ScImmutableStringArray struct {
	objId int32
}

func (o *ScImmutableStringArray) GetString(index int32) *ScImmutableString {
	return &ScImmutableString{objId: o.objId, keyId: index}
}

func (o *ScImmutableStringArray) Length() int32 {
	return int32(GetInt(o.objId, KeyLength()))
}