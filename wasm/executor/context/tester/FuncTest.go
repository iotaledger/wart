package tester

type FuncTest struct {
	Name  string     `json:"name"`
	Tests []*RunTest `json:"tests"`
}

func NewFuncTest() *FuncTest {
	return &FuncTest{}
}
