package test

type TestFolder struct {
	Uses    map[string]*TestValue `json:"uses"`
	Modules []*TestModule         `json:"modules"`
}

func NewFolderTest() *TestFolder {
	return &TestFolder{}
}
