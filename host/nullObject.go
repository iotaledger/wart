package host

import "github.com/iotaledger/wart/host/interfaces"

type nullObject struct {
	ctx interfaces.HostInterface
}

func NewNullObject(h interfaces.HostInterface, ) interfaces.HostObject {
	return &nullObject{ctx: h}
}

func (n *nullObject) GetInt(keyId int32) int64 {
	n.ctx.SetError("Null.GetInt")
	return 0
}

func (n *nullObject) GetObjectId(keyId int32, typeId int32) int32 {
	n.ctx.SetError("Null.GetObjectId")
	return 0
}

func (n *nullObject) GetString(keyId int32) string {
	n.ctx.SetError("Null.GetString")
	return ""
}

func (n *nullObject) SetInt(keyId int32, value int64) {
	n.ctx.SetError("Null.SetInt")
}

func (n *nullObject) SetString(keyId int32, value string) {
	n.ctx.SetError("Null.SetString")
}
