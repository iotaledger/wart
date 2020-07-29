package host

type nullObject struct {
}

func (n *nullObject) GetInt(ctx *HostImpl, keyId int32) int32 {
	ctx.SetError("Null object")
	return 0
}

func (n *nullObject) GetString(ctx *HostImpl, keyId int32) string {
	ctx.SetError("Null object")
	return ""
}

func (n *nullObject) SetInt(ctx *HostImpl, keyId int32, value int32) {
	ctx.SetError("Null object")
}

func (n *nullObject) SetString(ctx *HostImpl, keyId int32, value string) {
	ctx.SetError("Null object")
}
