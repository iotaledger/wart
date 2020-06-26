package test

type TestRun struct {
	Err string       `json:"err"`
	In  []*TestValue `json:"in"`
	Out []*TestValue `json:"out"`
}

func NewRunTest() *TestRun {
	return &TestRun{}
}
