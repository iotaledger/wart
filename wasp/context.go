package wasp

type ScContext struct {
	root *ScMutableMap
}

func NewScContext() *ScContext {
	return &ScContext{root: &ScMutableMap{objId: 1}}
}

func (ctx *ScContext) Balance(color string) int64 {
	if color == "" {
		color = "iota"
	}
	return ctx.root.GetMap("balance").GetInt(color).Value()
}

func (ctx *ScContext) Colors() *ScImmutableStringArray {
	return ctx.root.GetStringArray("colors").Immutable()
}

func (ctx *ScContext) Config() *ScImmutableMap {
	return ctx.root.GetMap("config").Immutable()
}

func (ctx *ScContext) Error() *ScMutableString {
	return ctx.root.GetString("error")
}

func (ctx *ScContext) Log(text string) {
	SetString(1, KeyLog(), text)
}

func (ctx *ScContext) Owner() string {
	return ctx.root.GetString("owner").Value()
}

func (ctx *ScContext) Params() *ScImmutableMap {
	return ctx.root.GetMap("params").Immutable()
}

func (ctx *ScContext) Random(max int64) int64 {
	return int64(uint64(ctx.root.GetInt("random").Value()) % uint64(max))
}

func (ctx *ScContext) RequestBalance(color string) int64 {
	if color == "" {
		color = "iota"
	}
	return ctx.root.GetMap("reqBalance").GetInt(color).Value()
}

func (ctx *ScContext) RequestColors() *ScImmutableStringArray {
	return ctx.root.GetStringArray("reqColors").Immutable()
}

func (ctx *ScContext) RequestHash() string {
	return ctx.root.GetString("reqHash").Value()
}

func (ctx *ScContext) Requests() *ScMutableMapArray {
	return ctx.root.GetMapArray("requests")
}

func (ctx *ScContext) ScAddress() string {
	return ctx.root.GetString("scAddress").Value()
}

func (ctx *ScContext) Sender() string {
	return ctx.root.GetString("sender").Value()
}

func (ctx *ScContext) State() *ScMutableMap {
	return ctx.root.GetMap("state")
}

func (ctx *ScContext) Timestamp() int64 {
	return ctx.root.GetInt("timestamp").Value()
}

func (ctx *ScContext) Trace(text string) {
	SetString(1, KeyTrace(), text)
}

func (ctx *ScContext) Transfers() *ScMutableMapArray {
	return ctx.root.GetMapArray("transfers")
}
