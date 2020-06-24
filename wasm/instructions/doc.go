// Package instruction contains the handlers for specific groups of instructions.
// Each instruction object knows how to process itself in the context of some
// executors that work on instructions like WasmReader, WasmWriter, WasmAnalyzer,
// and WasmRunner.
//
// Externally each instruction is seen through a simple Instruction interface.
// Internally they are seen through the instruction.ctxInstruction interface, which
// provides the extra interface methods each object needs to be handled by their
// corresponding executor. In addition each instruction object contains a Base object
// that provides common methods and fields for each instruction.
//
// The following instruction groups are defined:
//   Binary  - operate on 2 same-type arguments and return a result of that same type.
//   Block   - block type pseudo-instructions (block, loop, and if)
//   Bool    - compare 2 same-type arguments and return a boolean (i32) type.
//   Branch  - branching instructions (br, br_if, and br_table, return).
//   Call    - function call instructions (call, call_indirect, memory.grow, and memory.size).
//   Const   - define constant values (const.i32, const.i64, const.f32, and const.f64).
//   Convert - convert from one type to another type
//   Mem     - access memory locations (load and store).
//   Unary   - operate on 1 argument and return a result of the same type as the argument.
//   Var     - get or set local or global variables.
//
//   Misc    - the few remaining instructions that fall outside the above groups.
//             (unreachable, nop, else, end, drop, select)
package instructions
