package interfaces

type HostInterface interface {
	GetInt(objId int32, keyId int32) int32
	GetKey(key string) int32
	GetLength(objId int32) int32
	GetObject(objId int32, keyId int32, typeId int32) int32
	GetString(objId int32, keyId int32) string
	HasError() bool
	Log(level int, text string)
	Random() int32
	SetError(text string)
	SetInt(objId int32, keyId int32, value int32)
	SetString(objId int32, keyId int32, value string)
}
