package wasm

type Instruction interface {
	GetIP() int
	Opcode() byte
	StackChange(m *Module) int
	String() string
}
