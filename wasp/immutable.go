package wasp

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
	arrId := GetObject(o.objId, GetKey(key), OBJTYPE_INT_ARRAY)
	return &ScImmutableIntArray{objId: arrId}
}

func (o *ScImmutableMap) GetMap(key string) *ScImmutableMap {
	mapId := GetObject(o.objId, GetKey(key), OBJTYPE_MAP)
	return &ScImmutableMap{objId: mapId}
}

func (o *ScImmutableMap) GetMaprray(key string) *ScImmutableMapArray {
	arrId := GetObject(o.objId, GetKey(key), OBJTYPE_MAP_ARRAY)
	return &ScImmutableMapArray{objId: arrId}
}

func (o *ScImmutableMap) GetString(key string) *ScImmutableString {
	return &ScImmutableString{objId: o.objId, keyId: GetKey(key)}
}

func (o *ScImmutableMap) GetStringArray(key string) *ScImmutableStringArray {
	arrId := GetObject(o.objId, GetKey(key), OBJTYPE_STRING_ARRAY)
	return &ScImmutableStringArray{objId: arrId}
}

// \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\ // \\

type ScImmutableMapArray struct {
	objId int32
}

func (o *ScImmutableMapArray) GetMap(index int32) *ScImmutableMap {
	mapId := GetObject(o.objId, index, OBJTYPE_MAP)
	return &ScImmutableMap{objId: mapId}
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
