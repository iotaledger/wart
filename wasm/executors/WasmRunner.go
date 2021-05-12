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

func (r *WasmRunner) Interrupt() {
	r.vm.Gas = instructions.GasTimeout
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
	return linker.Link()
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

func (r *WasmRunner) RunExport(exportName string, params []sections.Variable) error {
	m := r.Module()
	for _, export := range m.Exports {
		if export.ImportName == exportName {
			if export.ExternalType != desc.FUNC {
				return errors.New("invalid export type")
			}
			function := m.Functions[export.Index]
			return r.RunFunction(function, params)
		}
	}
	return errors.New("invalid export name")
}

func (r *WasmRunner) RunFunction(function *sections.Function, params []sections.Variable) error {
	if len(params) != len(function.FuncType.ParamTypes) {
		return errors.New("parameter count mismatch")
	}
	r.vm.Frame = make([]sections.Variable, function.MaxLocalIndex()+function.FrameSize)
	copy(r.vm.Frame, params)
	r.vm.Gas = instructions.GasUnlimited
	return instructions.RunBlock(r.vm, function.Body)
}
