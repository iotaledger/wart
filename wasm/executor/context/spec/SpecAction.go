package spec

type SpecAction struct {
	Args   []*SpecValue `json:"args"`
	Field  string       `json:"field"`
	Module string       `json:"module"`
	Type   string       `json:"type"`
}
