package tester

type RunTest struct {
	Err string       `json:"err"`
	In  []*ValueTest `json:"in"`
	Out []*ValueTest `json:"out"`
}

func NewRunTest() *RunTest {
	return &RunTest{}
}
