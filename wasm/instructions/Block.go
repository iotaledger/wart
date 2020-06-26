package instructions

import (
	"fmt"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors/context"
	"github.com/iotaledger/wart/wasm/instructions/helper"
	"github.com/iotaledger/wart/wasm/sections"
)

const BLOCK_EMPTY = int32(-0x40)

type Block struct {
	Base
	block     []helper.Instruction
	blockType int32
	elseBlock []helper.Instruction
	label     *context.Label
}

func NewBlock() helper.Instruction {
	return &Block{}
}

func (o *Block) Analyze(a *context.Analyzer) {
	o.label = context.NewLabel(sections.NewFuncType(), o)
	o.label.BlockInst = o
	switch {
	case o.blockType == BLOCK_EMPTY:
	case o.blockType < 0:
		if o.blockType < -4 {
			a.Error = o.fail("Invalid block utils.Errordata type")
			return
		}
		o.label.BlockType.ResultTypes = []value.DataType{o.blockDataType()}
	default:
		if uint32(o.blockType) >= a.Module.MaxFuncTypes() {
			a.Error = o.fail("Invalid block function type")
			return
		}
		o.label.BlockType = a.Module.FuncTypes[o.blockType]
	}
	if o.opcode != op.LOOP {
		blockLen := len(o.block) + len(o.elseBlock)
		o.label.Target = a.Code[o.IP+blockLen]
		if o.label.Target.Opcode() != op.END {
			a.Error = o.fail("Missing block end instruction")
			return
		}
	}
	// push label on label stack
	a.Labels = append([]*context.Label{o.label}, a.Labels...)

	a.PopMulti(o.label.BlockType.ParamTypes)
	if a.Error != nil {
		return
	}

	// mark stack, so that it cannot pop beyond the mark
	// while working within this block
	a.BlockMark = a.SP
	o.label.UnwindSP = a.SP
	a.PushMulti(o.label.BlockType.ParamTypes)
}

func (o *Block) blockDataType() value.DataType {
	return value.DataType(o.blockType & 0x7f)
}

func (o *Block) makeBlock(_ helper.Instruction) []helper.Instruction {
	block := make([]helper.Instruction, 1, 1+len(o.block)+len(o.elseBlock))
	block[0] = o
	return append(append(block, o.block...), o.elseBlock...)
}

func (o *Block) Read(r *context.Reader) {
	o.blockType = r.GetI32()
	if r.Error != nil {
		return
	}
	if o.blockType < -4 && o.blockType != BLOCK_EMPTY {
		r.Error = o.fail("Invalid block type index: %d", o.blockType)
		return
	}
	o.block = readSubBlock(r)
	if r.Error != nil {
		return
	}
	if o.opcode == op.IF && r.Opcode == op.ELSE {
		o.elseBlock = readSubBlock(r)
		if r.Error != nil {
			return
		}
	}
	if r.Opcode != op.END {
		r.Error = o.fail("Expected end instruction")
	}
}

func (o *Block) setRunner() {
	if o.opcode != op.IF {
		// op.BLOCK and op.LOOP are effectively op.NOP
		o.run = func(vm *Runner) {}
		return
	}

	sp := o.SP
	skipIfBlock := o.block[len(o.block)-1]
	if len(o.elseBlock) != 0 {
		skipIfBlock = o.elseBlock[0]
	}
	o.run = func(vm *Runner) {
		if vm.Frame[sp].I32 == 0 {
			vm.Next = skipIfBlock
		}
	}
}

func (o *Block) String() string {
	if o.blockType >= 0 {
		return fmt.Sprintf("%s %d", o.Mnemonic(), o.blockType)
	}

	dataType := o.blockDataType()
	switch dataType {
	case value.I32, value.I64, value.F32, value.F64:
		return fmt.Sprintf("%s %v", o.Mnemonic(), dataType)
	case 0x40:
		return o.Mnemonic()
	default:
		panic("Invalid utils.Errordata type")
	}
}

func (o *Block) Write(w *context.Writer) {
	w.PutI32(o.blockType)
}
