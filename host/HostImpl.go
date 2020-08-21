package host

import (
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/host/interfaces/objtype"
)

type HostImpl struct {
	HostBase
}

func NewHostImpl() *HostImpl {
	h := &HostImpl{}
	h.Init()

	root := NewHostMap(h)
	root.readonly = true
	h.AddObject(root)

	balance := NewHostMap(h)
	balance.readonly = true
	root.fields[interfaces.KeyBalance] = h.AddObject(balance)
	root.types[interfaces.KeyBalance] = objtype.OBJTYPE_MAP

	config := NewHostMap(h)
	config.readonly = true
	root.fields[interfaces.KeyConfig] = h.AddObject(config)
	root.types[interfaces.KeyConfig] = objtype.OBJTYPE_MAP

	params := NewHostMap(h)
	params.readonly = true
	root.fields[interfaces.KeyParams] = h.AddObject(params)
	root.types[interfaces.KeyParams] = objtype.OBJTYPE_MAP

	reqBalance := NewHostMap(h)
	reqBalance.readonly = true
	root.fields[interfaces.KeyReqBalance] = h.AddObject(reqBalance)
	root.types[interfaces.KeyReqBalance] = objtype.OBJTYPE_MAP

	root.fields[interfaces.KeyRequests] = h.AddObject(NewHostArray(h, objtype.OBJTYPE_MAP))
	root.types[interfaces.KeyRequests] = objtype.OBJTYPE_MAP_ARRAY

	root.fields[interfaces.KeyState] = h.AddObject(NewHostMap(h))
	root.types[interfaces.KeyState] = objtype.OBJTYPE_MAP

	root.fields[interfaces.KeyTransfers] = h.AddObject(NewHostArray(h, objtype.OBJTYPE_MAP))
	root.types[interfaces.KeyTransfers] = objtype.OBJTYPE_MAP_ARRAY

	return h
}
