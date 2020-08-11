package host

import "github.com/iotaledger/wart/host/interfaces"

type nullObject struct {
}

func NewNullObject() HostObject {
	return &nullObject{}
}
func (n *nullObject) GetInt(ctx interfaces.HostInterface, keyId int32) int64 {
	ctx.SetError("Null object")
	return 0
}

func (n *nullObject) GetLength(ctx interfaces.HostInterface) int32 {
	ctx.SetError("Null object")
	return 0
}

func (n *nullObject) GetObject(ctx interfaces.HostInterface, keyId int32, typeId int32) int32 {
	ctx.SetError("Null object")
	return 0
}

func (n *nullObject) GetString(ctx interfaces.HostInterface, keyId int32) string {
	ctx.SetError("Null object")
	return ""
}

func (n *nullObject) SetInt(ctx interfaces.HostInterface, keyId int32, value int64) {
	ctx.SetError("Null object")
}

func (n *nullObject) SetString(ctx interfaces.HostInterface, keyId int32, value string) {
	ctx.SetError("Null object")
}
