package sections

type Custom struct {
	Identifier
	Data      []byte
	SectionId byte
}

func NewCustom() *Custom {
	return &Custom{}
}
