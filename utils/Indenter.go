package utils

import "strings"

type Indenter struct {
	indent int
}

func (m *Indenter) Indent(indent int) {
	m.indent += indent
}

func (m *Indenter) String() string {
	return strings.Repeat(" ", m.indent)
}
