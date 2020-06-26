package test

type TestFunc struct {
	Name  string     `json:"name"`
	Tests []*TestRun `json:"tests"`
}

func NewFuncTest() *TestFunc {
	return &TestFunc{}
}
