package instructions

import (
	"github.com/iotaledger/wart/utils"
	"github.com/iotaledger/wart/wasm/consts/op"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/executors/context"
	"github.com/iotaledger/wart/wasm/instructions/helper"
)

type Runner = context.Runner
type instructionRunner func(vm *Runner)

type ctxInstruction interface {
	helper.Instruction
	Analyze(a *context.Analyzer)
	fail(format string, a ...interface{}) error
	getNext() ctxInstruction
	makeBlock(instruction helper.Instruction) []helper.Instruction
	Read(r *context.Reader)
	Run(vm *Runner)
	setIP(ip int)
	setNext(next helper.Instruction)
	setOpcode(opcode byte)
	setRunner()
	setSP(sp int)
	Write(w *context.Writer)
}

// Base implements basic behavior for all Instruction types.
// This class is not to be instantiated by itself.
// Use one of the concrete instruction types instead.
type Base struct {
	IP     int
	SP     int
	next   ctxInstruction
	opcode byte
	run    instructionRunner
}

// compile time verification that Base implements all of ctxInstruction
var _ ctxInstruction = (*Base)(nil)

// we don't want anyone to instantiate Base objects
// func NewBase() *Base

func (o *Base) Analyze(_ *context.Analyzer) {
}

func AnalyzeBlock(a *context.Analyzer) {
	for i, instr := range a.Code {
		instruction := instr.(ctxInstruction)
		a.IP = i
		if i+1 < len(a.Code) {
			instruction.setNext(a.Code[i+1])
		}
		sig := &AllSignatures[instruction.Opcode()]
		if sig.Mnemonic == "" {
			panic("Invalid instruction opcode")
		}

		if sig.Arg2 != value.NONE {
			arg2 := a.PopExpected(sig.Arg2)
			if a.Error != nil {
				return
			}
			if arg2 != sig.Arg2 {
				a.Fail("%s: Invalid 1st operand type: %v instead of %v",
					sig.Mnemonic, arg2, sig.Arg2)
				return
			}
		}

		if sig.Arg1 != value.NONE {
			arg1 := a.PopExpected(sig.Arg1)
			if a.Error != nil {
				return
			}
			if arg1 != sig.Arg1 {
				a.Fail("%s: Invalid 1st operand type: %v instead of %v",
					sig.Mnemonic, arg1, sig.Arg1)
				return
			}
		}

		instruction.setSP(a.SP)
		instruction.Analyze(a)
		if a.Error != nil {
			return
		}

		if sig.Result != value.NONE {
			a.Push(sig.Result)
		}

		instruction.setRunner()
	}
}

func b2i(b bool) int32 {
	var i int32
	if b {
		i = 1
	}
	return i
}

func CreateInstruction(opcode byte) helper.Instruction {
	sig := AllSignatures[opcode]
	if sig.Factory == nil {
		return nil
	}
	instr := sig.Factory().(ctxInstruction)
	instr.setOpcode(opcode)
	return instr
}

func (o *Base) fail(format string, a ...interface{}) error {
	return utils.Error(o.Mnemonic()+": "+format, a...)
}

func (o *Base) getNext() ctxInstruction {
	return o.next
}

func (o *Base) GetIP() int {
	return o.IP
}

func (o *Base) makeBlock(instruction helper.Instruction) []helper.Instruction {
	return []helper.Instruction{instruction}
}

func (o *Base) Mnemonic() string {
	return AllSignatures[o.opcode].Mnemonic
}

func (o *Base) Opcode() byte {
	return o.opcode
}

func (o *Base) Read(_ *context.Reader) {
}

func ReadBlock(r *context.Reader) []helper.Instruction {
	r.IP = 0
	block := readSubBlock(r)
	if r.Error != nil {
		return make([]helper.Instruction, 0)
	}
	if r.Opcode != op.END {
		r.Error = utils.Error("Expected end instruction")
		return make([]helper.Instruction, 0)
	}
	return block
}

func readSubBlock(r *context.Reader) []helper.Instruction {
	block := make([]helper.Instruction, 0)
	for {
		opcode := r.GetByte()
		if r.Error != nil {
			break
		}
		instruction := CreateInstruction(opcode)
		if instruction == nil {
			r.Error = utils.Error("Invalid opcode: 0x%02x", opcode)
			break
		}
		ctxInstr := instruction.(ctxInstruction)
		ctxInstr.setIP(r.IP)
		r.IP++
		ctxInstr.Read(r)
		if r.Error != nil {
			break
		}
		block = append(block, ctxInstr.makeBlock(ctxInstr)...)
		if opcode == op.END || opcode == op.ELSE {
			r.Opcode = opcode
			return block
		}
	}
	return make([]helper.Instruction, 0)
}

func (o *Base) Run(vm *Runner) {
	o.run(vm)
}

func RunBlock(vm *Runner, block []helper.Instruction) error {
	if !vm.Module.Analyzed {
		panic("Analyze module before running code")
	}
	if len(block) == 0 {
		return utils.Error("External function call not yet implemented")
	}
	instr := block[0]
	for instr != nil {
		ctxInstr := instr.(ctxInstruction)
		vm.Next = ctxInstr.getNext()
		ctxInstr.Run(vm)
		if vm.Error != nil {
			err := vm.Error
			vm.Error = nil
			return err
		}
		instr = vm.Next
	}
	return nil
}

func (o *Base) setIP(ip int) {
	o.IP = ip
}

func (o *Base) setNext(next helper.Instruction) {
	o.next = next.(ctxInstruction)
}

func (o *Base) setOpcode(opcode byte) {
	o.opcode = opcode
}

func (o *Base) setRunner() {
}

func (o *Base) setSP(sp int) {
	o.SP = sp
}

func (o *Base) StackChange() int {
	return AllSignatures[o.opcode].StackChange
}

func (o *Base) String() string {
	return o.Mnemonic()
}

func (o *Base) Write(_ *context.Writer) {
}

func WriteBlock(w *context.Writer, block []helper.Instruction) {
	for _, instr := range block {
		o := instr.(ctxInstruction)
		w.PutByte(o.Opcode())
		o.Write(w)
	}
}
