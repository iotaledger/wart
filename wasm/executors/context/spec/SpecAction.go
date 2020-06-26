package spec

type SpecAction struct {
	ActionType string       `json:"type"`
	Args       []*SpecValue `json:"args"`
	ExportName string       `json:"field"`
	ModuleName string       `json:"module"`
}
