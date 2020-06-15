package wasm

// Since we have external and internal variants of these
// in a Module, we may as well group them together.
type Entities struct {
	Functions []*Function
	Globals   []*Global
	Memories  []*Memory
	Tables    []*Table
}
