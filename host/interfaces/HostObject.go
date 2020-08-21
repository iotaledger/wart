package interfaces

type HostObject interface {
	GetInt(keyId int32) int64
	GetObjectId(keyId int32, typeId int32) int32
	GetString(keyId int32) string
	SetInt(keyId int32, value int64)
	SetString(keyId int32, value string)
}
