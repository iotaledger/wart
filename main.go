package main

import (
	"fmt"
	"github.com/iotaledger/wart/host"
	"github.com/iotaledger/wart/wasm/consts/desc"
	"github.com/iotaledger/wart/wasm/executors"
	"github.com/iotaledger/wart/wasm/instructions"
	"github.com/iotaledger/wart/wasm/sections"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"strings"
)

var DEBUG_MODULE = "xxx.wasm"

func main() {
	fmt.Println("Hello, Wart!")
	runSC()
	//listInstructions()
	//testerTests()
	//readerTest("D:\\Work\\Rust\\wasmtest\\target\\wasm32-unknown-unknown\\debug\\wasmtest.wasm")
	//readerTest("D:\\Work\\Rust\\wasmtest\\target\\wasm32-unknown-unknown\\release\\wasmtest.wasm")
	//readerTest("D:\\Work\\Rust\\wasmtest\\pkg\\wasmtest_bg.wasm")
	//readerTests()
	//specTests()
	fmt.Printf("\n%d tests executed, %d failed.\n", executors.TotalNrOfTests, executors.TotalNrFailed)
	fmt.Println("Ready!")
}

func runSC() {
	host.CreateHostModule()
	runner := executors.NewWasmRunner(nil)
	err := runner.Load("D:\\Work\\Go\\src\\github.com\\iotaledger\\wasp\\tools\\cluster\\tests\\wasptest\\wasmtest_bg.wasm")
	if err != nil {
		fmt.Printf("error loading wasm: " + err.Error())
		return
	}

	module := runner.Module()
	for _, export := range module.Exports {
		if export.ImportName == "no_op" {
			if export.ExternalType != desc.FUNC {
				fmt.Printf("error running wasm: wrong export type")
				return
			}
			function := module.Functions[export.Index]
			err = runner.RunFunction(function)
			if err != nil {
				fmt.Printf("error running wasm: " + err.Error())
				return
			}
			break
		}
	}
	fmt.Printf("Success!")
}

func listInstructions() {
	for opcode, sig := range instructions.Operations {
		if sig.Mnemonic == "" {
			continue
		}
		fmt.Printf("%02x [%3v %3v] -> [%3v] %2d %s\n", opcode, sig.Arg1, sig.Arg2, sig.Result, sig.StackChange, sig.Mnemonic)
	}
}

func readerTest(path string) {
	fmt.Println(path[3:])
	outPath := path[:len(path)-5] + ".wat"
	if strings.HasPrefix(path, "..\\input") {
		outPath = "." + path[8:len(path)-5] + ".wat"
	}
	_ = os.MkdirAll(filepath.Dir(outPath), 0770)
	data, err := ioutil.ReadFile(path)
	if err != nil {
		panic(err)
	}
	m := sections.NewModule()
	m.Debug = strings.HasSuffix(path, DEBUG_MODULE)
	r := executors.NewWasmReader(m, data)
	err = r.Read()
	if err != nil {
		// no need to report errors on the spec test suite because
		// specTest() will do more thorough testing of any error messages
		if !strings.Contains(path, "\\input\\spec\\") {
			fmt.Printf("Error: %v\n", err)
		}
		return
	}

	out, err := os.Create(outPath)
	if err != nil {
		panic(err)
	}
	defer out.Close()
	p := executors.NewWatWriter(m, out)
	p.Write()

	w := executors.NewWasmWriter(m)
	w.Write()

	newData := w.Data()
	if len(newData) != len(data) {
		fmt.Printf("  Warning: Data size mismatch: in=%d, out=%d\n", len(data), len(newData))
		return
	}

	for i, b := range data {
		if b != newData[i] {
			fmt.Printf("  Warning: Data mismatch: offset %d, in=0x%02x, out=0x%02x\n", i, b, newData[i])
			return
		}
	}

	// no need to do further analysis on the spec test suite because
	// specTest() will do more thorough testing of any error messages
	if strings.Contains(path, "\\input\\spec\\") {
		return
	}

	a := executors.NewWasmAnalyzer(m)
	err = a.Analyze()
	if err != nil {
		fmt.Printf("Error: %v\n\n", err)
	}
}

func readerTests() {
	err := filepath.Walk("../input",
		func(path string, info os.FileInfo, err error) error {
			if err != nil {
				return err
			}
			if strings.HasSuffix(path, ".wasm") {
				readerTest(path)
			}
			return nil
		})
	if err != nil {
		log.Println(err)
	}
}

func specTest(path string) {
	fmt.Printf("\nSpec input file %s\n", path[3:])
	t := executors.NewWasmTester(path, true)
	t.Test()
}

func specTests() {
	err := filepath.Walk("../input/spec",
		func(path string, info os.FileInfo, err error) error {
			if err != nil {
				return err
			}
			if strings.HasSuffix(path, ".json") {
				specTest(path)
			}
			return nil
		})
	if err != nil {
		log.Println(err)
	}
}

func testerTest(path string) {
	fmt.Printf("\n\nTest input file %s\n", path[3:])
	t := executors.NewWasmTester(path, false)
	t.Test()
}

func testerTests() {
	err := filepath.Walk("../input",
		func(path string, info os.FileInfo, err error) error {
			if err != nil {
				return err
			}
			if strings.HasSuffix(path, "tests.json") {
				testerTest(path)
			}
			return nil
		})
	if err != nil {
		log.Println(err)
	}
}
