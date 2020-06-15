WebAssembly Run-Time for Go
=====

The `Wart` (WebAssembly Run-Time) project aims to provide a set of tools 
that support the [WebAssembly](https://webassembly.org) v1.1
[specification](https://webassembly.github.io/spec/core/index.html).

The goal of the `Wart` project is to provide an ecosystem of related components
and tools that allows other projects to easily include a `Wasm` virtual machine
and provide interfaces to the host system that hide away the differences
between input languages that were used to generate the `Wasm` binary files and
the language of the host system. Examples of these are memory management and/or
string representation differences.

The reference implementation of the `Wart` project has been written in the
[Go](https://golang.org) language. The basic design is such that translation
of the `Wart` project to other languages should be a trivial exercise.

The 1-to-1 translation from Go to Java showcases this property. 

## Contents

`Wart` provides a number of stand-alone components:

- _WasmReader_ reads a `Wasm` binary file into a `Wart` code tree representation.
- _WasmWriter_ writes a `Wart` code tree to a `Wasm` binary file.
- _WasmAnalyzer_ analyzes a `Wart` code tree for any inconsistencies and prepares
  the tree for execution.
- _WasmTester_ runs tests specified by .json files on specific `Wasm` code.
- _WatWriter_ writes a `Wart` code tree as a .wat WebAssembly text file.

Current implementation already has the new multi-valued returns but to be really
useful still needs to implement [WASI](https://wasi.dev/) (System Interface) and
[WAIT](https://hacks.mozilla.org/2019/08/webassembly-interface-types/)
(Interface Types)

Future envisioned components are:

- _WatReader_ that can read a .wat WebAssembly text file back into a `Wart` code
  tree representation.
- _WastReader_ that can read and execute .wast WebAssembly Test text files.
- _WasmCompiler_ that can generate [LLVM](https://llvm.org/) code from the `Wart`
   code tree and will allow running the `Wasm` code at native speed.

## Contributing

Currently known community contributions that are underway:
- `Wart` project implementation in Java (currently on par with Go version)
- `Wart` project implementation in Rust
