package interfaces

type HostInterface interface {
	GetInt(objId int32, keyId int32) int64
	GetKey(key string) int32
	GetLength(objId int32) int32
	GetObject(objId int32, keyId int32, typeId int32) int32
	GetString(objId int32, keyId int32) string
	HasError() bool
	Log(logLevel int, text string)
	SetError(text string)
	SetInt(objId int32, keyId int32, value int64)
	SetString(objId int32, keyId int32, value string)
}
