package wasm

import "github.com/iotaledger/wart/wasm/consts/value"

type FuncType struct {
	Identifier
	ParamTypes  []value.Type
	ResultTypes []value.Type
}

func NewFuncType() *FuncType {
	return &FuncType{}
}

func (ft *FuncType) CheckTypes() error {
	for _, vt := range ft.ParamTypes {
		err := vt.Check()
		if err != nil {
			return err
		}
	}
	for _, vt := range ft.ResultTypes {
		err := vt.Check()
		if err != nil {
			return err
		}
	}
	return nil
}

func (ft *FuncType) IsSameAs(rhs *FuncType) bool {
	if len(ft.ParamTypes) != len(rhs.ParamTypes) ||
		len(ft.ResultTypes) != len(rhs.ResultTypes) {
		return false
	}
	for i, vt := range ft.ParamTypes {
		if vt != rhs.ParamTypes[i] {
			return false
		}
	}
	for i, vt := range ft.ResultTypes {
		if vt != rhs.ResultTypes[i] {
			return false
		}
	}
	return true
}
