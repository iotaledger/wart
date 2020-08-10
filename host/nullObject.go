package host

type nullObject struct {
}

func (n *nullObject) GetInt(ctx *HostImpl, keyId int32) int64 {
	ctx.SetError("Null object")
	return 0
}

func (n *nullObject) GetLength(ctx *HostImpl) int32 {
	ctx.SetError("Null object")
	return 0
}

func (n *nullObject) GetObject(ctx *HostImpl, keyId int32, typeId int32) int32 {
	panic("implement me")
}

func (n *nullObject) GetString(ctx *HostImpl, keyId int32) string {
	ctx.SetError("Null object")
	return ""
}

func (n *nullObject) SetInt(ctx *HostImpl, keyId int32, value int64) {
	ctx.SetError("Null object")
}

func (n *nullObject) SetString(ctx *HostImpl, keyId int32, value string) {
	ctx.SetError("Null object")
}
