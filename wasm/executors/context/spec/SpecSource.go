package spec

type SpecSource struct {
	Commands []*SpecCommand `json:"commands"`
	Filename string         `json:"source_filename"`
}
