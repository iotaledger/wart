package host

type HostArray struct {
	objId   int32
	objType int
	ints    []int32
}

func (h *HostArray) GetInt(keyId int32) int32 {
	panic("implement me")
}

func (h *HostArray) GetString(keyId int32) string {
	panic("implement me")
}

func (h *HostArray) SetInt(keyId int32, value int32) {
	panic("implement me")
}

func (h *HostArray) SetString(keyId int32, value string) {
	panic("implement me")
}
