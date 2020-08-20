package interfaces

const (
	KeyError  int32 = -1
	KeyLength int32 = -2
	KeyLog    int32 = -3
	KeyTrace  int32 = -4
)

type HostInterface interface {
	GetInt(objId int32, keyId int32) int64
	GetKey(key string) int32
	GetObject(objId int32, keyId int32, typeId int32) int32
	GetString(objId int32, keyId int32) string
	HasError() bool
	SetError(text string)
	SetInt(objId int32, keyId int32, value int64)
	SetString(objId int32, keyId int32, value string)
}
