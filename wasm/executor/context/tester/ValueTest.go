package tester

import (
	"fmt"
	"github.com/iotaledger/wart/wasm/wasm"
)

type ValueTest struct {
	wasm.Variable
	Use string `json:"use"`
}

func NewValueTest() *ValueTest {
	return &ValueTest{}
}

func (v *ValueTest) String() string {
	return fmt.Sprintf("%v, Use=%s", v.Variable, v.Use)
}
