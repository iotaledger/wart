package spec

import (
	"github.com/iotaledger/wart/wasm/executor/context"
	"github.com/iotaledger/wart/wasm/wasm"
)

type SpecModule struct {
	Module *wasm.Module
	VM     *context.Runner
}
