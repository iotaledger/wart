package spec

type SpecCommand struct {
	Action      *SpecAction  `json:"action"`
	Alias       string       `json:"as"`
	CommandType string       `json:"type"`
	ErrorText   string       `json:"text"`
	Expected    []*SpecValue `json:"expected"`
	Filename    string       `json:"filename"`
	Line        uint         `json:"line"`
	ModuleType  string       `json:"module_type"`
	Name        string       `json:"name"`
}
