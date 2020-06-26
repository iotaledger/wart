package test

import (
	"fmt"
	"github.com/iotaledger/wart/wasm/sections"
)

type TestValue struct {
	sections.Variable
	Use string `json:"use"`
}

func NewValueTest() *TestValue {
	return &TestValue{}
}

func (v *TestValue) String() string {
	return fmt.Sprintf("%v, Use=%s", v.Variable, v.Use)
}
