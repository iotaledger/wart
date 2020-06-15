package tester

type FolderTest struct {
	Uses    map[string]*ValueTest `json:"uses"`
	Modules []*ModuleTest         `json:"modules"`
}
