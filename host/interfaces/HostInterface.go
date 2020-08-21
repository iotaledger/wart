package interfaces

const (
	KeyBalance     int32 = -1
	KeyConfig      int32 = -2
	KeyError       int32 = -3
	KeyLength      int32 = -4
	KeyLog         int32 = -5
	KeyOwner       int32 = -6
	KeyParams      int32 = -7
	KeyRandom      int32 = -8
	KeyReqAddress  int32 = -9
	KeyReqBalance  int32 = -10
	KeyReqCode     int32 = -11
	KeyReqDelay    int32 = -12
	KeyReqHash     int32 = -13
	KeyRequests    int32 = -14
	KeyScAddress   int32 = -15
	KeySender      int32 = -16
	KeyState       int32 = -17
	KeyTimestamp   int32 = -18
	KeyTrace       int32 = -19
	KeyTraceHost   int32 = -20
	KeyTransfers   int32 = -21
	KeyXferAddress int32 = -22
	KeyXferAmount  int32 = -23
	KeyXferColor   int32 = -24
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
