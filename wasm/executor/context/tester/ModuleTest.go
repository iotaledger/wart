package tester

type ModuleTest struct {
	File  string      `json:"file"`
	Funcs []*FuncTest `json:"funcs"`
}

func NewModuleTest() *ModuleTest {
	return &ModuleTest{}
}
