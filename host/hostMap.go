package host

type HostMap struct {
	objId  int32
	fields map[int32]interface{}
}

func (h *HostMap) GetInt(ctx *HostImpl, keyId int32) int32 {
	panic("implement me")
}

func (h *HostMap) GetString(ctx *HostImpl, keyId int32) string {
	panic("implement me")
}

func (h *HostMap) SetInt(ctx *HostImpl, keyId int32, value int32) {
	panic("implement me")
}

func (h *HostMap) SetString(ctx *HostImpl, keyId int32, value string) {
	panic("implement me")
}