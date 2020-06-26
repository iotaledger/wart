package test

type TestModule struct {
	File  string      `json:"file"`
	Funcs []*TestFunc `json:"funcs"`
}

func NewModuleTest() *TestModule {
	return &TestModule{}
}
