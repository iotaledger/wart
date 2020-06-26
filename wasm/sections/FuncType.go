package sections

import "github.com/iotaledger/wart/wasm/consts/value"

type FuncType struct {
	Identifier
	ParamTypes  []value.DataType
	ResultTypes []value.DataType
}

func NewFuncType() *FuncType {
	return &FuncType{}
}

func (ft *FuncType) CheckTypes() error {
	for _, paramType := range ft.ParamTypes {
		err := paramType.Check()
		if err != nil {
			return err
		}
	}
	for _, resultType := range ft.ResultTypes {
		err := resultType.Check()
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
	for i, paramType := range ft.ParamTypes {
		if paramType != rhs.ParamTypes[i] {
			return false
		}
	}
	for i, resultType := range ft.ResultTypes {
		if resultType != rhs.ResultTypes[i] {
			return false
		}
	}
	return true
}
