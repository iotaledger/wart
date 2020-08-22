package host

import (
	"github.com/iotaledger/wart/host/interfaces"
	"github.com/iotaledger/wart/host/interfaces/objtype"
)

var keyMap = map[string]int32{
	"balance":    interfaces.KeyBalance,
	"config":     interfaces.KeyConfig,
	"error":      interfaces.KeyError,
	"length":     interfaces.KeyLength,
	"log":        interfaces.KeyLog,
	"params":     interfaces.KeyParams,
	"reqBalance": interfaces.KeyReqBalance,
	"requests":   interfaces.KeyRequests,
	"state":      interfaces.KeyState,
	"trace":      interfaces.KeyTrace,
	"traceHost":  interfaces.KeyTraceHost,
	"transfers":  interfaces.KeyTransfers,
}

type HostImpl struct {
	HostBase
}

func NewHostImpl() *HostImpl {
	h := &HostImpl{}
	h.Init(h, &keyMap)

	useReadOnly := false
	root := NewHostMap(h)
	root.readonly = useReadOnly
	h.AddObject(root)

	balance := NewHostMap(h)
	balance.readonly = useReadOnly
	root.fields[interfaces.KeyBalance] = h.AddObject(balance)
	root.types[interfaces.KeyBalance] = objtype.OBJTYPE_MAP

	config := NewHostMap(h)
	config.readonly = useReadOnly
	root.fields[interfaces.KeyConfig] = h.AddObject(config)
	root.types[interfaces.KeyConfig] = objtype.OBJTYPE_MAP

	params := NewHostMap(h)
	params.readonly = useReadOnly
	root.fields[interfaces.KeyParams] = h.AddObject(params)
	root.types[interfaces.KeyParams] = objtype.OBJTYPE_MAP

	reqBalance := NewHostMap(h)
	reqBalance.readonly = useReadOnly
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
