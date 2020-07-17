package executors

import (
	"errors"
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/executors/context"
	"github.com/iotaledger/wart/wasm/instructions"
	"github.com/iotaledger/wart/wasm/sections"
	"io/ioutil"
)

type WasmRunner struct {
	m  *sections.Module
	vm *context.Runner
}

func NewWasmRunner() *WasmRunner {
	module := sections.NewModule()
	return &WasmRunner{m: module, vm: context.NewRunner(module)}
}

func (r *WasmRunner) Load(path string) error {
	data, err := ioutil.ReadFile(path)
	if err != nil {
		return err
	}

	reader := NewWasmReader(r.m, data)
	err = reader.Read()
	if err != nil {
		return err
	}

	analyzer := NewWasmAnalyzer(r.m)
	err = analyzer.Analyze()
	if err != nil {
		return err
	}

	linker := NewWasmLinker(r.m)
	err = linker.Link()
	if err != nil {
		return err
	}

	return nil
}

func (r *WasmRunner) Module() *sections.Module {
	return r.m
}

func (r *WasmRunner) RunExport(exportName string) error {
	for _,export := range r.m.Exports {
		if export.ImportName == exportName {
			if export.ExternalType != desc.FUNC { return errors.New("Invalid export type") }
			function := r.m.Functions[export.Index]
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
