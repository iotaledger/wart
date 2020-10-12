package executors

import (
	"errors"
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/executors/context"
	"github.com/iotaledger/wart/wasm/instructions"
	"github.com/iotaledger/wart/wasm/sections"
)

type WasmRunner struct {
	vm *context.Runner
}

func NewWasmRunner() *WasmRunner {
	return &WasmRunner{vm: context.NewRunner(sections.NewModule())}
}

func (r *WasmRunner) Load(wasmData []byte) error {
	reader := NewWasmReader(r.Module(), wasmData)
	err := reader.Read()
	if err != nil {
		return err
	}

	analyzer := NewWasmAnalyzer(r.Module())
	err = analyzer.Analyze()
	if err != nil {
		return err
	}

	linker := NewWasmLinker(r.Module())
	err = linker.Link()
	if err != nil {
		return err
	}

	return nil
}

func (r *WasmRunner) Memory() []byte {
	memories := r.Module().Memories
	if len(memories) != 1 {
		return nil
	}
	return memories[0].Pool
}

func (r *WasmRunner) Module() *sections.Module {
	return r.vm.Module
}

func (r *WasmRunner) RunExport(exportName string) error {
	m := r.Module()
	for _, export := range m.Exports {
		if export.ImportName == exportName {
			if export.ExternalType != desc.FUNC {
				return errors.New("Invalid export type")
			}
			function := m.Functions[export.Index]
			return r.RunFunction(function)
		}
	}

	return errors.New("Invalid export name")
}

func (r *WasmRunner) RunFunction(function *sections.Function) error {
	r.vm.Frame = make([]sections.Variable, function.MaxLocalIndex()+function.FrameSize)
	err := instructions.RunBlock(r.vm, function.Body)
	return err
}
