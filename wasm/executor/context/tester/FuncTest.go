package tester

type FuncTest struct {
	Name  string     `json:"name"`
	Tests []*RunTest `json:"tests"`
}
