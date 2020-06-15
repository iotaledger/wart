package spec

type SpecCommand struct {
	Action     *SpecAction  `json:"action"`
	As         string       `json:"as"`
	Expected   []*SpecValue `json:"expected"`
	Filename   string       `json:"filename"`
	Line       uint         `json:"line"`
	ModuleType string       `json:"module_type"`
	Name       string       `json:"name"`
	Text       string       `json:"text"`
	Type       string       `json:"type"`
}
