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

func (funcType *FuncType) CheckTypes() error {
	for _, vt := range funcType.ParamTypes {
		err := vt.Check()
		if err != nil {
			return err
		}
	}
	for _, vt := range funcType.ResultTypes {
		err := vt.Check()
		if err != nil {
			return err
		}
	}
	return nil
}
