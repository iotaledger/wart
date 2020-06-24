package helper

type Instruction interface {
	GetIP() int
	Opcode() byte
	StackChange() int
	String() string
}
