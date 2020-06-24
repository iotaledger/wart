package sections

type Memory struct {
	Identifier
	Pool []byte
	Max  uint32
	Min  uint32
}

func NewMemory() *Memory {
	return &Memory{}
}
