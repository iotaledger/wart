package spec

type SpecAction struct {
	Args  []*SpecValue `json:"args"`
	Field string       `json:"field"`
	Type  string       `json:"type"`
}
