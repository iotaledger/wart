package interfaces

const (
	KeyBalance     = int32(-1)
	KeyConfig      = KeyBalance - 1
	KeyError       = KeyConfig - 1
	KeyLength      = KeyError - 1
	KeyLog         = KeyLength - 1
	KeyParams      = KeyLog - 1
	KeyReqBalance  = KeyParams - 1
	KeyRequests    = KeyReqBalance - 1
	KeyState       = KeyRequests - 1
	KeyTrace       = KeyState - 1
	KeyTraceHost   = KeyTrace - 1
	KeyTransfers   = KeyTraceHost - 1
	KeyUserDefined = KeyTransfers - 1
)

type HostInterface interface {
	GetInt(objId int32, keyId int32) int64
	GetKeyId(key string) int32
	GetObjectId(objId int32, keyId int32, typeId int32) int32
	GetString(objId int32, keyId int32) string
	HasError() bool
	SetError(text string)
	SetInt(objId int32, keyId int32, value int64)
	SetString(objId int32, keyId int32, value string)
}
