(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32 i32 i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32 i32)))
  (type (;4;) (func (param i32 i32 i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;6;) (func))
  (type (;7;) (func (param i32 i32) (result i64)))
  (type (;8;) (func (param i32 i32 i32 i32 i32 i32 i32)))
  (type (;9;) (func (result i32)))
  (type (;10;) (func (param i32) (result i32)))
  (type (;11;) (func (param i32 i32)))
  (type (;12;) (func (param i32 i64)))
  (type (;13;) (func (param i32 i32 i64)))
  (type (;14;) (func (param i32 i32 i32 i32 i32)))
  (type (;15;) (func (param i32 i32 i32) (result f64)))
  (type (;16;) (func (param i32 i32 i32) (result i64)))
  (type (;17;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;18;) (func (param f64)))
  (type (;19;) (func (param i64)))

  (import "waspGo" "hostGetInt" (func (;0;) (type 1) (param i32 i32 i32)))
  (import "waspGo" "hostGetString" (func (;1;) (type 1) (param i32 i32 i32)))
  (import "waspGo" "hostGetKeyId" (func (;2;) (type 2) (param i32 i32) (result i32)))
  (import "waspGo" "hostSetString" (func (;3;) (type 3) (param i32 i32 i32 i32)))
  (import "waspGo" "hostGetObjectId" (func (;4;) (type 4) (param i32 i32 i32) (result i32)))
  (import "waspGo" "hostSetInt" (func (;5;) (type 1) (param i32 i32 i32)))
  (import "wasi_unstable" "fd_write" (func (;6;) (type 5) (param i32 i32 i32 i32) (result i32)))

  (func "__wasm_call_ctors" (;7;) (type 6))
  (func "memcpy" (;8;) (type 4) (param i32 i32 i32) (result i32))
  (func "memset" (;9;) (type 4) (param i32 i32 i32) (result i32))
  (func "memmove" (;10;) (type 4) (param i32 i32 i32) (result i32))
  (func "github.com/iotaledger/wart/wasplib.GetInt" (;11;) (type 7) (param i32 i32) (result i64))
  (func "github.com/iotaledger/wart/wasplib.GetString" (;12;) (type 1) (param i32 i32 i32))
  (func "runtime.sliceAppend" (;13;) (type 8) (param i32 i32 i32 i32 i32 i32 i32))
  (func "runtime.stringFromBytes" (;14;) (type 3) (param i32 i32 i32 i32))
  (func "github.com/iotaledger/wart/wasplib.KeyLength" (;15;) (type 9) (result i32))
  (func "github.com/iotaledger/wart/wasplib.NewScContext" (;16;) (type 9) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScContext).Contract" (;17;) (type 10) (param i32) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableMap).GetMap" (;18;) (type 4) (param i32 i32 i32) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableMap).Immutable" (;19;) (type 10) (param i32) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScContext).Event" (;20;) (type 10) (param i32) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableMap).GetMapArray" (;21;) (type 4) (param i32 i32 i32) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableMapArray).GetMap" (;22;) (type 2) (param i32 i32) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScContext).Log" (;23;) (type 1) (param i32 i32 i32))
  (func "(github.com/iotaledger/wart/wasplib.ScContext).Request" (;24;) (type 10) (param i32) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScContext).State" (;25;) (type 10) (param i32) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScContext).Transfer" (;26;) (type 2) (param i32 i32) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScContract).Address" (;27;) (type 11) (param i32 i32))
  (func "(github.com/iotaledger/wart/wasplib.ScImmutableMap).GetString" (;28;) (type 3) (param i32 i32 i32 i32))
  (func "(github.com/iotaledger/wart/wasplib.ScImmutableString).Value" (;29;) (type 1) (param i32 i32 i32))
  (func "(github.com/iotaledger/wart/wasplib.ScEvent).Code" (;30;) (type 12) (param i32 i64))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt" (;31;) (type 3) (param i32 i32 i32 i32))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableInt).SetValue" (;32;) (type 13) (param i32 i32 i64))
  (func "(github.com/iotaledger/wart/wasplib.ScEvent).Delay" (;33;) (type 12) (param i32 i64))
  (func "(github.com/iotaledger/wart/wasplib.ScImmutableInt).Value" (;34;) (type 7) (param i32 i32) (result i64))
  (func "(github.com/iotaledger/wart/wasplib.ScImmutableMap).GetInt" (;35;) (type 3) (param i32 i32 i32 i32))
  (func "(github.com/iotaledger/wart/wasplib.ScImmutableMap).GetMap" (;36;) (type 4) (param i32 i32 i32) (result i32))
  (func "github.com/iotaledger/wart/wasplib.SetInt" (;37;) (type 13) (param i32 i32 i64))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableInt).Value" (;38;) (type 7) (param i32 i32) (result i64))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableMap).GetStringArray" (;39;) (type 4) (param i32 i32 i32) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableString).SetValue" (;40;) (type 3) (param i32 i32 i32 i32))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableString).Value" (;41;) (type 1) (param i32 i32 i32))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableStringArray).Clear" (;42;) (type 0) (param i32))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableStringArray).GetString" (;43;) (type 1) (param i32 i32 i32))
  (func "(github.com/iotaledger/wart/wasplib.ScMutableStringArray).Length" (;44;) (type 10) (param i32) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScRequest).Address" (;45;) (type 11) (param i32 i32))
  (func "(github.com/iotaledger/wart/wasplib.ScRequest).Params" (;46;) (type 10) (param i32) (result i32))
  (func "(github.com/iotaledger/wart/wasplib.ScTransfer).Address" (;47;) (type 1) (param i32 i32 i32))
  (func "(github.com/iotaledger/wart/wasplib.ScTransfer).Amount" (;48;) (type 12) (param i32 i64))
  (func "(reflect.Type).Align" (;49;) (type 10) (param i32) (result i32))
  (func "(reflect.Type).Kind" (;50;) (type 10) (param i32) (result i32))
  (func "(reflect.Type).NumField" (;51;) (type 10) (param i32) (result i32))
  (func "(reflect.Type).Field" (;52;) (type 1) (param i32 i32 i32))
  (func "(reflect.Type).Elem" (;53;) (type 10) (param i32) (result i32))
  (func "runtime._panic" (;54;) (type 11) (param i32 i32))
  (func "(reflect.Type).stripPrefix" (;55;) (type 10) (param i32) (result i32))
  (func "reflect.readVarint" (;56;) (type 11) (param i32 i32))
  (func "(reflect.Type).Size" (;57;) (type 10) (param i32) (result i32))
  (func "reflect.readStringSidetable" (;58;) (type 11) (param i32 i32))
  (func "runtime.alloc" (;59;) (type 10) (param i32) (result i32))
  (func "(reflect.Type).Len" (;60;) (type 10) (param i32) (result i32))
  (func "(reflect.Value).Bool" (;61;) (type 4) (param i32 i32 i32) (result i32))
  (func "(reflect.Value).Kind" (;62;) (type 4) (param i32 i32 i32) (result i32))
  (func "(reflect.Value).isIndirect" (;63;) (type 4) (param i32 i32 i32) (result i32))
  (func "(reflect.Value).Complex" (;64;) (type 3) (param i32 i32 i32 i32))
  (func "(reflect.Value).Field" (;65;) (type 14) (param i32 i32 i32 i32 i32))
  (func "(reflect.Value).Type" (;66;) (type 4) (param i32 i32 i32) (result i32))
  (func "reflect.loadValue" (;67;) (type 2) (param i32 i32) (result i32))
  (func "(reflect.Value).Float" (;68;) (type 15) (param i32 i32 i32) (result f64))
  (func "(reflect.Value).Index" (;69;) (type 14) (param i32 i32 i32 i32 i32))
  (func "(reflect.Value).Int" (;70;) (type 16) (param i32 i32 i32) (result i64))
  (func "(reflect.Value).Pointer" (;71;) (type 4) (param i32 i32 i32) (result i32))
  (func "runtime.nilPanic" (;72;) (type 6))
  (func "(reflect.Value).String" (;73;) (type 3) (param i32 i32 i32 i32))
  (func "(reflect.Value).Uint" (;74;) (type 16) (param i32 i32 i32) (result i64))
  (func "reflect.ValueOf" (;75;) (type 1) (param i32 i32 i32))
  (func "strconv.FormatInt" (;76;) (type 12) (param i32 i64))
  (func "runtime.lookupPanic" (;77;) (type 6))
  (func "strconv.ParseInt" (;78;) (type 1) (param i32 i32 i32))
  (func "strconv.syntaxError" (;79;) (type 5) (param i32 i32 i32 i32) (result i32))
  (func "strconv.rangeError" (;80;) (type 5) (param i32 i32 i32 i32) (result i32))
  (func "runtime.interfaceTypeAssert" (;81;) (type 0) (param i32))
  (func "runtime.reflectValueEqual" (;82;) (type 17) (param i32 i32 i32 i32 i32 i32) (result i32))
  (func "strconv.bsearch16" (;83;) (type 4) (param i32 i32 i32) (result i32))
  (func "increment" (;84;) (type 6))
  (func "incrementRepeat1" (;85;) (type 6))
  (func "incrementRepeatMany" (;86;) (type 6))
  (func "lockBets" (;87;) (type 6))
  (func "command-line-arguments.main" (;88;) (type 11) (param i32 i32))
  (func "no_op" (;89;) (type 6))
  (func "payWinners" (;90;) (type 6))
  (func "runtime.stringConcat" (;91;) (type 14) (param i32 i32 i32 i32 i32))
  (func "runtime.slicePanic" (;92;) (type 6))
  (func "placeBet" (;93;) (type 6))
  (func "playPeriod" (;94;) (type 6))
  (func "test" (;95;) (type 6))
  (func "tokenMint" (;96;) (type 6))
  (func "runtime.printstring" (;97;) (type 11) (param i32 i32))
  (func "runtime.printitf" (;98;) (type 11) (param i32 i32))
  (func "runtime.printnl" (;99;) (type 6))
  (func "_start" (;100;) (type 6))
  (func "runtime.scheduler" (;101;) (type 6))
  (func "runtime.markRoot" (;102;) (type 0) (param i32))
  (func "(runtime.gcBlock).state" (;103;) (type 10) (param i32) (result i32))
  (func "(runtime.gcBlock).markFree" (;104;) (type 0) (param i32))
  (func "runtime.startMark" (;105;) (type 0) (param i32))
  (func "runtime.runtimePanic" (;106;) (type 11) (param i32 i32))
  (func "(runtime.gcBlock).setState" (;107;) (type 11) (param i32 i32))
  (func "(runtime.gcBlock).findHead" (;108;) (type 10) (param i32) (result i32))
  (func "go_scheduler" (;109;) (type 6))
  (func "runtime.printfloat64" (;110;) (type 18) (param f64))
  (func "runtime.putchar" (;111;) (type 0) (param i32))
  (func "runtime.printint32" (;112;) (type 0) (param i32))
  (func "runtime.printuint64" (;113;) (type 19) (param i64))
  (func "runtime.printptr" (;114;) (type 0) (param i32))
  (func "(error).Error" (;115;) (type 1) (param i32 i32 i32))
  (func "resume" (;116;) (type 6))
  (func "runtime.resume$1" (;117;) (type 6))

  (table (;0;) (min 1) (max 1)))

  (memory (;0;) (min 16)))

  (global (;0;) (mut i32) (i32.const 65536))
  (global (;1;) i32 (i32.const 70816))
  (global (;2;) i32 (i32.const 70821))
  (global (;3;) i32 (i32.const 67568))
  (global (;4;) i32 (i32.const 70780))
  (global (;5;) i32 (i32.const 67572))
  (global (;6;) i32 (i32.const 65536))
  (global (;7;) i32 (i32.const 70821))
  (global (;8;) i32 (i32.const 65536))
  (global (;9;) i32 (i32.const 0))
  (global (;10;) i32 (i32.const 1))

  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 7))
  (export "memset" (func 9))
  (export "memcpy" (func 8))
  (export "memmove" (func 10))
  (export "runtime.stackChainStart" (global 1))
  (export "increment" (func 84))
  (export "incrementRepeat1" (func 85))
  (export "incrementRepeatMany" (func 86))
  (export "lockBets" (func 87))
  (export "command-line-arguments.main" (func 88))
  (export "no_op" (func 89))
  (export "payWinners" (func 90))
  (export "placeBet" (func 93))
  (export "playPeriod" (func 94))
  (export "test" (func 95))
  (export "tokenMint" (func 96))
  (export "_start" (func 100))
  (export "__heap_base" (global 2))
  (export "runtime.trackedGlobalsLength" (global 3))
  (export "runtime.trackedGlobalsBitmap.1335" (global 4))
  (export "runtime.trackedGlobalsStart" (global 5))
  (export "go_scheduler" (func 109))
  (export "resume" (func 116))
  (export "__dso_handle" (global 6))
  (export "__data_end" (global 7))
  (export "__global_base" (global 8))
  (export "__memory_base" (global 9))
  (export "__table_base" (global 10))

  (func "__wasm_call_ctors" (;7;) (type 6)
    (;0:0;)    end
  )

  (func "memcpy" (;8;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i32)
    (local (;10;) i32)
    (;0:0;)      block
    (;1:0;)        block
    (;2:1;)          local.get 2
    (;3:1;)          i32.eqz
    (;4:0;)          br_if 0
    (;5:1;)          local.get 1
    (;6:2;)          i32.const 3
    (;7:1;)          i32.and
    (;8:1;)          i32.eqz
    (;9:0;)          br_if 0
    (;10:1;)         local.get 0
    (;11:0;)         local.set 3
    (;12:0;)         loop
    (;13:1;)           local.get 3
    (;14:2;)           local.get 1
    (;15:2;)           i32.load8_u
    (;16:0;)           i32.store8
    (;17:1;)           local.get 2
    (;18:2;)           i32.const -1
    (;19:1;)           i32.add
    (;20:0;)           local.set 4
    (;21:1;)           local.get 3
    (;22:2;)           i32.const 1
    (;23:1;)           i32.add
    (;24:0;)           local.set 3
    (;25:1;)           local.get 1
    (;26:2;)           i32.const 1
    (;27:1;)           i32.add
    (;28:0;)           local.set 1
    (;29:1;)           local.get 2
    (;30:2;)           i32.const 1
    (;31:1;)           i32.eq
    (;32:0;)           br_if 2
    (;33:1;)           local.get 4
    (;34:0;)           local.set 2
    (;35:1;)           local.get 1
    (;36:2;)           i32.const 3
    (;37:1;)           i32.and
    (;38:0;)           br_if 0
    (;39:0;)           br 2
    (;40:0;)         end
    (;41:0;)       end
    (;42:1;)       local.get 2
    (;43:0;)       local.set 4
    (;44:1;)       local.get 0
    (;45:0;)       local.set 3
    (;46:0;)     end
    (;47:0;)     block
    (;48:0;)       block
    (;49:1;)         local.get 3
    (;50:2;)         i32.const 3
    (;51:1;)         i32.and
    (;52:1;)         local.tee 2
    (;53:0;)         br_if 0
    (;54:0;)         block
    (;55:0;)           block
    (;56:1;)             local.get 4
    (;57:2;)             i32.const 16
    (;58:1;)             i32.ge_u
    (;59:0;)             br_if 0
    (;60:1;)             local.get 4
    (;61:0;)             local.set 2
    (;62:0;)             br 1
    (;63:0;)           end
    (;64:1;)           local.get 4
    (;65:2;)           i32.const -16
    (;66:1;)           i32.add
    (;67:0;)           local.set 2
    (;68:0;)           loop
    (;69:1;)             local.get 3
    (;70:2;)             local.get 1
    (;71:2;)             i32.load
    (;72:0;)             i32.store
    (;73:1;)             local.get 3
    (;74:2;)             i32.const 4
    (;75:1;)             i32.add
    (;76:2;)             local.get 1
    (;77:3;)             i32.const 4
    (;78:2;)             i32.add
    (;79:2;)             i32.load
    (;80:0;)             i32.store
    (;81:1;)             local.get 3
    (;82:2;)             i32.const 8
    (;83:1;)             i32.add
    (;84:2;)             local.get 1
    (;85:3;)             i32.const 8
    (;86:2;)             i32.add
    (;87:2;)             i32.load
    (;88:0;)             i32.store
    (;89:1;)             local.get 3
    (;90:2;)             i32.const 12
    (;91:1;)             i32.add
    (;92:2;)             local.get 1
    (;93:3;)             i32.const 12
    (;94:2;)             i32.add
    (;95:2;)             i32.load
    (;96:0;)             i32.store
    (;97:1;)             local.get 3
    (;98:2;)             i32.const 16
    (;99:1;)             i32.add
    (;100:0;)            local.set 3
    (;101:1;)            local.get 1
    (;102:2;)            i32.const 16
    (;103:1;)            i32.add
    (;104:0;)            local.set 1
    (;105:1;)            local.get 4
    (;106:2;)            i32.const -16
    (;107:1;)            i32.add
    (;108:1;)            local.tee 4
    (;109:2;)            i32.const 15
    (;110:1;)            i32.gt_u
    (;111:0;)            br_if 0
    (;112:0;)          end
    (;113:0;)        end
    (;114:0;)        block
    (;115:1;)          local.get 2
    (;116:2;)          i32.const 8
    (;117:1;)          i32.and
    (;118:1;)          i32.eqz
    (;119:0;)          br_if 0
    (;120:1;)          local.get 3
    (;121:2;)          local.get 1
    (;122:2;)          i64.load align=2
    (;123:0;)          i64.store align=2
    (;124:1;)          local.get 1
    (;125:2;)          i32.const 8
    (;126:1;)          i32.add
    (;127:0;)          local.set 1
    (;128:1;)          local.get 3
    (;129:2;)          i32.const 8
    (;130:1;)          i32.add
    (;131:0;)          local.set 3
    (;132:0;)        end
    (;133:0;)        block
    (;134:1;)          local.get 2
    (;135:2;)          i32.const 4
    (;136:1;)          i32.and
    (;137:1;)          i32.eqz
    (;138:0;)          br_if 0
    (;139:1;)          local.get 3
    (;140:2;)          local.get 1
    (;141:2;)          i32.load
    (;142:0;)          i32.store
    (;143:1;)          local.get 1
    (;144:2;)          i32.const 4
    (;145:1;)          i32.add
    (;146:0;)          local.set 1
    (;147:1;)          local.get 3
    (;148:2;)          i32.const 4
    (;149:1;)          i32.add
    (;150:0;)          local.set 3
    (;151:0;)        end
    (;152:0;)        block
    (;153:1;)          local.get 2
    (;154:2;)          i32.const 2
    (;155:1;)          i32.and
    (;156:1;)          i32.eqz
    (;157:0;)          br_if 0
    (;158:1;)          local.get 3
    (;159:2;)          local.get 1
    (;160:2;)          i32.load8_u
    (;161:0;)          i32.store8
    (;162:1;)          local.get 3
    (;163:2;)          local.get 1
    (;164:2;)          i32.load8_u offset=1
    (;165:0;)          i32.store8 offset=1
    (;166:1;)          local.get 3
    (;167:2;)          i32.const 2
    (;168:1;)          i32.add
    (;169:0;)          local.set 3
    (;170:1;)          local.get 1
    (;171:2;)          i32.const 2
    (;172:1;)          i32.add
    (;173:0;)          local.set 1
    (;174:0;)        end
    (;175:1;)        local.get 2
    (;176:2;)        i32.const 1
    (;177:1;)        i32.and
    (;178:1;)        i32.eqz
    (;179:0;)        br_if 1
    (;180:1;)        local.get 3
    (;181:2;)        local.get 1
    (;182:2;)        i32.load8_u
    (;183:0;)        i32.store8
    (;184:1;)        local.get 0
    (;185:1;)        return
    (;186:0;)      end
    (;187:0;)      block
    (;188:1;)        local.get 4
    (;189:2;)        i32.const 32
    (;190:1;)        i32.lt_u
    (;191:0;)        br_if 0
    (;192:1;)        local.get 2
    (;193:2;)        i32.const -1
    (;194:1;)        i32.add
    (;195:1;)        local.tee 2
    (;196:2;)        i32.const 2
    (;197:1;)        i32.gt_u
    (;198:0;)        br_if 0
    (;199:0;)        block
    (;200:0;)          block
    (;201:0;)            block
    (;202:1;)              local.get 2
    (;203:0;)              br_table 0 1 2 0
    (;204:0;)            end
    (;205:1;)            local.get 3
    (;206:2;)            local.get 1
    (;207:2;)            i32.load8_u offset=1
    (;208:0;)            i32.store8 offset=1
    (;209:1;)            local.get 3
    (;210:2;)            local.get 1
    (;211:2;)            i32.load
    (;212:2;)            local.tee 5
    (;213:0;)            i32.store8
    (;214:1;)            local.get 3
    (;215:2;)            local.get 1
    (;216:2;)            i32.load8_u offset=2
    (;217:0;)            i32.store8 offset=2
    (;218:1;)            local.get 4
    (;219:2;)            i32.const -3
    (;220:1;)            i32.add
    (;221:0;)            local.set 6
    (;222:1;)            local.get 3
    (;223:2;)            i32.const 3
    (;224:1;)            i32.add
    (;225:0;)            local.set 7
    (;226:1;)            local.get 4
    (;227:2;)            i32.const -20
    (;228:1;)            i32.add
    (;229:2;)            i32.const -16
    (;230:1;)            i32.and
    (;231:0;)            local.set 8
    (;232:1;)            i32.const 0
    (;233:0;)            local.set 2
    (;234:0;)            loop
    (;235:1;)              local.get 7
    (;236:2;)              local.get 2
    (;237:1;)              i32.add
    (;238:1;)              local.tee 3
    (;239:2;)              local.get 1
    (;240:3;)              local.get 2
    (;241:2;)              i32.add
    (;242:2;)              local.tee 9
    (;243:3;)              i32.const 4
    (;244:2;)              i32.add
    (;245:2;)              i32.load
    (;246:2;)              local.tee 10
    (;247:3;)              i32.const 8
    (;248:2;)              i32.shl
    (;249:3;)              local.get 5
    (;250:4;)              i32.const 24
    (;251:3;)              i32.shr_u
    (;252:2;)              i32.or
    (;253:0;)              i32.store
    (;254:1;)              local.get 3
    (;255:2;)              i32.const 4
    (;256:1;)              i32.add
    (;257:2;)              local.get 9
    (;258:3;)              i32.const 8
    (;259:2;)              i32.add
    (;260:2;)              i32.load
    (;261:2;)              local.tee 5
    (;262:3;)              i32.const 8
    (;263:2;)              i32.shl
    (;264:3;)              local.get 10
    (;265:4;)              i32.const 24
    (;266:3;)              i32.shr_u
    (;267:2;)              i32.or
    (;268:0;)              i32.store
    (;269:1;)              local.get 3
    (;270:2;)              i32.const 8
    (;271:1;)              i32.add
    (;272:2;)              local.get 9
    (;273:3;)              i32.const 12
    (;274:2;)              i32.add
    (;275:2;)              i32.load
    (;276:2;)              local.tee 10
    (;277:3;)              i32.const 8
    (;278:2;)              i32.shl
    (;279:3;)              local.get 5
    (;280:4;)              i32.const 24
    (;281:3;)              i32.shr_u
    (;282:2;)              i32.or
    (;283:0;)              i32.store
    (;284:1;)              local.get 3
    (;285:2;)              i32.const 12
    (;286:1;)              i32.add
    (;287:2;)              local.get 9
    (;288:3;)              i32.const 16
    (;289:2;)              i32.add
    (;290:2;)              i32.load
    (;291:2;)              local.tee 5
    (;292:3;)              i32.const 8
    (;293:2;)              i32.shl
    (;294:3;)              local.get 10
    (;295:4;)              i32.const 24
    (;296:3;)              i32.shr_u
    (;297:2;)              i32.or
    (;298:0;)              i32.store
    (;299:1;)              local.get 2
    (;300:2;)              i32.const 16
    (;301:1;)              i32.add
    (;302:0;)              local.set 2
    (;303:1;)              local.get 6
    (;304:2;)              i32.const -16
    (;305:1;)              i32.add
    (;306:1;)              local.tee 6
    (;307:2;)              i32.const 16
    (;308:1;)              i32.gt_u
    (;309:0;)              br_if 0
    (;310:0;)            end
    (;311:1;)            local.get 7
    (;312:2;)            local.get 2
    (;313:1;)            i32.add
    (;314:0;)            local.set 3
    (;315:1;)            local.get 1
    (;316:2;)            local.get 2
    (;317:1;)            i32.add
    (;318:2;)            i32.const 3
    (;319:1;)            i32.add
    (;320:0;)            local.set 1
    (;321:1;)            local.get 4
    (;322:2;)            local.get 8
    (;323:1;)            i32.sub
    (;324:2;)            i32.const -19
    (;325:1;)            i32.add
    (;326:0;)            local.set 4
    (;327:0;)            br 2
    (;328:0;)          end
    (;329:1;)          local.get 3
    (;330:2;)          local.get 1
    (;331:2;)          i32.load
    (;332:2;)          local.tee 5
    (;333:0;)          i32.store8
    (;334:1;)          local.get 3
    (;335:2;)          local.get 1
    (;336:2;)          i32.load8_u offset=1
    (;337:0;)          i32.store8 offset=1
    (;338:1;)          local.get 4
    (;339:2;)          i32.const -2
    (;340:1;)          i32.add
    (;341:0;)          local.set 6
    (;342:1;)          local.get 3
    (;343:2;)          i32.const 2
    (;344:1;)          i32.add
    (;345:0;)          local.set 7
    (;346:1;)          local.get 4
    (;347:2;)          i32.const -20
    (;348:1;)          i32.add
    (;349:2;)          i32.const -16
    (;350:1;)          i32.and
    (;351:0;)          local.set 8
    (;352:1;)          i32.const 0
    (;353:0;)          local.set 2
    (;354:0;)          loop
    (;355:1;)            local.get 7
    (;356:2;)            local.get 2
    (;357:1;)            i32.add
    (;358:1;)            local.tee 3
    (;359:2;)            local.get 1
    (;360:3;)            local.get 2
    (;361:2;)            i32.add
    (;362:2;)            local.tee 9
    (;363:3;)            i32.const 4
    (;364:2;)            i32.add
    (;365:2;)            i32.load
    (;366:2;)            local.tee 10
    (;367:3;)            i32.const 16
    (;368:2;)            i32.shl
    (;369:3;)            local.get 5
    (;370:4;)            i32.const 16
    (;371:3;)            i32.shr_u
    (;372:2;)            i32.or
    (;373:0;)            i32.store
    (;374:1;)            local.get 3
    (;375:2;)            i32.const 4
    (;376:1;)            i32.add
    (;377:2;)            local.get 9
    (;378:3;)            i32.const 8
    (;379:2;)            i32.add
    (;380:2;)            i32.load
    (;381:2;)            local.tee 5
    (;382:3;)            i32.const 16
    (;383:2;)            i32.shl
    (;384:3;)            local.get 10
    (;385:4;)            i32.const 16
    (;386:3;)            i32.shr_u
    (;387:2;)            i32.or
    (;388:0;)            i32.store
    (;389:1;)            local.get 3
    (;390:2;)            i32.const 8
    (;391:1;)            i32.add
    (;392:2;)            local.get 9
    (;393:3;)            i32.const 12
    (;394:2;)            i32.add
    (;395:2;)            i32.load
    (;396:2;)            local.tee 10
    (;397:3;)            i32.const 16
    (;398:2;)            i32.shl
    (;399:3;)            local.get 5
    (;400:4;)            i32.const 16
    (;401:3;)            i32.shr_u
    (;402:2;)            i32.or
    (;403:0;)            i32.store
    (;404:1;)            local.get 3
    (;405:2;)            i32.const 12
    (;406:1;)            i32.add
    (;407:2;)            local.get 9
    (;408:3;)            i32.const 16
    (;409:2;)            i32.add
    (;410:2;)            i32.load
    (;411:2;)            local.tee 5
    (;412:3;)            i32.const 16
    (;413:2;)            i32.shl
    (;414:3;)            local.get 10
    (;415:4;)            i32.const 16
    (;416:3;)            i32.shr_u
    (;417:2;)            i32.or
    (;418:0;)            i32.store
    (;419:1;)            local.get 2
    (;420:2;)            i32.const 16
    (;421:1;)            i32.add
    (;422:0;)            local.set 2
    (;423:1;)            local.get 6
    (;424:2;)            i32.const -16
    (;425:1;)            i32.add
    (;426:1;)            local.tee 6
    (;427:2;)            i32.const 17
    (;428:1;)            i32.gt_u
    (;429:0;)            br_if 0
    (;430:0;)          end
    (;431:1;)          local.get 7
    (;432:2;)          local.get 2
    (;433:1;)          i32.add
    (;434:0;)          local.set 3
    (;435:1;)          local.get 1
    (;436:2;)          local.get 2
    (;437:1;)          i32.add
    (;438:2;)          i32.const 2
    (;439:1;)          i32.add
    (;440:0;)          local.set 1
    (;441:1;)          local.get 4
    (;442:2;)          local.get 8
    (;443:1;)          i32.sub
    (;444:2;)          i32.const -18
    (;445:1;)          i32.add
    (;446:0;)          local.set 4
    (;447:0;)          br 1
    (;448:0;)        end
    (;449:1;)        local.get 3
    (;450:2;)        local.get 1
    (;451:2;)        i32.load
    (;452:2;)        local.tee 5
    (;453:0;)        i32.store8
    (;454:1;)        local.get 4
    (;455:2;)        i32.const -1
    (;456:1;)        i32.add
    (;457:0;)        local.set 6
    (;458:1;)        local.get 3
    (;459:2;)        i32.const 1
    (;460:1;)        i32.add
    (;461:0;)        local.set 7
    (;462:1;)        local.get 4
    (;463:2;)        i32.const -20
    (;464:1;)        i32.add
    (;465:2;)        i32.const -16
    (;466:1;)        i32.and
    (;467:0;)        local.set 8
    (;468:1;)        i32.const 0
    (;469:0;)        local.set 2
    (;470:0;)        loop
    (;471:1;)          local.get 7
    (;472:2;)          local.get 2
    (;473:1;)          i32.add
    (;474:1;)          local.tee 3
    (;475:2;)          local.get 1
    (;476:3;)          local.get 2
    (;477:2;)          i32.add
    (;478:2;)          local.tee 9
    (;479:3;)          i32.const 4
    (;480:2;)          i32.add
    (;481:2;)          i32.load
    (;482:2;)          local.tee 10
    (;483:3;)          i32.const 24
    (;484:2;)          i32.shl
    (;485:3;)          local.get 5
    (;486:4;)          i32.const 8
    (;487:3;)          i32.shr_u
    (;488:2;)          i32.or
    (;489:0;)          i32.store
    (;490:1;)          local.get 3
    (;491:2;)          i32.const 4
    (;492:1;)          i32.add
    (;493:2;)          local.get 9
    (;494:3;)          i32.const 8
    (;495:2;)          i32.add
    (;496:2;)          i32.load
    (;497:2;)          local.tee 5
    (;498:3;)          i32.const 24
    (;499:2;)          i32.shl
    (;500:3;)          local.get 10
    (;501:4;)          i32.const 8
    (;502:3;)          i32.shr_u
    (;503:2;)          i32.or
    (;504:0;)          i32.store
    (;505:1;)          local.get 3
    (;506:2;)          i32.const 8
    (;507:1;)          i32.add
    (;508:2;)          local.get 9
    (;509:3;)          i32.const 12
    (;510:2;)          i32.add
    (;511:2;)          i32.load
    (;512:2;)          local.tee 10
    (;513:3;)          i32.const 24
    (;514:2;)          i32.shl
    (;515:3;)          local.get 5
    (;516:4;)          i32.const 8
    (;517:3;)          i32.shr_u
    (;518:2;)          i32.or
    (;519:0;)          i32.store
    (;520:1;)          local.get 3
    (;521:2;)          i32.const 12
    (;522:1;)          i32.add
    (;523:2;)          local.get 9
    (;524:3;)          i32.const 16
    (;525:2;)          i32.add
    (;526:2;)          i32.load
    (;527:2;)          local.tee 5
    (;528:3;)          i32.const 24
    (;529:2;)          i32.shl
    (;530:3;)          local.get 10
    (;531:4;)          i32.const 8
    (;532:3;)          i32.shr_u
    (;533:2;)          i32.or
    (;534:0;)          i32.store
    (;535:1;)          local.get 2
    (;536:2;)          i32.const 16
    (;537:1;)          i32.add
    (;538:0;)          local.set 2
    (;539:1;)          local.get 6
    (;540:2;)          i32.const -16
    (;541:1;)          i32.add
    (;542:1;)          local.tee 6
    (;543:2;)          i32.const 18
    (;544:1;)          i32.gt_u
    (;545:0;)          br_if 0
    (;546:0;)        end
    (;547:1;)        local.get 7
    (;548:2;)        local.get 2
    (;549:1;)        i32.add
    (;550:0;)        local.set 3
    (;551:1;)        local.get 1
    (;552:2;)        local.get 2
    (;553:1;)        i32.add
    (;554:2;)        i32.const 1
    (;555:1;)        i32.add
    (;556:0;)        local.set 1
    (;557:1;)        local.get 4
    (;558:2;)        local.get 8
    (;559:1;)        i32.sub
    (;560:2;)        i32.const -17
    (;561:1;)        i32.add
    (;562:0;)        local.set 4
    (;563:0;)      end
    (;564:0;)      block
    (;565:1;)        local.get 4
    (;566:2;)        i32.const 16
    (;567:1;)        i32.and
    (;568:1;)        i32.eqz
    (;569:0;)        br_if 0
    (;570:1;)        local.get 3
    (;571:2;)        local.get 1
    (;572:2;)        i32.load16_u align=0
    (;573:0;)        i32.store16 align=0
    (;574:1;)        local.get 3
    (;575:2;)        local.get 1
    (;576:2;)        i32.load8_u offset=2
    (;577:0;)        i32.store8 offset=2
    (;578:1;)        local.get 3
    (;579:2;)        local.get 1
    (;580:2;)        i32.load8_u offset=3
    (;581:0;)        i32.store8 offset=3
    (;582:1;)        local.get 3
    (;583:2;)        local.get 1
    (;584:2;)        i32.load8_u offset=4
    (;585:0;)        i32.store8 offset=4
    (;586:1;)        local.get 3
    (;587:2;)        local.get 1
    (;588:2;)        i32.load8_u offset=5
    (;589:0;)        i32.store8 offset=5
    (;590:1;)        local.get 3
    (;591:2;)        local.get 1
    (;592:2;)        i32.load8_u offset=6
    (;593:0;)        i32.store8 offset=6
    (;594:1;)        local.get 3
    (;595:2;)        local.get 1
    (;596:2;)        i32.load8_u offset=7
    (;597:0;)        i32.store8 offset=7
    (;598:1;)        local.get 3
    (;599:2;)        local.get 1
    (;600:2;)        i32.load8_u offset=8
    (;601:0;)        i32.store8 offset=8
    (;602:1;)        local.get 3
    (;603:2;)        local.get 1
    (;604:2;)        i32.load8_u offset=9
    (;605:0;)        i32.store8 offset=9
    (;606:1;)        local.get 3
    (;607:2;)        local.get 1
    (;608:2;)        i32.load8_u offset=10
    (;609:0;)        i32.store8 offset=10
    (;610:1;)        local.get 3
    (;611:2;)        local.get 1
    (;612:2;)        i32.load8_u offset=11
    (;613:0;)        i32.store8 offset=11
    (;614:1;)        local.get 3
    (;615:2;)        local.get 1
    (;616:2;)        i32.load8_u offset=12
    (;617:0;)        i32.store8 offset=12
    (;618:1;)        local.get 3
    (;619:2;)        local.get 1
    (;620:2;)        i32.load8_u offset=13
    (;621:0;)        i32.store8 offset=13
    (;622:1;)        local.get 3
    (;623:2;)        local.get 1
    (;624:2;)        i32.load8_u offset=14
    (;625:0;)        i32.store8 offset=14
    (;626:1;)        local.get 3
    (;627:2;)        local.get 1
    (;628:2;)        i32.load8_u offset=15
    (;629:0;)        i32.store8 offset=15
    (;630:1;)        local.get 3
    (;631:2;)        i32.const 16
    (;632:1;)        i32.add
    (;633:0;)        local.set 3
    (;634:1;)        local.get 1
    (;635:2;)        i32.const 16
    (;636:1;)        i32.add
    (;637:0;)        local.set 1
    (;638:0;)      end
    (;639:0;)      block
    (;640:1;)        local.get 4
    (;641:2;)        i32.const 8
    (;642:1;)        i32.and
    (;643:1;)        i32.eqz
    (;644:0;)        br_if 0
    (;645:1;)        local.get 3
    (;646:2;)        local.get 1
    (;647:2;)        i32.load8_u
    (;648:0;)        i32.store8
    (;649:1;)        local.get 3
    (;650:2;)        local.get 1
    (;651:2;)        i32.load8_u offset=1
    (;652:0;)        i32.store8 offset=1
    (;653:1;)        local.get 3
    (;654:2;)        local.get 1
    (;655:2;)        i32.load8_u offset=2
    (;656:0;)        i32.store8 offset=2
    (;657:1;)        local.get 3
    (;658:2;)        local.get 1
    (;659:2;)        i32.load8_u offset=3
    (;660:0;)        i32.store8 offset=3
    (;661:1;)        local.get 3
    (;662:2;)        local.get 1
    (;663:2;)        i32.load8_u offset=4
    (;664:0;)        i32.store8 offset=4
    (;665:1;)        local.get 3
    (;666:2;)        local.get 1
    (;667:2;)        i32.load8_u offset=5
    (;668:0;)        i32.store8 offset=5
    (;669:1;)        local.get 3
    (;670:2;)        local.get 1
    (;671:2;)        i32.load8_u offset=6
    (;672:0;)        i32.store8 offset=6
    (;673:1;)        local.get 3
    (;674:2;)        local.get 1
    (;675:2;)        i32.load8_u offset=7
    (;676:0;)        i32.store8 offset=7
    (;677:1;)        local.get 3
    (;678:2;)        i32.const 8
    (;679:1;)        i32.add
    (;680:0;)        local.set 3
    (;681:1;)        local.get 1
    (;682:2;)        i32.const 8
    (;683:1;)        i32.add
    (;684:0;)        local.set 1
    (;685:0;)      end
    (;686:0;)      block
    (;687:1;)        local.get 4
    (;688:2;)        i32.const 4
    (;689:1;)        i32.and
    (;690:1;)        i32.eqz
    (;691:0;)        br_if 0
    (;692:1;)        local.get 3
    (;693:2;)        local.get 1
    (;694:2;)        i32.load8_u
    (;695:0;)        i32.store8
    (;696:1;)        local.get 3
    (;697:2;)        local.get 1
    (;698:2;)        i32.load8_u offset=1
    (;699:0;)        i32.store8 offset=1
    (;700:1;)        local.get 3
    (;701:2;)        local.get 1
    (;702:2;)        i32.load8_u offset=2
    (;703:0;)        i32.store8 offset=2
    (;704:1;)        local.get 3
    (;705:2;)        local.get 1
    (;706:2;)        i32.load8_u offset=3
    (;707:0;)        i32.store8 offset=3
    (;708:1;)        local.get 3
    (;709:2;)        i32.const 4
    (;710:1;)        i32.add
    (;711:0;)        local.set 3
    (;712:1;)        local.get 1
    (;713:2;)        i32.const 4
    (;714:1;)        i32.add
    (;715:0;)        local.set 1
    (;716:0;)      end
    (;717:0;)      block
    (;718:1;)        local.get 4
    (;719:2;)        i32.const 2
    (;720:1;)        i32.and
    (;721:1;)        i32.eqz
    (;722:0;)        br_if 0
    (;723:1;)        local.get 3
    (;724:2;)        local.get 1
    (;725:2;)        i32.load8_u
    (;726:0;)        i32.store8
    (;727:1;)        local.get 3
    (;728:2;)        local.get 1
    (;729:2;)        i32.load8_u offset=1
    (;730:0;)        i32.store8 offset=1
    (;731:1;)        local.get 3
    (;732:2;)        i32.const 2
    (;733:1;)        i32.add
    (;734:0;)        local.set 3
    (;735:1;)        local.get 1
    (;736:2;)        i32.const 2
    (;737:1;)        i32.add
    (;738:0;)        local.set 1
    (;739:0;)      end
    (;740:1;)      local.get 4
    (;741:2;)      i32.const 1
    (;742:1;)      i32.and
    (;743:1;)      i32.eqz
    (;744:0;)      br_if 0
    (;745:1;)      local.get 3
    (;746:2;)      local.get 1
    (;747:2;)      i32.load8_u
    (;748:0;)      i32.store8
    (;749:0;)    end
    (;750:1;)    local.get 0
    (;751:0;)  end
  )

  (func "memset" (;9;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i64)
    (;0:0;)      block
    (;1:1;)        local.get 2
    (;2:1;)        i32.eqz
    (;3:0;)        br_if 0
    (;4:1;)        local.get 0
    (;5:2;)        local.get 1
    (;6:0;)        i32.store8
    (;7:1;)        local.get 2
    (;8:2;)        local.get 0
    (;9:1;)        i32.add
    (;10:1;)       local.tee 3
    (;11:2;)       i32.const -1
    (;12:1;)       i32.add
    (;13:2;)       local.get 1
    (;14:0;)       i32.store8
    (;15:1;)       local.get 2
    (;16:2;)       i32.const 3
    (;17:1;)       i32.lt_u
    (;18:0;)       br_if 0
    (;19:1;)       local.get 0
    (;20:2;)       local.get 1
    (;21:0;)       i32.store8 offset=2
    (;22:1;)       local.get 0
    (;23:2;)       local.get 1
    (;24:0;)       i32.store8 offset=1
    (;25:1;)       local.get 3
    (;26:2;)       i32.const -3
    (;27:1;)       i32.add
    (;28:2;)       local.get 1
    (;29:0;)       i32.store8
    (;30:1;)       local.get 3
    (;31:2;)       i32.const -2
    (;32:1;)       i32.add
    (;33:2;)       local.get 1
    (;34:0;)       i32.store8
    (;35:1;)       local.get 2
    (;36:2;)       i32.const 7
    (;37:1;)       i32.lt_u
    (;38:0;)       br_if 0
    (;39:1;)       local.get 0
    (;40:2;)       local.get 1
    (;41:0;)       i32.store8 offset=3
    (;42:1;)       local.get 3
    (;43:2;)       i32.const -4
    (;44:1;)       i32.add
    (;45:2;)       local.get 1
    (;46:0;)       i32.store8
    (;47:1;)       local.get 2
    (;48:2;)       i32.const 9
    (;49:1;)       i32.lt_u
    (;50:0;)       br_if 0
    (;51:1;)       local.get 0
    (;52:2;)       i32.const 0
    (;53:3;)       local.get 0
    (;54:2;)       i32.sub
    (;55:3;)       i32.const 3
    (;56:2;)       i32.and
    (;57:2;)       local.tee 4
    (;58:1;)       i32.add
    (;59:1;)       local.tee 3
    (;60:2;)       local.get 1
    (;61:3;)       i32.const 255
    (;62:2;)       i32.and
    (;63:3;)       i32.const 16843009
    (;64:2;)       i32.mul
    (;65:2;)       local.tee 1
    (;66:0;)       i32.store
    (;67:1;)       local.get 3
    (;68:2;)       local.get 2
    (;69:3;)       local.get 4
    (;70:2;)       i32.sub
    (;71:3;)       i32.const -4
    (;72:2;)       i32.and
    (;73:2;)       local.tee 4
    (;74:1;)       i32.add
    (;75:1;)       local.tee 2
    (;76:2;)       i32.const -4
    (;77:1;)       i32.add
    (;78:2;)       local.get 1
    (;79:0;)       i32.store
    (;80:1;)       local.get 4
    (;81:2;)       i32.const 9
    (;82:1;)       i32.lt_u
    (;83:0;)       br_if 0
    (;84:1;)       local.get 3
    (;85:2;)       local.get 1
    (;86:0;)       i32.store offset=8
    (;87:1;)       local.get 3
    (;88:2;)       local.get 1
    (;89:0;)       i32.store offset=4
    (;90:1;)       local.get 2
    (;91:2;)       i32.const -8
    (;92:1;)       i32.add
    (;93:2;)       local.get 1
    (;94:0;)       i32.store
    (;95:1;)       local.get 2
    (;96:2;)       i32.const -12
    (;97:1;)       i32.add
    (;98:2;)       local.get 1
    (;99:0;)       i32.store
    (;100:1;)      local.get 4
    (;101:2;)      i32.const 25
    (;102:1;)      i32.lt_u
    (;103:0;)      br_if 0
    (;104:1;)      local.get 3
    (;105:2;)      local.get 1
    (;106:0;)      i32.store offset=24
    (;107:1;)      local.get 3
    (;108:2;)      local.get 1
    (;109:0;)      i32.store offset=20
    (;110:1;)      local.get 3
    (;111:2;)      local.get 1
    (;112:0;)      i32.store offset=16
    (;113:1;)      local.get 3
    (;114:2;)      local.get 1
    (;115:0;)      i32.store offset=12
    (;116:1;)      local.get 2
    (;117:2;)      i32.const -16
    (;118:1;)      i32.add
    (;119:2;)      local.get 1
    (;120:0;)      i32.store
    (;121:1;)      local.get 2
    (;122:2;)      i32.const -20
    (;123:1;)      i32.add
    (;124:2;)      local.get 1
    (;125:0;)      i32.store
    (;126:1;)      local.get 2
    (;127:2;)      i32.const -24
    (;128:1;)      i32.add
    (;129:2;)      local.get 1
    (;130:0;)      i32.store
    (;131:1;)      local.get 2
    (;132:2;)      i32.const -28
    (;133:1;)      i32.add
    (;134:2;)      local.get 1
    (;135:0;)      i32.store
    (;136:1;)      local.get 4
    (;137:2;)      local.get 3
    (;138:3;)      i32.const 4
    (;139:2;)      i32.and
    (;140:3;)      i32.const 24
    (;141:2;)      i32.or
    (;142:2;)      local.tee 5
    (;143:1;)      i32.sub
    (;144:1;)      local.tee 2
    (;145:2;)      i32.const 32
    (;146:1;)      i32.lt_u
    (;147:0;)      br_if 0
    (;148:1;)      local.get 1
    (;149:1;)      i64.extend_i32_u
    (;150:1;)      local.tee 6
    (;151:2;)      i64.const 32
    (;152:1;)      i64.shl
    (;153:2;)      local.get 6
    (;154:1;)      i64.or
    (;155:0;)      local.set 6
    (;156:1;)      local.get 3
    (;157:2;)      local.get 5
    (;158:1;)      i32.add
    (;159:0;)      local.set 1
    (;160:0;)      loop
    (;161:1;)        local.get 1
    (;162:2;)        local.get 6
    (;163:0;)        i64.store
    (;164:1;)        local.get 1
    (;165:2;)        i32.const 24
    (;166:1;)        i32.add
    (;167:2;)        local.get 6
    (;168:0;)        i64.store
    (;169:1;)        local.get 1
    (;170:2;)        i32.const 16
    (;171:1;)        i32.add
    (;172:2;)        local.get 6
    (;173:0;)        i64.store
    (;174:1;)        local.get 1
    (;175:2;)        i32.const 8
    (;176:1;)        i32.add
    (;177:2;)        local.get 6
    (;178:0;)        i64.store
    (;179:1;)        local.get 1
    (;180:2;)        i32.const 32
    (;181:1;)        i32.add
    (;182:0;)        local.set 1
    (;183:1;)        local.get 2
    (;184:2;)        i32.const -32
    (;185:1;)        i32.add
    (;186:1;)        local.tee 2
    (;187:2;)        i32.const 31
    (;188:1;)        i32.gt_u
    (;189:0;)        br_if 0
    (;190:0;)      end
    (;191:0;)    end
    (;192:1;)    local.get 0
    (;193:0;)  end
  )

  (func "memmove" (;10;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (;0:0;)      block
    (;1:1;)        local.get 0
    (;2:2;)        local.get 1
    (;3:1;)        i32.eq
    (;4:0;)        br_if 0
    (;5:0;)        block
    (;6:1;)          local.get 1
    (;7:2;)          local.get 0
    (;8:1;)          i32.sub
    (;9:2;)          local.get 2
    (;10:1;)         i32.sub
    (;11:2;)         i32.const 0
    (;12:3;)         local.get 2
    (;13:4;)         i32.const 1
    (;14:3;)         i32.shl
    (;15:2;)         i32.sub
    (;16:1;)         i32.gt_u
    (;17:0;)         br_if 0
    (;18:1;)         local.get 0
    (;19:2;)         local.get 1
    (;20:3;)         local.get 2
    (;21:1;)         call 8  memcpy
    (;22:0;)         drop
    (;23:0;)         br 1
    (;24:0;)       end
    (;25:1;)       local.get 1
    (;26:2;)       local.get 0
    (;27:1;)       i32.xor
    (;28:2;)       i32.const 3
    (;29:1;)       i32.and
    (;30:0;)       local.set 3
    (;31:0;)       block
    (;32:0;)         block
    (;33:0;)           block
    (;34:1;)             local.get 0
    (;35:2;)             local.get 1
    (;36:1;)             i32.ge_u
    (;37:0;)             br_if 0
    (;38:0;)             block
    (;39:1;)               local.get 3
    (;40:1;)               i32.eqz
    (;41:0;)               br_if 0
    (;42:1;)               local.get 0
    (;43:0;)               local.set 3
    (;44:0;)               br 3
    (;45:0;)             end
    (;46:0;)             block
    (;47:1;)               local.get 0
    (;48:2;)               i32.const 3
    (;49:1;)               i32.and
    (;50:0;)               br_if 0
    (;51:1;)               local.get 0
    (;52:0;)               local.set 3
    (;53:0;)               br 2
    (;54:0;)             end
    (;55:1;)             local.get 0
    (;56:0;)             local.set 3
    (;57:0;)             loop
    (;58:1;)               local.get 2
    (;59:1;)               i32.eqz
    (;60:0;)               br_if 4
    (;61:1;)               local.get 3
    (;62:2;)               local.get 1
    (;63:2;)               i32.load8_u
    (;64:0;)               i32.store8
    (;65:1;)               local.get 1
    (;66:2;)               i32.const 1
    (;67:1;)               i32.add
    (;68:0;)               local.set 1
    (;69:1;)               local.get 2
    (;70:2;)               i32.const -1
    (;71:1;)               i32.add
    (;72:0;)               local.set 2
    (;73:1;)               local.get 3
    (;74:2;)               i32.const 1
    (;75:1;)               i32.add
    (;76:1;)               local.tee 3
    (;77:2;)               i32.const 3
    (;78:1;)               i32.and
    (;79:1;)               i32.eqz
    (;80:0;)               br_if 2
    (;81:0;)               br 0
    (;82:0;)             end
    (;83:0;)           end
    (;84:0;)           block
    (;85:0;)             block
    (;86:1;)               local.get 3
    (;87:1;)               i32.eqz
    (;88:0;)               br_if 0
    (;89:1;)               local.get 2
    (;90:0;)               local.set 3
    (;91:0;)               br 1
    (;92:0;)             end
    (;93:0;)             block
    (;94:0;)               block
    (;95:1;)                 local.get 0
    (;96:2;)                 local.get 2
    (;97:1;)                 i32.add
    (;98:2;)                 i32.const 3
    (;99:1;)                 i32.and
    (;100:0;)                br_if 0
    (;101:1;)                local.get 2
    (;102:0;)                local.set 3
    (;103:0;)                br 1
    (;104:0;)              end
    (;105:1;)              local.get 1
    (;106:2;)              i32.const -1
    (;107:1;)              i32.add
    (;108:0;)              local.set 4
    (;109:1;)              local.get 0
    (;110:2;)              i32.const -1
    (;111:1;)              i32.add
    (;112:0;)              local.set 5
    (;113:0;)              loop
    (;114:1;)                local.get 2
    (;115:1;)                i32.eqz
    (;116:0;)                br_if 5
    (;117:1;)                local.get 5
    (;118:2;)                local.get 2
    (;119:1;)                i32.add
    (;120:1;)                local.tee 6
    (;121:2;)                local.get 4
    (;122:3;)                local.get 2
    (;123:2;)                i32.add
    (;124:2;)                i32.load8_u
    (;125:0;)                i32.store8
    (;126:1;)                local.get 2
    (;127:2;)                i32.const -1
    (;128:1;)                i32.add
    (;129:1;)                local.tee 3
    (;130:0;)                local.set 2
    (;131:1;)                local.get 6
    (;132:2;)                i32.const 3
    (;133:1;)                i32.and
    (;134:0;)                br_if 0
    (;135:0;)              end
    (;136:0;)            end
    (;137:1;)            local.get 3
    (;138:2;)            i32.const 4
    (;139:1;)            i32.lt_u
    (;140:0;)            br_if 0
    (;141:1;)            local.get 0
    (;142:2;)            i32.const -4
    (;143:1;)            i32.add
    (;144:0;)            local.set 2
    (;145:1;)            local.get 1
    (;146:2;)            i32.const -4
    (;147:1;)            i32.add
    (;148:0;)            local.set 6
    (;149:0;)            loop
    (;150:1;)              local.get 2
    (;151:2;)              local.get 3
    (;152:1;)              i32.add
    (;153:2;)              local.get 6
    (;154:3;)              local.get 3
    (;155:2;)              i32.add
    (;156:2;)              i32.load
    (;157:0;)              i32.store
    (;158:1;)              local.get 3
    (;159:2;)              i32.const -4
    (;160:1;)              i32.add
    (;161:1;)              local.tee 3
    (;162:2;)              i32.const 3
    (;163:1;)              i32.gt_u
    (;164:0;)              br_if 0
    (;165:0;)            end
    (;166:0;)          end
    (;167:1;)          local.get 3
    (;168:1;)          i32.eqz
    (;169:0;)          br_if 2
    (;170:1;)          local.get 1
    (;171:2;)          i32.const -1
    (;172:1;)          i32.add
    (;173:0;)          local.set 1
    (;174:1;)          local.get 0
    (;175:2;)          i32.const -1
    (;176:1;)          i32.add
    (;177:0;)          local.set 2
    (;178:0;)          loop
    (;179:1;)            local.get 2
    (;180:2;)            local.get 3
    (;181:1;)            i32.add
    (;182:2;)            local.get 1
    (;183:3;)            local.get 3
    (;184:2;)            i32.add
    (;185:2;)            i32.load8_u
    (;186:0;)            i32.store8
    (;187:1;)            local.get 3
    (;188:2;)            i32.const -1
    (;189:1;)            i32.add
    (;190:1;)            local.tee 3
    (;191:0;)            br_if 0
    (;192:0;)            br 3
    (;193:0;)          end
    (;194:0;)        end
    (;195:1;)        local.get 2
    (;196:2;)        i32.const 4
    (;197:1;)        i32.lt_u
    (;198:0;)        br_if 0
    (;199:1;)        local.get 2
    (;200:0;)        local.set 6
    (;201:0;)        loop
    (;202:1;)          local.get 3
    (;203:2;)          local.get 1
    (;204:2;)          i32.load
    (;205:0;)          i32.store
    (;206:1;)          local.get 1
    (;207:2;)          i32.const 4
    (;208:1;)          i32.add
    (;209:0;)          local.set 1
    (;210:1;)          local.get 3
    (;211:2;)          i32.const 4
    (;212:1;)          i32.add
    (;213:0;)          local.set 3
    (;214:1;)          local.get 6
    (;215:2;)          i32.const -4
    (;216:1;)          i32.add
    (;217:1;)          local.tee 6
    (;218:2;)          i32.const 3
    (;219:1;)          i32.gt_u
    (;220:0;)          br_if 0
    (;221:0;)        end
    (;222:1;)        local.get 2
    (;223:2;)        i32.const 3
    (;224:1;)        i32.and
    (;225:0;)        local.set 2
    (;226:0;)      end
    (;227:1;)      local.get 2
    (;228:1;)      i32.eqz
    (;229:0;)      br_if 0
    (;230:0;)      loop
    (;231:1;)        local.get 3
    (;232:2;)        local.get 1
    (;233:2;)        i32.load8_u
    (;234:0;)        i32.store8
    (;235:1;)        local.get 3
    (;236:2;)        i32.const 1
    (;237:1;)        i32.add
    (;238:0;)        local.set 3
    (;239:1;)        local.get 1
    (;240:2;)        i32.const 1
    (;241:1;)        i32.add
    (;242:0;)        local.set 1
    (;243:1;)        local.get 2
    (;244:2;)        i32.const -1
    (;245:1;)        i32.add
    (;246:1;)        local.tee 2
    (;247:0;)        br_if 0
    (;248:0;)      end
    (;249:0;)    end
    (;250:1;)    local.get 0
    (;251:0;)  end
  )

  (func "github.com/iotaledger/wart/wasplib.GetInt" (;11;) (type 7) (param (;0;) i32 (;1;) i32) (result i64)
    (local (;2;) i32)
    (local (;3;) i64)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 0
    (;9:2;)      local.get 1
    (;10:3;)     local.get 2
    (;11:4;)     i32.const 8
    (;12:3;)     i32.add
    (;13:0;)     call 0  waspGo::hostGetInt
    (;14:1;)     local.get 2
    (;15:1;)     i64.load offset=8
    (;16:0;)     local.set 3
    (;17:1;)     local.get 2
    (;18:2;)     i32.const 16
    (;19:1;)     i32.add
    (;20:0;)     global.set 0
    (;21:1;)     local.get 3
    (;22:0;)   end
  )

  (func "github.com/iotaledger/wart/wasplib.GetString" (;12;) (type 1) (param (;0;) i32 (;1;) i32 (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 64
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=60
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=52 align=2
    (;11:1;)     local.get 3
    (;12:2;)     i32.const 4
    (;13:0;)     i32.store offset=44
    (;14:1;)     local.get 3
    (;15:2;)     i32.const 65536
    (;16:0;)     i32.store offset=32
    (;17:1;)     local.get 3
    (;18:2;)     i32.const 5
    (;19:0;)     i32.store offset=36
    (;20:1;)     i32.const 0
    (;21:1;)     i32.load offset=70816
    (;22:0;)     local.set 4
    (;23:1;)     i32.const 0
    (;24:2;)     local.get 3
    (;25:3;)     i32.const 40
    (;26:2;)     i32.add
    (;27:0;)     i32.store offset=70816
    (;28:1;)     local.get 3
    (;29:2;)     local.get 4
    (;30:0;)     i32.store offset=40
    (;31:1;)     local.get 3
    (;32:2;)     local.get 3
    (;33:3;)     i32.const 32
    (;34:2;)     i32.add
    (;35:0;)     i32.store offset=48
    (;36:1;)     local.get 1
    (;37:2;)     local.get 2
    (;38:3;)     local.get 3
    (;39:4;)     i32.const 32
    (;40:3;)     i32.add
    (;41:0;)     call 1  waspGo::hostGetString
    (;42:1;)     local.get 3
    (;43:2;)     local.get 3
    (;44:2;)     i32.load offset=32
    (;45:2;)     local.tee 1
    (;46:0;)     i32.store offset=52
    (;47:1;)     local.get 3
    (;48:2;)     i32.const 16
    (;49:1;)     i32.add
    (;50:2;)     i32.const 0
    (;51:3;)     local.get 1
    (;52:4;)     i32.const 0
    (;53:5;)     i32.const 0
    (;54:6;)     local.get 3
    (;55:6;)     i32.load offset=36
    (;56:7;)     i32.const 1
    (;57:0;)     call 13  runtime.sliceAppend
    (;58:1;)     local.get 3
    (;59:2;)     local.get 3
    (;60:2;)     i32.load offset=16
    (;61:2;)     local.tee 1
    (;62:0;)     i32.store offset=56
    (;63:1;)     local.get 3
    (;64:2;)     i32.const 8
    (;65:1;)     i32.add
    (;66:2;)     local.get 1
    (;67:3;)     local.get 3
    (;68:3;)     i32.load offset=20
    (;69:4;)     local.get 3
    (;70:4;)     i32.load offset=24
    (;71:0;)     call 14  runtime.stringFromBytes
    (;72:1;)     i32.const 0
    (;73:2;)     local.get 4
    (;74:0;)     i32.store offset=70816
    (;75:1;)     local.get 3
    (;76:2;)     local.get 3
    (;77:2;)     i32.load offset=8
    (;78:2;)     local.tee 4
    (;79:0;)     i32.store offset=60
    (;80:1;)     local.get 0
    (;81:2;)     local.get 3
    (;82:2;)     i32.load offset=12
    (;83:0;)     i32.store offset=4
    (;84:1;)     local.get 0
    (;85:2;)     local.get 4
    (;86:0;)     i32.store
    (;87:1;)     local.get 3
    (;88:2;)     i32.const 64
    (;89:1;)     i32.add
    (;90:0;)     global.set 0
    (;91:0;)   end
  )

  (func "runtime.sliceAppend" (;13;) (type 8) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32 (;4;) i32 (;5;) i32 (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i32)
    (local (;10;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 7
    (;4:0;)      global.set 0
    (;5:1;)      local.get 7
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=12
    (;8:1;)      local.get 7
    (;9:2;)      i64.const 2
    (;10:0;)     i64.store offset=4 align=2
    (;11:1;)     i32.const 0
    (;12:1;)     i32.load offset=70816
    (;13:0;)     local.set 8
    (;14:1;)     i32.const 0
    (;15:2;)     local.get 7
    (;16:0;)     i32.store offset=70816
    (;17:1;)     local.get 7
    (;18:2;)     local.get 8
    (;19:0;)     i32.store
    (;20:0;)     block
    (;21:1;)       local.get 5
    (;22:1;)       i32.eqz
    (;23:0;)       br_if 0
    (;24:0;)       block
    (;25:0;)         block
    (;26:1;)           local.get 5
    (;27:2;)           local.get 3
    (;28:1;)           i32.add
    (;29:1;)           local.tee 9
    (;30:2;)           local.get 4
    (;31:1;)           i32.gt_u
    (;32:0;)           br_if 0
    (;33:1;)           local.get 1
    (;34:0;)           local.set 10
    (;35:0;)           br 1
    (;36:0;)         end
    (;37:1;)         local.get 4
    (;38:2;)         i32.const 1
    (;39:1;)         i32.shl
    (;40:1;)         local.tee 4
    (;41:2;)         i32.const 1
    (;42:3;)         local.get 4
    (;43:1;)         select
    (;44:0;)         local.set 10
    (;45:0;)         loop
    (;46:1;)           local.get 10
    (;47:1;)           local.tee 4
    (;48:2;)           i32.const 1
    (;49:1;)           i32.shl
    (;50:0;)           local.set 10
    (;51:1;)           local.get 9
    (;52:2;)           local.get 4
    (;53:1;)           i32.gt_u
    (;54:0;)           br_if 0
    (;55:0;)         end
    (;56:1;)         local.get 7
    (;57:2;)         i32.const 8
    (;58:1;)         i32.add
    (;59:2;)         local.get 4
    (;60:3;)         local.get 6
    (;61:2;)         i32.mul
    (;62:2;)         call 59  runtime.alloc
    (;63:2;)         local.tee 10
    (;64:0;)         i32.store
    (;65:1;)         local.get 3
    (;66:1;)         i32.eqz
    (;67:0;)         br_if 0
    (;68:1;)         local.get 10
    (;69:2;)         local.get 1
    (;70:3;)         local.get 6
    (;71:4;)         local.get 3
    (;72:3;)         i32.mul
    (;73:1;)         call 8  memcpy
    (;74:0;)         drop
    (;75:0;)       end
    (;76:1;)       local.get 7
    (;77:2;)       i32.const 12
    (;78:1;)       i32.add
    (;79:2;)       local.get 10
    (;80:0;)       i32.store
    (;81:1;)       local.get 10
    (;82:2;)       local.get 6
    (;83:3;)       local.get 3
    (;84:2;)       i32.mul
    (;85:1;)       i32.add
    (;86:2;)       local.get 2
    (;87:3;)       local.get 6
    (;88:4;)       local.get 5
    (;89:3;)       i32.mul
    (;90:1;)       call 10  memmove
    (;91:0;)       drop
    (;92:1;)       i32.const 0
    (;93:2;)       local.get 8
    (;94:0;)       i32.store offset=70816
    (;95:1;)       local.get 0
    (;96:2;)       local.get 4
    (;97:0;)       i32.store offset=8
    (;98:1;)       local.get 0
    (;99:2;)       local.get 9
    (;100:0;)      i32.store offset=4
    (;101:1;)      local.get 0
    (;102:2;)      local.get 10
    (;103:0;)      i32.store
    (;104:1;)      local.get 7
    (;105:2;)      i32.const 16
    (;106:1;)      i32.add
    (;107:0;)      global.set 0
    (;108:0;)      return
    (;109:0;)    end
    (;110:1;)    i32.const 0
    (;111:2;)    local.get 8
    (;112:0;)    i32.store offset=70816
    (;113:1;)    local.get 0
    (;114:2;)    local.get 4
    (;115:0;)    i32.store offset=8
    (;116:1;)    local.get 0
    (;117:2;)    local.get 3
    (;118:0;)    i32.store offset=4
    (;119:1;)    local.get 0
    (;120:2;)    local.get 1
    (;121:0;)    i32.store
    (;122:1;)    local.get 7
    (;123:2;)    i32.const 16
    (;124:1;)    i32.add
    (;125:0;)    global.set 0
    (;126:0;)  end
  )

  (func "runtime.stringFromBytes" (;14;) (type 3) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 64
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 4
    (;4:0;)      global.set 0
    (;5:1;)      local.get 4
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=52 align=2
    (;8:1;)      local.get 4
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=44 align=2
    (;11:1;)     local.get 4
    (;12:2;)     i32.const 5
    (;13:0;)     i32.store offset=36
    (;14:1;)     local.get 4
    (;15:2;)     i32.const 0
    (;16:0;)     i32.store offset=16
    (;17:1;)     local.get 4
    (;18:2;)     i64.const 0
    (;19:0;)     i64.store offset=8
    (;20:1;)     i32.const 0
    (;21:1;)     i32.load offset=70816
    (;22:0;)     local.set 5
    (;23:1;)     i32.const 0
    (;24:2;)     local.get 4
    (;25:3;)     i32.const 32
    (;26:2;)     i32.add
    (;27:0;)     i32.store offset=70816
    (;28:1;)     local.get 4
    (;29:2;)     local.get 5
    (;30:0;)     i32.store offset=32
    (;31:1;)     local.get 4
    (;32:2;)     local.get 4
    (;33:3;)     i32.const 8
    (;34:2;)     i32.add
    (;35:0;)     i32.store offset=40
    (;36:1;)     local.get 4
    (;37:2;)     local.get 2
    (;38:2;)     call 59  runtime.alloc
    (;39:2;)     local.tee 6
    (;40:0;)     i32.store offset=52
    (;41:1;)     local.get 4
    (;42:2;)     local.get 6
    (;43:0;)     i32.store offset=56
    (;44:1;)     local.get 4
    (;45:2;)     local.get 6
    (;46:0;)     i32.store offset=44
    (;47:1;)     local.get 6
    (;48:2;)     local.get 1
    (;49:3;)     local.get 2
    (;50:1;)     call 8  memcpy
    (;51:0;)     local.set 6
    (;52:1;)     i32.const 0
    (;53:2;)     local.get 5
    (;54:0;)     i32.store offset=70816
    (;55:1;)     local.get 4
    (;56:2;)     i64.const 0
    (;57:0;)     i64.store offset=24
    (;58:1;)     local.get 4
    (;59:2;)     local.get 4
    (;60:3;)     i32.const 24
    (;61:2;)     i32.add
    (;62:0;)     i32.store offset=48
    (;63:1;)     local.get 0
    (;64:2;)     local.get 2
    (;65:0;)     i32.store offset=4
    (;66:1;)     local.get 0
    (;67:2;)     local.get 6
    (;68:0;)     i32.store
    (;69:1;)     local.get 4
    (;70:2;)     i32.const 64
    (;71:1;)     i32.add
    (;72:0;)     global.set 0
    (;73:0;)   end
  )

  (func "github.com/iotaledger/wart/wasplib.KeyLength" (;15;) (type 9) (result i32)
    (local (;0;) i32)
    (;0:0;)      block
    (;1:1;)        i32.const 0
    (;2:1;)        i32.load offset=70784
    (;3:1;)        local.tee 0
    (;4:0;)        br_if 0
    (;5:1;)        i32.const 0
    (;6:2;)        i32.const 65541
    (;7:3;)        i32.const 6
    (;8:2;)        call 2  waspGo::hostGetKeyId
    (;9:2;)        local.tee 0
    (;10:0;)       i32.store offset=70784
    (;11:0;)     end
    (;12:1;)     local.get 0
    (;13:0;)   end
  )

  (func "github.com/iotaledger/wart/wasplib.NewScContext" (;16;) (type 9) (result i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:2;)      i32.const 0
    (;4:0;)      i32.store offset=8
    (;5:1;)      i32.const 1
    (;6:0;)    end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScContext).Contract" (;17;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 1
    (;9:2;)      i32.const 0
    (;10:0;)     i32.store
    (;11:1;)     local.get 0
    (;12:2;)     i32.const 65550
    (;13:3;)     i32.const 8
    (;14:1;)     call 18  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetMap
    (;15:1;)     call 19  (github.com/iotaledger/wart/wasplib.ScMutableMap).Immutable
    (;16:0;)     local.set 0
    (;17:1;)     local.get 1
    (;18:2;)     i32.const 16
    (;19:1;)     i32.add
    (;20:0;)     global.set 0
    (;21:1;)     local.get 0
    (;22:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableMap).GetMap" (;18;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store
    (;8:1;)      local.get 0
    (;9:2;)      local.get 1
    (;10:3;)     local.get 2
    (;11:2;)     call 2  waspGo::hostGetKeyId
    (;12:3;)     i32.const 2
    (;13:1;)     call 4  waspGo::hostGetObjectId
    (;14:0;)     local.set 0
    (;15:1;)     local.get 3
    (;16:2;)     i32.const 0
    (;17:0;)     i32.store offset=8
    (;18:1;)     local.get 3
    (;19:2;)     i32.const 16
    (;20:1;)     i32.add
    (;21:0;)     global.set 0
    (;22:1;)     local.get 0
    (;23:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableMap).Immutable" (;19;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:2;)      i32.const 0
    (;5:0;)      i32.store offset=8
    (;6:1;)      local.get 1
    (;7:2;)      i32.const 0
    (;8:0;)      i32.store
    (;9:1;)      local.get 0
    (;10:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScContext).Event" (;20;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 1
    (;9:2;)      i32.const 0
    (;10:0;)     i32.store
    (;11:1;)     local.get 0
    (;12:2;)     i32.const 65558
    (;13:3;)     i32.const 6
    (;14:1;)     call 21  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetMapArray
    (;15:2;)     i32.const 0
    (;16:1;)     call 22  (github.com/iotaledger/wart/wasplib.ScMutableMapArray).GetMap
    (;17:0;)     local.set 0
    (;18:1;)     local.get 1
    (;19:2;)     i32.const 16
    (;20:1;)     i32.add
    (;21:0;)     global.set 0
    (;22:1;)     local.get 0
    (;23:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableMap).GetMapArray" (;21;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store
    (;8:1;)      local.get 0
    (;9:2;)      local.get 1
    (;10:3;)     local.get 2
    (;11:2;)     call 2  waspGo::hostGetKeyId
    (;12:3;)     i32.const 3
    (;13:1;)     call 4  waspGo::hostGetObjectId
    (;14:0;)     local.set 0
    (;15:1;)     local.get 3
    (;16:2;)     i32.const 0
    (;17:0;)     i32.store offset=8
    (;18:1;)     local.get 3
    (;19:2;)     i32.const 16
    (;20:1;)     i32.add
    (;21:0;)     global.set 0
    (;22:1;)     local.get 0
    (;23:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableMapArray).GetMap" (;22;) (type 2) (param (;0;) i32 (;1;) i32) (result i32)
    (local (;2;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store
    (;8:1;)      local.get 0
    (;9:2;)      local.get 1
    (;10:3;)     i32.const 2
    (;11:1;)     call 4  waspGo::hostGetObjectId
    (;12:0;)     local.set 0
    (;13:1;)     local.get 2
    (;14:2;)     i32.const 0
    (;15:0;)     i32.store offset=8
    (;16:1;)     local.get 2
    (;17:2;)     i32.const 16
    (;18:1;)     i32.add
    (;19:0;)     global.set 0
    (;20:1;)     local.get 0
    (;21:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScContext).Log" (;23;) (type 1) (param (;0;) i32 (;1;) i32 (;2;) i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      local.get 0
    (;7:0;)      i32.store offset=8
    (;8:0;)      block
    (;9:1;)        i32.const 0
    (;10:1;)       i32.load offset=70788
    (;11:1;)       local.tee 0
    (;12:0;)       br_if 0
    (;13:1;)       i32.const 0
    (;14:2;)       i32.const 65547
    (;15:3;)       i32.const 3
    (;16:2;)       call 2  waspGo::hostGetKeyId
    (;17:2;)       local.tee 0
    (;18:0;)       i32.store offset=70788
    (;19:0;)     end
    (;20:1;)     i32.const 1
    (;21:2;)     local.get 0
    (;22:3;)     local.get 1
    (;23:4;)     local.get 2
    (;24:0;)     call 3  waspGo::hostSetString
    (;25:1;)     local.get 3
    (;26:2;)     i32.const 16
    (;27:1;)     i32.add
    (;28:0;)     global.set 0
    (;29:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScContext).Request" (;24;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 1
    (;9:2;)      i32.const 0
    (;10:0;)     i32.store
    (;11:1;)     local.get 0
    (;12:2;)     i32.const 65570
    (;13:3;)     i32.const 7
    (;14:1;)     call 18  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetMap
    (;15:1;)     call 19  (github.com/iotaledger/wart/wasplib.ScMutableMap).Immutable
    (;16:0;)     local.set 0
    (;17:1;)     local.get 1
    (;18:2;)     i32.const 16
    (;19:1;)     i32.add
    (;20:0;)     global.set 0
    (;21:1;)     local.get 0
    (;22:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScContext).State" (;25;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 0
    (;9:2;)      i32.const 65577
    (;10:3;)     i32.const 5
    (;11:1;)     call 18  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetMap
    (;12:0;)     local.set 0
    (;13:1;)     local.get 1
    (;14:2;)     i32.const 16
    (;15:1;)     i32.add
    (;16:0;)     global.set 0
    (;17:1;)     local.get 0
    (;18:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScContext).Transfer" (;26;) (type 2) (param (;0;) i32 (;1;) i32) (result i32)
    (local (;2;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 2
    (;9:2;)      i32.const 0
    (;10:0;)     i32.store
    (;11:1;)     local.get 0
    (;12:2;)     i32.const 65582
    (;13:3;)     i32.const 9
    (;14:1;)     call 21  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetMapArray
    (;15:2;)     local.get 1
    (;16:1;)     call 22  (github.com/iotaledger/wart/wasplib.ScMutableMapArray).GetMap
    (;17:0;)     local.set 1
    (;18:1;)     local.get 2
    (;19:2;)     i32.const 16
    (;20:1;)     i32.add
    (;21:0;)     global.set 0
    (;22:1;)     local.get 1
    (;23:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScContract).Address" (;27;) (type 11) (param (;0;) i32 (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 48
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=44
    (;8:1;)      local.get 2
    (;9:2;)      i32.const 2
    (;10:0;)     i32.store offset=36
    (;11:1;)     local.get 2
    (;12:2;)     i32.const 0
    (;13:0;)     i32.store offset=24
    (;14:1;)     i32.const 0
    (;15:1;)     i32.load offset=70816
    (;16:0;)     local.set 3
    (;17:1;)     i32.const 0
    (;18:2;)     local.get 2
    (;19:3;)     i32.const 32
    (;20:2;)     i32.add
    (;21:0;)     i32.store offset=70816
    (;22:1;)     local.get 2
    (;23:2;)     local.get 3
    (;24:0;)     i32.store offset=32
    (;25:1;)     local.get 2
    (;26:2;)     local.get 2
    (;27:3;)     i32.const 24
    (;28:2;)     i32.add
    (;29:0;)     i32.store offset=40
    (;30:1;)     local.get 2
    (;31:2;)     i32.const 16
    (;32:1;)     i32.add
    (;33:2;)     local.get 1
    (;34:3;)     i32.const 65622
    (;35:4;)     i32.const 7
    (;36:0;)     call 28  (github.com/iotaledger/wart/wasplib.ScImmutableMap).GetString
    (;37:1;)     local.get 2
    (;38:2;)     i32.const 8
    (;39:1;)     i32.add
    (;40:2;)     local.get 2
    (;41:2;)     i32.load offset=16
    (;42:3;)     local.get 2
    (;43:3;)     i32.load offset=20
    (;44:0;)     call 29  (github.com/iotaledger/wart/wasplib.ScImmutableString).Value
    (;45:1;)     i32.const 0
    (;46:2;)     local.get 3
    (;47:0;)     i32.store offset=70816
    (;48:1;)     local.get 2
    (;49:2;)     local.get 2
    (;50:2;)     i32.load offset=8
    (;51:2;)     local.tee 3
    (;52:0;)     i32.store offset=44
    (;53:1;)     local.get 0
    (;54:2;)     local.get 2
    (;55:2;)     i32.load offset=12
    (;56:0;)     i32.store offset=4
    (;57:1;)     local.get 0
    (;58:2;)     local.get 3
    (;59:0;)     i32.store
    (;60:1;)     local.get 2
    (;61:2;)     i32.const 48
    (;62:1;)     i32.add
    (;63:0;)     global.set 0
    (;64:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScImmutableMap).GetString" (;28;) (type 3) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32)
    (local (;4;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 4
    (;4:0;)      global.set 0
    (;5:1;)      local.get 4
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 4
    (;9:2;)      i32.const 0
    (;10:0;)     i32.store
    (;11:1;)     local.get 0
    (;12:2;)     local.get 2
    (;13:3;)     local.get 3
    (;14:2;)     call 2  waspGo::hostGetKeyId
    (;15:0;)     i32.store offset=4
    (;16:1;)     local.get 0
    (;17:2;)     local.get 1
    (;18:0;)     i32.store
    (;19:1;)     local.get 4
    (;20:2;)     i32.const 16
    (;21:1;)     i32.add
    (;22:0;)     global.set 0
    (;23:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScImmutableString).Value" (;29;) (type 1) (param (;0;) i32 (;1;) i32 (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=28
    (;8:1;)      local.get 3
    (;9:2;)      i32.const 2
    (;10:0;)     i32.store offset=20
    (;11:1;)     local.get 3
    (;12:2;)     i64.const 0
    (;13:0;)     i64.store offset=8
    (;14:1;)     i32.const 0
    (;15:1;)     i32.load offset=70816
    (;16:0;)     local.set 4
    (;17:1;)     i32.const 0
    (;18:2;)     local.get 3
    (;19:3;)     i32.const 16
    (;20:2;)     i32.add
    (;21:0;)     i32.store offset=70816
    (;22:1;)     local.get 3
    (;23:2;)     local.get 4
    (;24:0;)     i32.store offset=16
    (;25:1;)     local.get 3
    (;26:2;)     local.get 3
    (;27:3;)     i32.const 8
    (;28:2;)     i32.add
    (;29:0;)     i32.store offset=24
    (;30:1;)     local.get 3
    (;31:2;)     local.get 1
    (;32:3;)     local.get 2
    (;33:0;)     call 12  github.com/iotaledger/wart/wasplib.GetString
    (;34:1;)     i32.const 0
    (;35:2;)     local.get 4
    (;36:0;)     i32.store offset=70816
    (;37:1;)     local.get 3
    (;38:2;)     local.get 3
    (;39:2;)     i32.load
    (;40:2;)     local.tee 4
    (;41:0;)     i32.store offset=28
    (;42:1;)     local.get 0
    (;43:2;)     local.get 3
    (;44:2;)     i32.load offset=4
    (;45:0;)     i32.store offset=4
    (;46:1;)     local.get 0
    (;47:2;)     local.get 4
    (;48:0;)     i32.store
    (;49:1;)     local.get 3
    (;50:2;)     i32.const 32
    (;51:1;)     i32.add
    (;52:0;)     global.set 0
    (;53:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScEvent).Code" (;30;) (type 12) (param (;0;) i32 (;1;) i64)
    (local (;2;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 2
    (;9:2;)      local.get 0
    (;10:3;)     i32.const 65596
    (;11:4;)     i32.const 4
    (;12:0;)     call 31  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt
    (;13:1;)     local.get 2
    (;14:1;)     i32.load
    (;15:2;)     local.get 2
    (;16:2;)     i32.load offset=4
    (;17:3;)     local.get 1
    (;18:0;)     call 32  (github.com/iotaledger/wart/wasplib.ScMutableInt).SetValue
    (;19:1;)     local.get 2
    (;20:2;)     i32.const 16
    (;21:1;)     i32.add
    (;22:0;)     global.set 0
    (;23:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt" (;31;) (type 3) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32)
    (local (;4;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 4
    (;4:0;)      global.set 0
    (;5:1;)      local.get 4
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 4
    (;9:2;)      i32.const 0
    (;10:0;)     i32.store
    (;11:1;)     local.get 0
    (;12:2;)     local.get 2
    (;13:3;)     local.get 3
    (;14:2;)     call 2  waspGo::hostGetKeyId
    (;15:0;)     i32.store offset=4
    (;16:1;)     local.get 0
    (;17:2;)     local.get 1
    (;18:0;)     i32.store
    (;19:1;)     local.get 4
    (;20:2;)     i32.const 16
    (;21:1;)     i32.add
    (;22:0;)     global.set 0
    (;23:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableInt).SetValue" (;32;) (type 13) (param (;0;) i32 (;1;) i32 (;2;) i64)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 0
    (;9:2;)      local.get 1
    (;10:3;)     local.get 2
    (;11:0;)     call 37  github.com/iotaledger/wart/wasplib.SetInt
    (;12:1;)     local.get 3
    (;13:2;)     i32.const 16
    (;14:1;)     i32.add
    (;15:0;)     global.set 0
    (;16:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScEvent).Delay" (;33;) (type 12) (param (;0;) i32 (;1;) i64)
    (local (;2;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 2
    (;9:2;)      local.get 0
    (;10:3;)     i32.const 65600
    (;11:4;)     i32.const 5
    (;12:0;)     call 31  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt
    (;13:1;)     local.get 2
    (;14:1;)     i32.load
    (;15:2;)     local.get 2
    (;16:2;)     i32.load offset=4
    (;17:3;)     local.get 1
    (;18:0;)     call 32  (github.com/iotaledger/wart/wasplib.ScMutableInt).SetValue
    (;19:1;)     local.get 2
    (;20:2;)     i32.const 16
    (;21:1;)     i32.add
    (;22:0;)     global.set 0
    (;23:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScImmutableInt).Value" (;34;) (type 7) (param (;0;) i32 (;1;) i32) (result i64)
    (local (;2;) i32)
    (local (;3;) i64)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 0
    (;9:2;)      local.get 1
    (;10:1;)     call 11  github.com/iotaledger/wart/wasplib.GetInt
    (;11:0;)     local.set 3
    (;12:1;)     local.get 2
    (;13:2;)     i32.const 16
    (;14:1;)     i32.add
    (;15:0;)     global.set 0
    (;16:1;)     local.get 3
    (;17:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScImmutableMap).GetInt" (;35;) (type 3) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32)
    (local (;4;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 4
    (;4:0;)      global.set 0
    (;5:1;)      local.get 4
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 4
    (;9:2;)      i32.const 0
    (;10:0;)     i32.store
    (;11:1;)     local.get 0
    (;12:2;)     local.get 2
    (;13:3;)     local.get 3
    (;14:2;)     call 2  waspGo::hostGetKeyId
    (;15:0;)     i32.store offset=4
    (;16:1;)     local.get 0
    (;17:2;)     local.get 1
    (;18:0;)     i32.store
    (;19:1;)     local.get 4
    (;20:2;)     i32.const 16
    (;21:1;)     i32.add
    (;22:0;)     global.set 0
    (;23:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScImmutableMap).GetMap" (;36;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store
    (;8:1;)      local.get 0
    (;9:2;)      local.get 1
    (;10:3;)     local.get 2
    (;11:2;)     call 2  waspGo::hostGetKeyId
    (;12:3;)     i32.const 2
    (;13:1;)     call 4  waspGo::hostGetObjectId
    (;14:0;)     local.set 0
    (;15:1;)     local.get 3
    (;16:2;)     i32.const 0
    (;17:0;)     i32.store offset=8
    (;18:1;)     local.get 3
    (;19:2;)     i32.const 16
    (;20:1;)     i32.add
    (;21:0;)     global.set 0
    (;22:1;)     local.get 0
    (;23:0;)   end
  )

  (func "github.com/iotaledger/wart/wasplib.SetInt" (;37;) (type 13) (param (;0;) i32 (;1;) i32 (;2;) i64)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      local.get 2
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 0
    (;9:2;)      local.get 1
    (;10:3;)     local.get 3
    (;11:4;)     i32.const 8
    (;12:3;)     i32.add
    (;13:0;)     call 5  waspGo::hostSetInt
    (;14:1;)     local.get 3
    (;15:2;)     i32.const 16
    (;16:1;)     i32.add
    (;17:0;)     global.set 0
    (;18:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableInt).Value" (;38;) (type 7) (param (;0;) i32 (;1;) i32) (result i64)
    (local (;2;) i32)
    (local (;3;) i64)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 0
    (;9:2;)      local.get 1
    (;10:1;)     call 11  github.com/iotaledger/wart/wasplib.GetInt
    (;11:0;)     local.set 3
    (;12:1;)     local.get 2
    (;13:2;)     i32.const 16
    (;14:1;)     i32.add
    (;15:0;)     global.set 0
    (;16:1;)     local.get 3
    (;17:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableMap).GetStringArray" (;39;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store
    (;8:1;)      local.get 0
    (;9:2;)      local.get 1
    (;10:3;)     local.get 2
    (;11:2;)     call 2  waspGo::hostGetKeyId
    (;12:3;)     i32.const 5
    (;13:1;)     call 4  waspGo::hostGetObjectId
    (;14:0;)     local.set 0
    (;15:1;)     local.get 3
    (;16:2;)     i32.const 0
    (;17:0;)     i32.store offset=8
    (;18:1;)     local.get 3
    (;19:2;)     i32.const 16
    (;20:1;)     i32.add
    (;21:0;)     global.set 0
    (;22:1;)     local.get 0
    (;23:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableString).SetValue" (;40;) (type 3) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32)
    (local (;4;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 4
    (;4:0;)      global.set 0
    (;5:1;)      local.get 4
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 0
    (;9:2;)      local.get 1
    (;10:3;)     local.get 2
    (;11:4;)     local.get 3
    (;12:0;)     call 3  waspGo::hostSetString
    (;13:1;)     local.get 4
    (;14:2;)     i32.const 16
    (;15:1;)     i32.add
    (;16:0;)     global.set 0
    (;17:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableString).Value" (;41;) (type 1) (param (;0;) i32 (;1;) i32 (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=28
    (;8:1;)      local.get 3
    (;9:2;)      i32.const 2
    (;10:0;)     i32.store offset=20
    (;11:1;)     local.get 3
    (;12:2;)     i64.const 0
    (;13:0;)     i64.store offset=8
    (;14:1;)     i32.const 0
    (;15:1;)     i32.load offset=70816
    (;16:0;)     local.set 4
    (;17:1;)     i32.const 0
    (;18:2;)     local.get 3
    (;19:3;)     i32.const 16
    (;20:2;)     i32.add
    (;21:0;)     i32.store offset=70816
    (;22:1;)     local.get 3
    (;23:2;)     local.get 4
    (;24:0;)     i32.store offset=16
    (;25:1;)     local.get 3
    (;26:2;)     local.get 3
    (;27:3;)     i32.const 8
    (;28:2;)     i32.add
    (;29:0;)     i32.store offset=24
    (;30:1;)     local.get 3
    (;31:2;)     local.get 1
    (;32:3;)     local.get 2
    (;33:0;)     call 12  github.com/iotaledger/wart/wasplib.GetString
    (;34:1;)     i32.const 0
    (;35:2;)     local.get 4
    (;36:0;)     i32.store offset=70816
    (;37:1;)     local.get 3
    (;38:2;)     local.get 3
    (;39:2;)     i32.load
    (;40:2;)     local.tee 4
    (;41:0;)     i32.store offset=28
    (;42:1;)     local.get 0
    (;43:2;)     local.get 3
    (;44:2;)     i32.load offset=4
    (;45:0;)     i32.store offset=4
    (;46:1;)     local.get 0
    (;47:2;)     local.get 4
    (;48:0;)     i32.store
    (;49:1;)     local.get 3
    (;50:2;)     i32.const 32
    (;51:1;)     i32.add
    (;52:0;)     global.set 0
    (;53:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableStringArray).Clear" (;42;) (type 0) (param (;0;) i32)
    (local (;1;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 0
    (;9:2;)      call 15  github.com/iotaledger/wart/wasplib.KeyLength
    (;10:3;)     i64.const 0
    (;11:0;)     call 37  github.com/iotaledger/wart/wasplib.SetInt
    (;12:1;)     local.get 1
    (;13:2;)     i32.const 16
    (;14:1;)     i32.add
    (;15:0;)     global.set 0
    (;16:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableStringArray).GetString" (;43;) (type 1) (param (;0;) i32 (;1;) i32 (;2;) i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:2;)      i64.const 0
    (;5:0;)      i64.store offset=8
    (;6:1;)      local.get 3
    (;7:2;)      i32.const 0
    (;8:0;)      i32.store
    (;9:1;)      local.get 0
    (;10:2;)     local.get 2
    (;11:0;)     i32.store offset=4
    (;12:1;)     local.get 0
    (;13:2;)     local.get 1
    (;14:0;)     i32.store
    (;15:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScMutableStringArray).Length" (;44;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (local (;2;) i64)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 0
    (;9:2;)      call 15  github.com/iotaledger/wart/wasplib.KeyLength
    (;10:1;)     call 11  github.com/iotaledger/wart/wasplib.GetInt
    (;11:0;)     local.set 2
    (;12:1;)     local.get 1
    (;13:2;)     i32.const 16
    (;14:1;)     i32.add
    (;15:0;)     global.set 0
    (;16:1;)     local.get 2
    (;17:1;)     i32.wrap_i64
    (;18:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScRequest).Address" (;45;) (type 11) (param (;0;) i32 (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 48
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=44
    (;8:1;)      local.get 2
    (;9:2;)      i32.const 2
    (;10:0;)     i32.store offset=36
    (;11:1;)     local.get 2
    (;12:2;)     i32.const 0
    (;13:0;)     i32.store offset=24
    (;14:1;)     i32.const 0
    (;15:1;)     i32.load offset=70816
    (;16:0;)     local.set 3
    (;17:1;)     i32.const 0
    (;18:2;)     local.get 2
    (;19:3;)     i32.const 32
    (;20:2;)     i32.add
    (;21:0;)     i32.store offset=70816
    (;22:1;)     local.get 2
    (;23:2;)     local.get 3
    (;24:0;)     i32.store offset=32
    (;25:1;)     local.get 2
    (;26:2;)     local.get 2
    (;27:3;)     i32.const 24
    (;28:2;)     i32.add
    (;29:0;)     i32.store offset=40
    (;30:1;)     local.get 2
    (;31:2;)     i32.const 16
    (;32:1;)     i32.add
    (;33:2;)     local.get 1
    (;34:3;)     i32.const 65622
    (;35:4;)     i32.const 7
    (;36:0;)     call 28  (github.com/iotaledger/wart/wasplib.ScImmutableMap).GetString
    (;37:1;)     local.get 2
    (;38:2;)     i32.const 8
    (;39:1;)     i32.add
    (;40:2;)     local.get 2
    (;41:2;)     i32.load offset=16
    (;42:3;)     local.get 2
    (;43:3;)     i32.load offset=20
    (;44:0;)     call 29  (github.com/iotaledger/wart/wasplib.ScImmutableString).Value
    (;45:1;)     i32.const 0
    (;46:2;)     local.get 3
    (;47:0;)     i32.store offset=70816
    (;48:1;)     local.get 2
    (;49:2;)     local.get 2
    (;50:2;)     i32.load offset=8
    (;51:2;)     local.tee 3
    (;52:0;)     i32.store offset=44
    (;53:1;)     local.get 0
    (;54:2;)     local.get 2
    (;55:2;)     i32.load offset=12
    (;56:0;)     i32.store offset=4
    (;57:1;)     local.get 0
    (;58:2;)     local.get 3
    (;59:0;)     i32.store
    (;60:1;)     local.get 2
    (;61:2;)     i32.const 48
    (;62:1;)     i32.add
    (;63:0;)     global.set 0
    (;64:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScRequest).Params" (;46;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 0
    (;9:2;)      i32.const 65616
    (;10:3;)     i32.const 6
    (;11:1;)     call 36  (github.com/iotaledger/wart/wasplib.ScImmutableMap).GetMap
    (;12:0;)     local.set 0
    (;13:1;)     local.get 1
    (;14:2;)     i32.const 16
    (;15:1;)     i32.add
    (;16:0;)     global.set 0
    (;17:1;)     local.get 0
    (;18:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScTransfer).Address" (;47;) (type 1) (param (;0;) i32 (;1;) i32 (;2;) i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=24
    (;11:1;)     local.get 3
    (;12:2;)     i32.const 0
    (;13:0;)     i32.store offset=16
    (;14:1;)     local.get 0
    (;15:2;)     i32.const 65622
    (;16:3;)     i32.const 7
    (;17:2;)     call 2  waspGo::hostGetKeyId
    (;18:3;)     local.get 1
    (;19:4;)     local.get 2
    (;20:0;)     call 40  (github.com/iotaledger/wart/wasplib.ScMutableString).SetValue
    (;21:1;)     local.get 3
    (;22:2;)     i32.const 32
    (;23:1;)     i32.add
    (;24:0;)     global.set 0
    (;25:0;)   end
  )

  (func "(github.com/iotaledger/wart/wasplib.ScTransfer).Amount" (;48;) (type 12) (param (;0;) i32 (;1;) i64)
    (local (;2;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 2
    (;9:2;)      local.get 0
    (;10:3;)     i32.const 65629
    (;11:4;)     i32.const 6
    (;12:0;)     call 31  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt
    (;13:1;)     local.get 2
    (;14:1;)     i32.load
    (;15:2;)     local.get 2
    (;16:2;)     i32.load offset=4
    (;17:3;)     local.get 1
    (;18:0;)     call 32  (github.com/iotaledger/wart/wasplib.ScMutableInt).SetValue
    (;19:1;)     local.get 2
    (;20:2;)     i32.const 16
    (;21:1;)     i32.add
    (;22:0;)     global.set 0
    (;23:0;)   end
  )

  (func "(reflect.Type).Align" (;49;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 64
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=52 align=2
    (;8:1;)      local.get 1
    (;9:2;)      i64.const 3
    (;10:0;)     i64.store offset=44 align=2
    (;11:1;)     i32.const 0
    (;12:1;)     i32.load offset=70816
    (;13:0;)     local.set 2
    (;14:1;)     i32.const 0
    (;15:2;)     local.get 1
    (;16:3;)     i32.const 40
    (;17:2;)     i32.add
    (;18:0;)     i32.store offset=70816
    (;19:1;)     local.get 1
    (;20:2;)     local.get 2
    (;21:0;)     i32.store offset=40
    (;22:0;)     block
    (;23:0;)       block
    (;24:0;)         loop
    (;25:1;)           local.get 0
    (;26:1;)           call 50  (reflect.Type).Kind
    (;27:2;)           i32.const -1
    (;28:1;)           i32.add
    (;29:1;)           local.tee 3
    (;30:2;)           i32.const 25
    (;31:1;)           i32.gt_u
    (;32:0;)           br_if 1
    (;33:1;)           i32.const 4
    (;34:0;)           local.set 4
    (;35:0;)           block
    (;36:0;)             block
    (;37:0;)               block
    (;38:0;)                 block
    (;39:1;)                   local.get 3
    (;40:0;)                   br_table 0 6 0 1 6 6 6 0 1 6 6 6 6 6 6 6 6 6 6 6 6 6 3 5 6 2 0
    (;41:0;)                 end
    (;42:1;)                 i32.const 1
    (;43:0;)                 local.set 4
    (;44:0;)                 br 5
    (;45:0;)               end
    (;46:1;)               i32.const 2
    (;47:0;)               local.set 4
    (;48:0;)               br 4
    (;49:0;)             end
    (;50:1;)             local.get 0
    (;51:1;)             call 51  (reflect.Type).NumField
    (;52:0;)             local.set 5
    (;53:1;)             i32.const 0
    (;54:0;)             local.set 3
    (;55:1;)             local.get 1
    (;56:2;)             i32.const 56
    (;57:1;)             i32.add
    (;58:0;)             local.set 6
    (;59:1;)             local.get 1
    (;60:2;)             i32.const 52
    (;61:1;)             i32.add
    (;62:0;)             local.set 7
    (;63:1;)             local.get 1
    (;64:2;)             i32.const 48
    (;65:1;)             i32.add
    (;66:0;)             local.set 8
    (;67:1;)             i32.const 1
    (;68:0;)             local.set 4
    (;69:0;)             loop
    (;70:1;)               local.get 3
    (;71:2;)               local.get 5
    (;72:1;)               i32.ge_s
    (;73:0;)               br_if 4
    (;74:1;)               local.get 1
    (;75:2;)               local.get 0
    (;76:3;)               local.get 3
    (;77:0;)               call 52  (reflect.Type).Field
    (;78:1;)               local.get 6
    (;79:2;)               local.get 1
    (;80:2;)               i32.load offset=20
    (;81:0;)               i32.store
    (;82:1;)               local.get 7
    (;83:2;)               local.get 1
    (;84:2;)               i32.load offset=8
    (;85:0;)               i32.store
    (;86:1;)               local.get 8
    (;87:2;)               local.get 1
    (;88:2;)               i32.load
    (;89:0;)               i32.store
    (;90:1;)               local.get 1
    (;91:1;)               i32.load offset=16
    (;92:1;)               call 49  (reflect.Type).Align
    (;93:1;)               local.tee 9
    (;94:2;)               local.get 4
    (;95:3;)               local.get 9
    (;96:4;)               local.get 4
    (;97:3;)               i32.gt_s
    (;98:1;)               select
    (;99:0;)               local.set 4
    (;100:1;)              local.get 3
    (;101:2;)              i32.const 1
    (;102:1;)              i32.add
    (;103:0;)              local.set 3
    (;104:0;)              br 0
    (;105:0;)            end
    (;106:0;)          end
    (;107:1;)          local.get 0
    (;108:1;)          call 53  (reflect.Type).Elem
    (;109:0;)          local.set 0
    (;110:0;)          br 0
    (;111:0;)        end
    (;112:0;)      end
    (;113:1;)      i32.const 34
    (;114:2;)      i32.const 65968
    (;115:0;)      call 54  runtime._panic
    (;116:0;)      unreachable
    (;117:0;)    end
    (;118:1;)    i32.const 0
    (;119:2;)    local.get 2
    (;120:0;)    i32.store offset=70816
    (;121:1;)    local.get 1
    (;122:2;)    i32.const 64
    (;123:1;)    i32.add
    (;124:0;)    global.set 0
    (;125:1;)    local.get 4
    (;126:0;)  end
  )

  (func "(reflect.Type).Kind" (;50;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (;0:1;)      local.get 0
    (;1:2;)      i32.const 1
    (;2:1;)      i32.shr_u
    (;3:0;)      local.set 1
    (;4:0;)      block
    (;5:1;)        local.get 0
    (;6:2;)        i32.const 1
    (;7:1;)        i32.and
    (;8:0;)        br_if 0
    (;9:1;)        local.get 1
    (;10:2;)       i32.const 31
    (;11:1;)       i32.and
    (;12:1;)       return
    (;13:0;)     end
    (;14:1;)     local.get 1
    (;15:2;)     i32.const 7
    (;16:1;)     i32.and
    (;17:2;)     i32.const 19
    (;18:1;)     i32.add
    (;19:0;)   end
  )

  (func "(reflect.Type).NumField" (;51;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=28
    (;8:1;)      local.get 1
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=20 align=2
    (;11:1;)     local.get 1
    (;12:2;)     i64.const 4
    (;13:0;)     i64.store offset=12 align=2
    (;14:1;)     i32.const 0
    (;15:1;)     i32.load offset=70816
    (;16:0;)     local.set 2
    (;17:1;)     i32.const 0
    (;18:2;)     local.get 1
    (;19:3;)     i32.const 8
    (;20:2;)     i32.add
    (;21:0;)     i32.store offset=70816
    (;22:1;)     local.get 1
    (;23:2;)     local.get 2
    (;24:0;)     i32.store offset=8
    (;25:0;)     block
    (;26:1;)       local.get 0
    (;27:1;)       call 50  (reflect.Type).Kind
    (;28:2;)       i32.const 26
    (;29:1;)       i32.eq
    (;30:0;)       br_if 0
    (;31:1;)       local.get 1
    (;32:2;)       i32.const 8
    (;33:1;)       i32.add
    (;34:2;)       i32.const 8
    (;35:1;)       i32.add
    (;36:2;)       i32.const 8
    (;37:2;)       call 59  runtime.alloc
    (;38:2;)       local.tee 0
    (;39:0;)       i32.store
    (;40:1;)       local.get 1
    (;41:2;)       i32.const 20
    (;42:1;)       i32.add
    (;43:2;)       local.get 0
    (;44:0;)       i32.store
    (;45:1;)       local.get 0
    (;46:2;)       i32.const 8
    (;47:0;)       i32.store offset=4
    (;48:1;)       local.get 0
    (;49:2;)       i32.const 66111
    (;50:0;)       i32.store
    (;51:1;)       i32.const 4069
    (;52:2;)       local.get 0
    (;53:0;)       call 54  runtime._panic
    (;54:0;)       unreachable
    (;55:0;)     end
    (;56:1;)     local.get 1
    (;57:2;)     i32.const 24
    (;58:1;)     i32.add
    (;59:2;)     local.get 0
    (;60:2;)     call 55  (reflect.Type).stripPrefix
    (;61:3;)     i32.const 67504
    (;62:2;)     i32.add
    (;63:2;)     local.tee 0
    (;64:0;)     i32.store
    (;65:1;)     local.get 1
    (;66:2;)     local.get 0
    (;67:0;)     call 56  reflect.readVarint
    (;68:1;)     i32.const 0
    (;69:2;)     local.get 2
    (;70:0;)     i32.store offset=70816
    (;71:1;)     local.get 1
    (;72:2;)     i32.const 28
    (;73:1;)     i32.add
    (;74:2;)     local.get 1
    (;75:2;)     i32.load offset=4
    (;76:0;)     i32.store
    (;77:1;)     local.get 1
    (;78:1;)     i32.load
    (;79:0;)     local.set 0
    (;80:1;)     local.get 1
    (;81:2;)     i32.const 32
    (;82:1;)     i32.add
    (;83:0;)     global.set 0
    (;84:1;)     local.get 0
    (;85:0;)   end
  )

  (func "(reflect.Type).Field" (;52;) (type 1) (param (;0;) i32 (;1;) i32 (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i32)
    (local (;10;) i32)
    (local (;11;) i32)
    (local (;12;) i32)
    (local (;13;) i32)
    (local (;14;) i32)
    (local (;15;) i32)
    (local (;16;) i32)
    (local (;17;) i32)
    (local (;18;) i32)
    (local (;19;) i32)
    (local (;20;) i32)
    (local (;21;) i32)
    (local (;22;) i32)
    (local (;23;) i32)
    (local (;24;) i32)
    (local (;25;) i32)
    (local (;26;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 160
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i64.const 68719476736
    (;7:0;)      i64.store offset=88
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=152
    (;11:1;)     local.get 3
    (;12:2;)     i64.const 0
    (;13:0;)     i64.store offset=144
    (;14:1;)     local.get 3
    (;15:2;)     i64.const 0
    (;16:0;)     i64.store offset=136
    (;17:1;)     local.get 3
    (;18:2;)     i64.const 0
    (;19:0;)     i64.store offset=128
    (;20:1;)     local.get 3
    (;21:2;)     i64.const 0
    (;22:0;)     i64.store offset=120
    (;23:1;)     local.get 3
    (;24:2;)     i64.const 0
    (;25:0;)     i64.store offset=112
    (;26:1;)     local.get 3
    (;27:2;)     i64.const 0
    (;28:0;)     i64.store offset=104
    (;29:1;)     local.get 3
    (;30:2;)     i64.const 0
    (;31:0;)     i64.store offset=96
    (;32:1;)     i32.const 0
    (;33:1;)     i32.load offset=70816
    (;34:0;)     local.set 4
    (;35:1;)     i32.const 0
    (;36:2;)     local.get 3
    (;37:3;)     i32.const 88
    (;38:2;)     i32.add
    (;39:0;)     i32.store offset=70816
    (;40:1;)     local.get 3
    (;41:2;)     local.get 4
    (;42:0;)     i32.store offset=88
    (;43:0;)     block
    (;44:0;)       block
    (;45:1;)         local.get 1
    (;46:1;)         call 50  (reflect.Type).Kind
    (;47:2;)         i32.const 26
    (;48:1;)         i32.ne
    (;49:0;)         br_if 0
    (;50:1;)         local.get 3
    (;51:2;)         i32.const 88
    (;52:1;)         i32.add
    (;53:2;)         i32.const 16
    (;54:1;)         i32.add
    (;55:2;)         local.get 1
    (;56:2;)         call 55  (reflect.Type).stripPrefix
    (;57:3;)         i32.const 67504
    (;58:2;)         i32.add
    (;59:2;)         local.tee 1
    (;60:0;)         i32.store
    (;61:1;)         local.get 3
    (;62:2;)         i32.const 40
    (;63:1;)         i32.add
    (;64:2;)         local.get 1
    (;65:0;)         call 56  reflect.readVarint
    (;66:1;)         local.get 3
    (;67:2;)         i32.const 108
    (;68:1;)         i32.add
    (;69:2;)         local.get 3
    (;70:2;)         i32.load offset=44
    (;71:2;)         local.tee 1
    (;72:0;)         i32.store
    (;73:1;)         local.get 3
    (;74:1;)         i32.load offset=40
    (;75:2;)         local.get 2
    (;76:1;)         i32.le_u
    (;77:0;)         br_if 1
    (;78:1;)         local.get 3
    (;79:2;)         i32.const 56
    (;80:1;)         i32.add
    (;81:2;)         i64.const 0
    (;82:0;)         i64.store
    (;83:1;)         local.get 3
    (;84:2;)         i32.const 48
    (;85:1;)         i32.add
    (;86:2;)         i32.const 16
    (;87:1;)         i32.add
    (;88:2;)         i64.const 0
    (;89:0;)         i64.store
    (;90:1;)         local.get 3
    (;91:2;)         i32.const 69
    (;92:1;)         i32.add
    (;93:2;)         i64.const 0
    (;94:0;)         i64.store align=0
    (;95:1;)         local.get 3
    (;96:2;)         i32.const 0
    (;97:0;)         i32.store offset=80
    (;98:1;)         local.get 3
    (;99:2;)         i64.const 0
    (;100:0;)        i64.store offset=48
    (;101:1;)        local.get 3
    (;102:2;)        i32.const 112
    (;103:1;)        i32.add
    (;104:2;)        local.get 3
    (;105:3;)        i32.const 48
    (;106:2;)        i32.add
    (;107:0;)        i32.store
    (;108:1;)        local.get 3
    (;109:2;)        i32.const 152
    (;110:1;)        i32.add
    (;111:0;)        local.set 5
    (;112:1;)        local.get 3
    (;113:2;)        i32.const 156
    (;114:1;)        i32.add
    (;115:0;)        local.set 6
    (;116:1;)        local.get 3
    (;117:2;)        i32.const 148
    (;118:1;)        i32.add
    (;119:0;)        local.set 7
    (;120:1;)        local.get 3
    (;121:2;)        i32.const 120
    (;122:1;)        i32.add
    (;123:0;)        local.set 8
    (;124:1;)        local.get 3
    (;125:2;)        i32.const 116
    (;126:1;)        i32.add
    (;127:0;)        local.set 9
    (;128:1;)        local.get 3
    (;129:2;)        i32.const 124
    (;130:1;)        i32.add
    (;131:0;)        local.set 10
    (;132:1;)        local.get 3
    (;133:2;)        i32.const 128
    (;134:1;)        i32.add
    (;135:0;)        local.set 11
    (;136:1;)        local.get 3
    (;137:2;)        i32.const 132
    (;138:1;)        i32.add
    (;139:0;)        local.set 12
    (;140:1;)        local.get 3
    (;141:2;)        i32.const 144
    (;142:1;)        i32.add
    (;143:0;)        local.set 13
    (;144:1;)        local.get 3
    (;145:2;)        i32.const 136
    (;146:1;)        i32.add
    (;147:0;)        local.set 14
    (;148:1;)        local.get 3
    (;149:2;)        i32.const 140
    (;150:1;)        i32.add
    (;151:0;)        local.set 15
    (;152:1;)        i32.const 0
    (;153:0;)        local.set 16
    (;154:1;)        i32.const 0
    (;155:0;)        local.set 17
    (;156:1;)        i32.const 0
    (;157:0;)        local.set 18
    (;158:1;)        i32.const 0
    (;159:0;)        local.set 19
    (;160:1;)        i32.const 0
    (;161:0;)        local.set 20
    (;162:1;)        i32.const 0
    (;163:0;)        local.set 21
    (;164:1;)        i32.const 0
    (;165:0;)        local.set 22
    (;166:1;)        i32.const 0
    (;167:0;)        local.set 23
    (;168:1;)        i32.const 0
    (;169:0;)        local.set 24
    (;170:1;)        i32.const 0
    (;171:0;)        local.set 25
    (;172:1;)        i32.const 0
    (;173:0;)        local.set 26
    (;174:0;)        block
    (;175:0;)          loop
    (;176:1;)            local.get 5
    (;177:2;)            local.get 22
    (;178:0;)            i32.store
    (;179:1;)            local.get 6
    (;180:2;)            local.get 19
    (;181:0;)            i32.store
    (;182:1;)            local.get 7
    (;183:2;)            local.get 24
    (;184:0;)            i32.store
    (;185:1;)            local.get 8
    (;186:2;)            local.get 1
    (;187:0;)            i32.store
    (;188:1;)            local.get 9
    (;189:2;)            local.get 1
    (;190:0;)            i32.store
    (;191:1;)            local.get 26
    (;192:2;)            local.get 2
    (;193:1;)            i32.gt_s
    (;194:0;)            br_if 1
    (;195:1;)            local.get 1
    (;196:1;)            i32.load8_u
    (;197:0;)            local.set 22
    (;198:1;)            local.get 3
    (;199:2;)            i32.const 32
    (;200:1;)            i32.add
    (;201:2;)            local.get 1
    (;202:3;)            i32.const 1
    (;203:2;)            i32.add
    (;204:0;)            call 56  reflect.readVarint
    (;205:1;)            local.get 10
    (;206:2;)            local.get 3
    (;207:2;)            i32.load offset=36
    (;208:2;)            local.tee 1
    (;209:0;)            i32.store
    (;210:1;)            local.get 3
    (;211:2;)            local.get 3
    (;212:2;)            i32.load offset=32
    (;213:2;)            local.tee 20
    (;214:0;)            i32.store offset=64
    (;215:1;)            i32.const 0
    (;216:0;)            local.set 18
    (;217:1;)            local.get 3
    (;218:2;)            local.get 25
    (;219:3;)            local.get 20
    (;220:3;)            call 49  (reflect.Type).Align
    (;221:3;)            local.tee 19
    (;222:2;)            i32.add
    (;223:3;)            i32.const -1
    (;224:2;)            i32.add
    (;225:3;)            i32.const 0
    (;226:4;)            local.get 19
    (;227:3;)            i32.sub
    (;228:2;)            i32.and
    (;229:2;)            local.tee 16
    (;230:0;)            i32.store offset=80
    (;231:1;)            local.get 20
    (;232:1;)            call 57  (reflect.Type).Size
    (;233:0;)            local.set 25
    (;234:1;)            local.get 3
    (;235:2;)            i32.const 24
    (;236:1;)            i32.add
    (;237:2;)            local.get 1
    (;238:0;)            call 56  reflect.readVarint
    (;239:1;)            local.get 11
    (;240:2;)            local.get 3
    (;241:2;)            i32.load offset=28
    (;242:2;)            local.tee 1
    (;243:0;)            i32.store
    (;244:1;)            local.get 3
    (;245:2;)            i32.const 16
    (;246:1;)            i32.add
    (;247:2;)            local.get 3
    (;248:2;)            i32.load offset=24
    (;249:0;)            call 58  reflect.readStringSidetable
    (;250:1;)            local.get 12
    (;251:2;)            local.get 3
    (;252:2;)            i32.load offset=16
    (;253:2;)            local.tee 24
    (;254:0;)            i32.store
    (;255:1;)            local.get 3
    (;256:2;)            local.get 22
    (;257:3;)            i32.const 1
    (;258:2;)            i32.and
    (;259:2;)            local.tee 17
    (;260:0;)            i32.store8 offset=76
    (;261:1;)            local.get 3
    (;262:2;)            local.get 3
    (;263:2;)            i32.load offset=20
    (;264:2;)            local.tee 23
    (;265:0;)            i32.store offset=52
    (;266:1;)            local.get 3
    (;267:2;)            local.get 24
    (;268:0;)            i32.store offset=48
    (;269:1;)            i32.const 66111
    (;270:0;)            local.set 19
    (;271:0;)            block
    (;272:1;)              local.get 22
    (;273:2;)              i32.const 2
    (;274:1;)              i32.and
    (;275:1;)              i32.eqz
    (;276:0;)              br_if 0
    (;277:1;)              local.get 3
    (;278:2;)              i32.const 8
    (;279:1;)              i32.add
    (;280:2;)              local.get 1
    (;281:0;)              call 56  reflect.readVarint
    (;282:1;)              local.get 14
    (;283:2;)              local.get 3
    (;284:2;)              i32.load offset=12
    (;285:2;)              local.tee 1
    (;286:0;)              i32.store
    (;287:1;)              local.get 3
    (;288:2;)              local.get 3
    (;289:2;)              i32.load offset=8
    (;290:0;)              call 58  reflect.readStringSidetable
    (;291:1;)              local.get 15
    (;292:2;)              local.get 3
    (;293:2;)              i32.load
    (;294:2;)              local.tee 19
    (;295:0;)              i32.store
    (;296:1;)              local.get 3
    (;297:1;)              i32.load offset=4
    (;298:0;)              local.set 18
    (;299:0;)            end
    (;300:1;)            local.get 16
    (;301:2;)            local.get 25
    (;302:1;)            i32.add
    (;303:0;)            local.set 25
    (;304:1;)            local.get 13
    (;305:2;)            local.get 1
    (;306:0;)            i32.store
    (;307:1;)            local.get 3
    (;308:2;)            local.get 18
    (;309:0;)            i32.store offset=72
    (;310:1;)            local.get 3
    (;311:2;)            local.get 19
    (;312:0;)            i32.store offset=68
    (;313:1;)            local.get 3
    (;314:2;)            i32.const 0
    (;315:3;)            i32.const 15
    (;316:4;)            local.get 22
    (;317:5;)            i32.const 4
    (;318:4;)            i32.and
    (;319:4;)            local.tee 22
    (;320:2;)            select
    (;321:2;)            local.tee 21
    (;322:0;)            i32.store offset=60
    (;323:1;)            local.get 3
    (;324:2;)            i32.const 66111
    (;325:3;)            i32.const 66096
    (;326:4;)            local.get 22
    (;327:2;)            select
    (;328:2;)            local.tee 22
    (;329:0;)            i32.store offset=56
    (;330:1;)            local.get 26
    (;331:2;)            i32.const 1
    (;332:1;)            i32.add
    (;333:0;)            local.set 26
    (;334:0;)            br 0
    (;335:0;)          end
    (;336:0;)        end
    (;337:1;)        i32.const 0
    (;338:2;)        local.get 4
    (;339:0;)        i32.store offset=70816
    (;340:1;)        local.get 0
    (;341:2;)        local.get 16
    (;342:0;)        i32.store offset=32
    (;343:1;)        local.get 0
    (;344:2;)        local.get 17
    (;345:3;)        i32.const 1
    (;346:2;)        i32.and
    (;347:0;)        i32.store8 offset=28
    (;348:1;)        local.get 0
    (;349:2;)        local.get 18
    (;350:0;)        i32.store offset=24
    (;351:1;)        local.get 0
    (;352:2;)        local.get 19
    (;353:0;)        i32.store offset=20
    (;354:1;)        local.get 0
    (;355:2;)        local.get 20
    (;356:0;)        i32.store offset=16
    (;357:1;)        local.get 0
    (;358:2;)        local.get 21
    (;359:0;)        i32.store offset=12
    (;360:1;)        local.get 0
    (;361:2;)        local.get 22
    (;362:0;)        i32.store offset=8
    (;363:1;)        local.get 0
    (;364:2;)        local.get 23
    (;365:0;)        i32.store offset=4
    (;366:1;)        local.get 0
    (;367:2;)        local.get 24
    (;368:0;)        i32.store
    (;369:1;)        local.get 3
    (;370:2;)        i32.const 160
    (;371:1;)        i32.add
    (;372:0;)        global.set 0
    (;373:0;)        return
    (;374:0;)      end
    (;375:1;)      local.get 3
    (;376:2;)      i32.const 88
    (;377:1;)      i32.add
    (;378:2;)      i32.const 8
    (;379:1;)      i32.add
    (;380:2;)      i32.const 8
    (;381:2;)      call 59  runtime.alloc
    (;382:2;)      local.tee 1
    (;383:0;)      i32.store
    (;384:1;)      local.get 3
    (;385:2;)      i32.const 100
    (;386:1;)      i32.add
    (;387:2;)      local.get 1
    (;388:0;)      i32.store
    (;389:1;)      local.get 1
    (;390:2;)      i32.const 5
    (;391:0;)      i32.store offset=4
    (;392:1;)      local.get 1
    (;393:2;)      i32.const 66032
    (;394:0;)      i32.store
    (;395:1;)      i32.const 4069
    (;396:2;)      local.get 1
    (;397:0;)      call 54  runtime._panic
    (;398:0;)      unreachable
    (;399:0;)    end
    (;400:1;)    i32.const 34
    (;401:2;)    i32.const 66088
    (;402:0;)    call 54  runtime._panic
    (;403:0;)    unreachable
    (;404:0;)  end
  )

  (func "(reflect.Type).Elem" (;53;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=28
    (;8:1;)      local.get 1
    (;9:2;)      i64.const 2
    (;10:0;)     i64.store offset=20 align=2
    (;11:1;)     i32.const 0
    (;12:1;)     i32.load offset=70816
    (;13:0;)     local.set 2
    (;14:1;)     i32.const 0
    (;15:2;)     local.get 1
    (;16:3;)     i32.const 16
    (;17:2;)     i32.add
    (;18:0;)     i32.store offset=70816
    (;19:1;)     local.get 1
    (;20:2;)     local.get 2
    (;21:0;)     i32.store offset=16
    (;22:0;)     block
    (;23:1;)       local.get 0
    (;24:1;)       call 50  (reflect.Type).Kind
    (;25:2;)       i32.const -19
    (;26:1;)       i32.add
    (;27:1;)       local.tee 3
    (;28:2;)       i32.const 4
    (;29:1;)       i32.gt_u
    (;30:0;)       br_if 0
    (;31:0;)       block
    (;32:0;)         block
    (;33:1;)           local.get 3
    (;34:0;)           br_table 0 2 0 0 1 0
    (;35:0;)         end
    (;36:1;)         local.get 0
    (;37:1;)         call 55  (reflect.Type).stripPrefix
    (;38:0;)         local.set 0
    (;39:1;)         i32.const 0
    (;40:2;)         local.get 2
    (;41:0;)         i32.store offset=70816
    (;42:1;)         local.get 1
    (;43:2;)         i32.const 32
    (;44:1;)         i32.add
    (;45:0;)         global.set 0
    (;46:1;)         local.get 0
    (;47:1;)         return
    (;48:0;)       end
    (;49:1;)       local.get 1
    (;50:2;)       i32.const 24
    (;51:1;)       i32.add
    (;52:2;)       local.get 0
    (;53:2;)       call 55  (reflect.Type).stripPrefix
    (;54:3;)       i32.const 67492
    (;55:2;)       i32.add
    (;56:2;)       local.tee 0
    (;57:0;)       i32.store
    (;58:1;)       local.get 1
    (;59:2;)       i32.const 8
    (;60:1;)       i32.add
    (;61:2;)       local.get 0
    (;62:0;)       call 56  reflect.readVarint
    (;63:1;)       i32.const 0
    (;64:2;)       local.get 2
    (;65:0;)       i32.store offset=70816
    (;66:1;)       local.get 1
    (;67:2;)       i32.const 28
    (;68:1;)       i32.add
    (;69:2;)       local.get 1
    (;70:2;)       i32.load offset=12
    (;71:0;)       i32.store
    (;72:1;)       local.get 1
    (;73:1;)       i32.load offset=8
    (;74:0;)       local.set 0
    (;75:1;)       local.get 1
    (;76:2;)       i32.const 32
    (;77:1;)       i32.add
    (;78:0;)       global.set 0
    (;79:1;)       local.get 0
    (;80:1;)       return
    (;81:0;)     end
    (;82:1;)     i32.const 34
    (;83:2;)     i32.const 66024
    (;84:0;)     call 54  runtime._panic
    (;85:0;)     unreachable
    (;86:0;)   end
  )

  (func "runtime._panic" (;54;) (type 11) (param (;0;) i32 (;1;) i32)
    (;0:1;)      i32.const 67120
    (;1:2;)      i32.const 7
    (;2:0;)      call 97  runtime.printstring
    (;3:1;)      local.get 0
    (;4:2;)      local.get 1
    (;5:0;)      call 98  runtime.printitf
    (;6:0;)      call 99  runtime.printnl
    (;7:0;)      unreachable
    (;8:0;)      unreachable
    (;9:0;)    end
  )

  (func "(reflect.Type).stripPrefix" (;55;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (;0:1;)      local.get 0
    (;1:2;)      i32.const 5
    (;2:1;)      i32.shr_u
    (;3:0;)      local.set 1
    (;4:0;)      block
    (;5:1;)        local.get 0
    (;6:2;)        i32.const 16
    (;7:1;)        i32.and
    (;8:1;)        i32.eqz
    (;9:0;)        br_if 0
    (;10:1;)       local.get 1
    (;11:2;)       i32.const 2
    (;12:1;)       i32.shl
    (;13:2;)       i32.const 67472
    (;14:1;)       i32.add
    (;15:1;)       i32.load
    (;16:1;)       return
    (;17:0;)     end
    (;18:1;)     local.get 1
    (;19:0;)   end
  )

  (func "reflect.readVarint" (;56;) (type 11) (param (;0;) i32 (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (;0:1;)      i32.const 0
    (;1:0;)      local.set 2
    (;2:1;)      i32.const 0
    (;3:0;)      local.set 3
    (;4:0;)      loop
    (;5:1;)        i32.const 0
    (;6:2;)        local.get 1
    (;7:2;)        i32.load8_s
    (;8:2;)        local.tee 4
    (;9:3;)        i32.const 127
    (;10:2;)       i32.and
    (;11:3;)       local.get 3
    (;12:2;)       i32.shl
    (;13:3;)       local.get 3
    (;14:4;)       i32.const 31
    (;15:3;)       i32.gt_u
    (;16:1;)       select
    (;17:2;)       local.get 2
    (;18:1;)       i32.or
    (;19:0;)       local.set 2
    (;20:1;)       local.get 1
    (;21:2;)       i32.const 1
    (;22:1;)       i32.add
    (;23:0;)       local.set 1
    (;24:1;)       local.get 3
    (;25:2;)       i32.const 7
    (;26:1;)       i32.add
    (;27:0;)       local.set 3
    (;28:1;)       local.get 4
    (;29:2;)       i32.const 0
    (;30:1;)       i32.lt_s
    (;31:0;)       br_if 0
    (;32:0;)     end
    (;33:1;)     local.get 0
    (;34:2;)     local.get 1
    (;35:0;)     i32.store offset=4
    (;36:1;)     local.get 0
    (;37:2;)     local.get 2
    (;38:0;)     i32.store
    (;39:0;)   end
  )

  (func "(reflect.Type).Size" (;57;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 112
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=108
    (;8:1;)      local.get 1
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=100 align=2
    (;11:1;)     local.get 1
    (;12:2;)     i64.const 4
    (;13:0;)     i64.store offset=92 align=2
    (;14:1;)     i32.const 0
    (;15:1;)     i32.load offset=70816
    (;16:0;)     local.set 2
    (;17:1;)     i32.const 0
    (;18:2;)     local.get 1
    (;19:3;)     i32.const 88
    (;20:2;)     i32.add
    (;21:0;)     i32.store offset=70816
    (;22:1;)     local.get 1
    (;23:2;)     local.get 2
    (;24:0;)     i32.store offset=88
    (;25:0;)     block
    (;26:0;)       block
    (;27:1;)         local.get 0
    (;28:1;)         call 50  (reflect.Type).Kind
    (;29:2;)         i32.const -1
    (;30:1;)         i32.add
    (;31:1;)         local.tee 3
    (;32:2;)         i32.const 25
    (;33:1;)         i32.gt_u
    (;34:0;)         br_if 0
    (;35:1;)         i32.const 1
    (;36:0;)         local.set 4
    (;37:0;)         block
    (;38:0;)           block
    (;39:0;)             block
    (;40:0;)               block
    (;41:0;)                 block
    (;42:0;)                   block
    (;43:0;)                     block
    (;44:1;)                       local.get 3
    (;45:0;)                       br_table 8 2 8 0 2 4 2 8 0 2 4 2 2 4 4 1 4 2 2 4 2 3 5 7 2 6 8
    (;46:0;)                     end
    (;47:1;)                     i32.const 2
    (;48:0;)                     local.set 4
    (;49:0;)                     br 7
    (;50:0;)                   end
    (;51:1;)                   i32.const 16
    (;52:0;)                   local.set 4
    (;53:0;)                   br 6
    (;54:0;)                 end
    (;55:1;)                 i32.const 4
    (;56:0;)                 local.set 4
    (;57:0;)                 br 5
    (;58:0;)               end
    (;59:1;)               i32.const 12
    (;60:0;)               local.set 4
    (;61:0;)               br 4
    (;62:0;)             end
    (;63:1;)             i32.const 8
    (;64:0;)             local.set 4
    (;65:0;)             br 3
    (;66:0;)           end
    (;67:1;)           local.get 0
    (;68:1;)           call 53  (reflect.Type).Elem
    (;69:1;)           call 57  (reflect.Type).Size
    (;70:0;)           local.set 4
    (;71:1;)           local.get 0
    (;72:1;)           call 60  (reflect.Type).Len
    (;73:0;)           local.set 0
    (;74:1;)           i32.const 0
    (;75:2;)           local.get 2
    (;76:0;)           i32.store offset=70816
    (;77:1;)           local.get 1
    (;78:2;)           i32.const 112
    (;79:1;)           i32.add
    (;80:0;)           global.set 0
    (;81:1;)           local.get 0
    (;82:2;)           local.get 4
    (;83:1;)           i32.mul
    (;84:1;)           return
    (;85:0;)         end
    (;86:0;)         block
    (;87:1;)           local.get 0
    (;88:1;)           call 51  (reflect.Type).NumField
    (;89:1;)           local.tee 4
    (;90:0;)           br_if 0
    (;91:1;)           i32.const 0
    (;92:0;)           local.set 4
    (;93:0;)           br 2
    (;94:0;)         end
    (;95:1;)         local.get 1
    (;96:2;)         i32.const 48
    (;97:1;)         i32.add
    (;98:2;)         i32.const 8
    (;99:1;)         i32.add
    (;100:2;)        i64.const 0
    (;101:0;)        i64.store
    (;102:1;)        local.get 1
    (;103:2;)        i32.const 48
    (;104:1;)        i32.add
    (;105:2;)        i32.const 16
    (;106:1;)        i32.add
    (;107:2;)        i64.const 0
    (;108:0;)        i64.store
    (;109:1;)        local.get 1
    (;110:2;)        i32.const 69
    (;111:1;)        i32.add
    (;112:2;)        i64.const 0
    (;113:0;)        i64.store align=0
    (;114:1;)        local.get 1
    (;115:2;)        i32.const 0
    (;116:0;)        i32.store offset=80
    (;117:1;)        local.get 1
    (;118:2;)        i64.const 0
    (;119:0;)        i64.store offset=48
    (;120:1;)        local.get 1
    (;121:2;)        i32.const 88
    (;122:1;)        i32.add
    (;123:2;)        i32.const 8
    (;124:1;)        i32.add
    (;125:2;)        local.get 1
    (;126:3;)        i32.const 48
    (;127:2;)        i32.add
    (;128:0;)        i32.store
    (;129:1;)        local.get 1
    (;130:2;)        i32.const 8
    (;131:1;)        i32.add
    (;132:2;)        local.get 0
    (;133:3;)        local.get 4
    (;134:4;)        i32.const -1
    (;135:3;)        i32.add
    (;136:0;)        call 52  (reflect.Type).Field
    (;137:1;)        local.get 1
    (;138:2;)        i32.const 108
    (;139:1;)        i32.add
    (;140:2;)        local.get 1
    (;141:2;)        i32.load offset=28
    (;142:0;)        i32.store
    (;143:1;)        local.get 1
    (;144:2;)        i32.const 88
    (;145:1;)        i32.add
    (;146:2;)        i32.const 16
    (;147:1;)        i32.add
    (;148:2;)        local.get 1
    (;149:2;)        i32.load offset=16
    (;150:0;)        i32.store
    (;151:1;)        local.get 1
    (;152:2;)        i32.const 100
    (;153:1;)        i32.add
    (;154:2;)        local.get 1
    (;155:2;)        i32.load offset=8
    (;156:0;)        i32.store
    (;157:1;)        local.get 1
    (;158:1;)        i32.load offset=40
    (;159:0;)        local.set 4
    (;160:1;)        local.get 1
    (;161:1;)        i32.load offset=24
    (;162:1;)        call 57  (reflect.Type).Size
    (;163:0;)        local.set 0
    (;164:1;)        i32.const 0
    (;165:2;)        local.get 2
    (;166:0;)        i32.store offset=70816
    (;167:1;)        local.get 1
    (;168:2;)        i32.const 112
    (;169:1;)        i32.add
    (;170:0;)        global.set 0
    (;171:1;)        local.get 0
    (;172:2;)        local.get 4
    (;173:1;)        i32.add
    (;174:1;)        return
    (;175:0;)      end
    (;176:1;)      i32.const 34
    (;177:2;)      i32.const 66160
    (;178:0;)      call 54  runtime._panic
    (;179:0;)      unreachable
    (;180:0;)    end
    (;181:1;)    i32.const 0
    (;182:2;)    local.get 2
    (;183:0;)    i32.store offset=70816
    (;184:1;)    local.get 1
    (;185:2;)    i32.const 112
    (;186:1;)    i32.add
    (;187:0;)    global.set 0
    (;188:1;)    local.get 4
    (;189:0;)  end
  )

  (func "reflect.readStringSidetable" (;58;) (type 11) (param (;0;) i32 (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      local.get 1
    (;7:3;)      i32.const 67536
    (;8:2;)      i32.add
    (;9:0;)      call 56  reflect.readVarint
    (;10:1;)     local.get 2
    (;11:2;)     local.get 2
    (;12:2;)     i32.load offset=4
    (;13:2;)     local.tee 1
    (;14:0;)     i32.store offset=8
    (;15:1;)     local.get 2
    (;16:2;)     local.get 2
    (;17:2;)     i32.load
    (;18:2;)     local.tee 3
    (;19:0;)     i32.store offset=12
    (;20:1;)     local.get 0
    (;21:2;)     local.get 3
    (;22:0;)     i32.store offset=4
    (;23:1;)     local.get 0
    (;24:2;)     local.get 1
    (;25:0;)     i32.store
    (;26:1;)     local.get 2
    (;27:2;)     i32.const 16
    (;28:1;)     i32.add
    (;29:0;)     global.set 0
    (;30:0;)   end
  )

  (func "runtime.alloc" (;59;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (;0:0;)      block
    (;1:1;)        local.get 0
    (;2:1;)        i32.eqz
    (;3:0;)        br_if 0
    (;4:1;)        local.get 0
    (;5:2;)        i32.const 15
    (;6:1;)        i32.add
    (;7:2;)        i32.const 4
    (;8:1;)        i32.shr_u
    (;9:0;)        local.set 1
    (;10:1;)       i32.const 0
    (;11:1;)       i32.load offset=70800
    (;12:1;)       local.tee 2
    (;13:0;)       local.set 3
    (;14:1;)       i32.const 0
    (;15:0;)       local.set 4
    (;16:1;)       i32.const 0
    (;17:0;)       local.set 5
    (;18:0;)       loop
    (;19:0;)         block
    (;20:1;)           local.get 3
    (;21:2;)           local.get 2
    (;22:1;)           i32.ne
    (;23:0;)           br_if 0
    (;24:1;)           local.get 5
    (;25:2;)           i32.const 255
    (;26:1;)           i32.and
    (;27:0;)           local.set 2
    (;28:1;)           i32.const 1
    (;29:0;)           local.set 5
    (;30:0;)           block
    (;31:1;)             local.get 2
    (;32:2;)             i32.const 1
    (;33:1;)             i32.gt_u
    (;34:0;)             br_if 0
    (;35:0;)             block
    (;36:1;)               local.get 2
    (;37:0;)               br_table 2 0 2
    (;38:0;)             end
    (;39:1;)             i32.const 0
    (;40:1;)             i32.load offset=70816
    (;41:0;)             local.set 5
    (;42:0;)             block
    (;43:0;)               loop
    (;44:0;)                 block
    (;45:1;)                   local.get 5
    (;46:0;)                   br_if 0
    (;47:1;)                   i32.const 0
    (;48:0;)                   local.set 6
    (;49:1;)                   i32.const 0
    (;50:0;)                   local.set 2
    (;51:0;)                   loop
    (;52:1;)                     local.get 2
    (;53:2;)                     i32.const 0
    (;54:2;)                     i32.load offset=67568
    (;55:1;)                     i32.ge_u
    (;56:0;)                     br_if 3
    (;57:0;)                     block
    (;58:1;)                       local.get 2
    (;59:2;)                       i32.const 3
    (;60:1;)                       i32.shr_u
    (;61:2;)                       i32.const 70780
    (;62:1;)                       i32.add
    (;63:1;)                       i32.load8_u
    (;64:2;)                       local.get 2
    (;65:3;)                       i32.const 7
    (;66:2;)                       i32.and
    (;67:1;)                       i32.shr_u
    (;68:2;)                       i32.const 1
    (;69:1;)                       i32.and
    (;70:1;)                       i32.eqz
    (;71:0;)                       br_if 0
    (;72:1;)                       local.get 6
    (;73:2;)                       i32.const 0
    (;74:2;)                       i32.load offset=67572
    (;75:1;)                       i32.add
    (;76:1;)                       i32.load
    (;77:0;)                       call 102  runtime.markRoot
    (;78:0;)                     end
    (;79:1;)                     local.get 6
    (;80:2;)                     i32.const 4
    (;81:1;)                     i32.add
    (;82:0;)                     local.set 6
    (;83:1;)                     local.get 2
    (;84:2;)                     i32.const 1
    (;85:1;)                     i32.add
    (;86:0;)                     local.set 2
    (;87:0;)                     br 0
    (;88:0;)                   end
    (;89:0;)                 end
    (;90:1;)                 local.get 5
    (;91:2;)                 i32.const 8
    (;92:1;)                 i32.add
    (;93:0;)                 local.set 6
    (;94:1;)                 local.get 5
    (;95:1;)                 i32.load offset=4
    (;96:2;)                 i32.const 2
    (;97:1;)                 i32.shl
    (;98:0;)                 local.set 2
    (;99:0;)                 block
    (;100:0;)                  loop
    (;101:1;)                    local.get 2
    (;102:1;)                    i32.eqz
    (;103:0;)                    br_if 1
    (;104:1;)                    local.get 6
    (;105:1;)                    i32.load
    (;106:0;)                    call 102  runtime.markRoot
    (;107:1;)                    local.get 2
    (;108:2;)                    i32.const -4
    (;109:1;)                    i32.add
    (;110:0;)                    local.set 2
    (;111:1;)                    local.get 6
    (;112:2;)                    i32.const 4
    (;113:1;)                    i32.add
    (;114:0;)                    local.set 6
    (;115:0;)                    br 0
    (;116:0;)                  end
    (;117:0;)                end
    (;118:1;)                local.get 5
    (;119:1;)                i32.load
    (;120:0;)                local.set 5
    (;121:0;)                br 0
    (;122:0;)              end
    (;123:0;)            end
    (;124:0;)            loop
    (;125:0;)              block
    (;126:1;)                i32.const 0
    (;127:1;)                i32.load8_u offset=70812
    (;128:0;)                br_if 0
    (;129:1;)                i32.const 0
    (;130:0;)                local.set 5
    (;131:1;)                i32.const 0
    (;132:0;)                local.set 2
    (;133:0;)                loop
    (;134:0;)                  block
    (;135:1;)                    local.get 2
    (;136:2;)                    i32.const 0
    (;137:2;)                    i32.load offset=70804
    (;138:1;)                    i32.lt_u
    (;139:0;)                    br_if 0
    (;140:1;)                    i32.const 2
    (;141:0;)                    local.set 5
    (;142:0;)                    br 5
    (;143:0;)                  end
    (;144:0;)                  block
    (;145:1;)                    local.get 2
    (;146:1;)                    call 103  (runtime.gcBlock).state
    (;147:2;)                    i32.const 255
    (;148:1;)                    i32.and
    (;149:2;)                    i32.const -1
    (;150:1;)                    i32.add
    (;151:1;)                    local.tee 6
    (;152:2;)                    i32.const 2
    (;153:1;)                    i32.gt_u
    (;154:0;)                    br_if 0
    (;155:0;)                    block
    (;156:0;)                      block
    (;157:0;)                        block
    (;158:1;)                          local.get 6
    (;159:0;)                          br_table 1 0 2 1
    (;160:0;)                        end
    (;161:1;)                        local.get 5
    (;162:2;)                        i32.const 1
    (;163:1;)                        i32.and
    (;164:0;)                        local.set 6
    (;165:1;)                        i32.const 0
    (;166:0;)                        local.set 5
    (;167:1;)                        local.get 6
    (;168:1;)                        i32.eqz
    (;169:0;)                        br_if 2
    (;170:0;)                      end
    (;171:1;)                      local.get 2
    (;172:0;)                      call 104  (runtime.gcBlock).markFree
    (;173:1;)                      i32.const 1
    (;174:0;)                      local.set 5
    (;175:0;)                      br 1
    (;176:0;)                    end
    (;177:1;)                    local.get 2
    (;178:2;)                    i32.const 2
    (;179:1;)                    i32.shr_u
    (;180:2;)                    i32.const 70821
    (;181:1;)                    i32.add
    (;182:1;)                    local.tee 6
    (;183:2;)                    local.get 6
    (;184:2;)                    i32.load8_u
    (;185:3;)                    i32.const 2
    (;186:4;)                    local.get 2
    (;187:5;)                    i32.const 1
    (;188:4;)                    i32.shl
    (;189:5;)                    i32.const 6
    (;190:4;)                    i32.and
    (;191:3;)                    i32.shl
    (;192:4;)                    i32.const -1
    (;193:3;)                    i32.xor
    (;194:2;)                    i32.and
    (;195:0;)                    i32.store8
    (;196:1;)                    i32.const 0
    (;197:0;)                    local.set 5
    (;198:0;)                  end
    (;199:1;)                  local.get 2
    (;200:2;)                  i32.const 1
    (;201:1;)                  i32.add
    (;202:0;)                  local.set 2
    (;203:0;)                  br 0
    (;204:0;)                end
    (;205:0;)              end
    (;206:1;)              i32.const 0
    (;207:0;)              local.set 2
    (;208:1;)              i32.const 0
    (;209:2;)              i32.const 0
    (;210:0;)              i32.store8 offset=70812
    (;211:0;)              loop
    (;212:1;)                local.get 2
    (;213:2;)                i32.const 0
    (;214:2;)                i32.load offset=70804
    (;215:1;)                i32.ge_u
    (;216:0;)                br_if 1
    (;217:0;)                block
    (;218:1;)                  local.get 2
    (;219:1;)                  call 103  (runtime.gcBlock).state
    (;220:2;)                  i32.const 255
    (;221:1;)                  i32.and
    (;222:2;)                  i32.const 3
    (;223:1;)                  i32.ne
    (;224:0;)                  br_if 0
    (;225:1;)                  local.get 2
    (;226:0;)                  call 105  runtime.startMark
    (;227:0;)                end
    (;228:1;)                local.get 2
    (;229:2;)                i32.const 1
    (;230:1;)                i32.add
    (;231:0;)                local.set 2
    (;232:0;)                br 0
    (;233:0;)              end
    (;234:0;)            end
    (;235:0;)          end
    (;236:1;)          i32.const 67127
    (;237:2;)          i32.const 13
    (;238:0;)          call 106  runtime.runtimePanic
    (;239:0;)          unreachable
    (;240:0;)        end
    (;241:0;)        block
    (;242:0;)          block
    (;243:1;)            i32.const 0
    (;244:2;)            local.get 3
    (;245:3;)            local.get 3
    (;246:4;)            i32.const 0
    (;247:4;)            i32.load offset=70804
    (;248:3;)            i32.eq
    (;249:3;)            local.tee 6
    (;250:1;)            select
    (;251:1;)            local.tee 2
    (;252:1;)            call 103  (runtime.gcBlock).state
    (;253:2;)            i32.const 255
    (;254:1;)            i32.and
    (;255:1;)            i32.eqz
    (;256:0;)            br_if 0
    (;257:1;)            local.get 2
    (;258:2;)            i32.const 1
    (;259:1;)            i32.add
    (;260:0;)            local.set 3
    (;261:1;)            i32.const 0
    (;262:0;)            local.set 4
    (;263:0;)            br 1
    (;264:0;)          end
    (;265:1;)          local.get 2
    (;266:2;)          i32.const 1
    (;267:1;)          i32.add
    (;268:0;)          local.set 3
    (;269:1;)          i32.const 1
    (;270:2;)          local.get 4
    (;271:3;)          i32.const 1
    (;272:2;)          i32.add
    (;273:3;)          local.get 6
    (;274:1;)          select
    (;275:1;)          local.tee 4
    (;276:2;)          local.get 1
    (;277:1;)          i32.ne
    (;278:0;)          br_if 0
    (;279:1;)          i32.const 0
    (;280:2;)          local.get 3
    (;281:0;)          i32.store offset=70800
    (;282:1;)          local.get 3
    (;283:2;)          local.get 1
    (;284:1;)          i32.sub
    (;285:1;)          local.tee 6
    (;286:2;)          i32.const 1
    (;287:0;)          call 107  (runtime.gcBlock).setState
    (;288:1;)          local.get 2
    (;289:2;)          local.get 1
    (;290:1;)          i32.sub
    (;291:2;)          i32.const 2
    (;292:1;)          i32.add
    (;293:0;)          local.set 2
    (;294:0;)          block
    (;295:0;)            loop
    (;296:1;)              local.get 2
    (;297:2;)              i32.const 0
    (;298:2;)              i32.load offset=70800
    (;299:1;)              i32.eq
    (;300:0;)              br_if 1
    (;301:1;)              local.get 2
    (;302:2;)              i32.const 2
    (;303:0;)              call 107  (runtime.gcBlock).setState
    (;304:1;)              local.get 2
    (;305:2;)              i32.const 1
    (;306:1;)              i32.add
    (;307:0;)              local.set 2
    (;308:0;)              br 0
    (;309:0;)            end
    (;310:0;)          end
    (;311:1;)          i32.const 0
    (;312:1;)          i32.load offset=70808
    (;313:2;)          local.get 6
    (;314:3;)          i32.const 4
    (;315:2;)          i32.shl
    (;316:1;)          i32.add
    (;317:2;)          i32.const 0
    (;318:3;)          local.get 0
    (;319:1;)          call 9  memset
    (;320:1;)          return
    (;321:0;)        end
    (;322:1;)        i32.const 0
    (;323:1;)        i32.load offset=70800
    (;324:0;)        local.set 2
    (;325:0;)        br 0
    (;326:0;)      end
    (;327:0;)    end
    (;328:1;)    i32.const 70796
    (;329:0;)  end
  )

  (func "(reflect.Type).Len" (;60;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 64
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=60
    (;8:1;)      local.get 1
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=52 align=2
    (;11:1;)     local.get 1
    (;12:2;)     i64.const 0
    (;13:0;)     i64.store offset=44 align=2
    (;14:1;)     local.get 1
    (;15:2;)     i64.const 6
    (;16:0;)     i64.store offset=36 align=2
    (;17:1;)     i32.const 0
    (;18:1;)     i32.load offset=70816
    (;19:0;)     local.set 2
    (;20:1;)     i32.const 0
    (;21:2;)     local.get 1
    (;22:3;)     i32.const 32
    (;23:2;)     i32.add
    (;24:0;)     i32.store offset=70816
    (;25:1;)     local.get 1
    (;26:2;)     local.get 2
    (;27:0;)     i32.store offset=32
    (;28:0;)     block
    (;29:1;)       local.get 0
    (;30:1;)       call 50  (reflect.Type).Kind
    (;31:2;)       i32.const 23
    (;32:1;)       i32.eq
    (;33:0;)       br_if 0
    (;34:1;)       local.get 1
    (;35:2;)       i64.const 0
    (;36:0;)       i64.store offset=24
    (;37:1;)       local.get 1
    (;38:2;)       i32.const 32
    (;39:1;)       i32.add
    (;40:2;)       i32.const 8
    (;41:1;)       i32.add
    (;42:2;)       local.get 1
    (;43:3;)       i32.const 24
    (;44:2;)       i32.add
    (;45:0;)       i32.store
    (;46:1;)       local.get 1
    (;47:2;)       i32.const 44
    (;48:1;)       i32.add
    (;49:2;)       i32.const 8
    (;50:2;)       call 59  runtime.alloc
    (;51:2;)       local.tee 0
    (;52:0;)       i32.store
    (;53:1;)       local.get 1
    (;54:2;)       i32.const 48
    (;55:1;)       i32.add
    (;56:2;)       local.get 0
    (;57:0;)       i32.store
    (;58:1;)       local.get 0
    (;59:2;)       i32.const 3
    (;60:0;)       i32.store offset=4
    (;61:1;)       local.get 0
    (;62:2;)       i32.const 66296
    (;63:0;)       i32.store
    (;64:1;)       i32.const 127
    (;65:2;)       local.get 0
    (;66:0;)       call 54  runtime._panic
    (;67:0;)       unreachable
    (;68:0;)     end
    (;69:1;)     local.get 1
    (;70:2;)     i32.const 52
    (;71:1;)     i32.add
    (;72:2;)     local.get 0
    (;73:2;)     call 55  (reflect.Type).stripPrefix
    (;74:3;)     i32.const 67492
    (;75:2;)     i32.add
    (;76:2;)     local.tee 0
    (;77:0;)     i32.store
    (;78:1;)     local.get 1
    (;79:2;)     i32.const 16
    (;80:1;)     i32.add
    (;81:2;)     local.get 0
    (;82:0;)     call 56  reflect.readVarint
    (;83:1;)     local.get 1
    (;84:2;)     i32.const 56
    (;85:1;)     i32.add
    (;86:2;)     local.get 1
    (;87:2;)     i32.load offset=20
    (;88:2;)     local.tee 0
    (;89:0;)     i32.store
    (;90:1;)     local.get 1
    (;91:2;)     i32.const 8
    (;92:1;)     i32.add
    (;93:2;)     local.get 0
    (;94:0;)     call 56  reflect.readVarint
    (;95:1;)     i32.const 0
    (;96:2;)     local.get 2
    (;97:0;)     i32.store offset=70816
    (;98:1;)     local.get 1
    (;99:2;)     i32.const 60
    (;100:1;)    i32.add
    (;101:2;)    local.get 1
    (;102:2;)    i32.load offset=12
    (;103:0;)    i32.store
    (;104:1;)    local.get 1
    (;105:1;)    i32.load offset=8
    (;106:0;)    local.set 0
    (;107:1;)    local.get 1
    (;108:2;)    i32.const 64
    (;109:1;)    i32.add
    (;110:0;)    global.set 0
    (;111:1;)    local.get 0
    (;112:0;)  end
  )

  (func "(reflect.Value).Bool" (;61;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 48
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=36 align=2
    (;11:1;)     local.get 3
    (;12:2;)     i32.const 3
    (;13:0;)     i32.store offset=28
    (;14:1;)     local.get 3
    (;15:2;)     local.get 2
    (;16:0;)     i32.store8 offset=16
    (;17:1;)     i32.const 0
    (;18:1;)     i32.load offset=70816
    (;19:0;)     local.set 4
    (;20:1;)     i32.const 0
    (;21:2;)     local.get 3
    (;22:3;)     i32.const 24
    (;23:2;)     i32.add
    (;24:0;)     i32.store offset=70816
    (;25:1;)     local.get 3
    (;26:2;)     local.get 4
    (;27:0;)     i32.store offset=24
    (;28:1;)     local.get 3
    (;29:2;)     local.get 1
    (;30:0;)     i32.store offset=12
    (;31:1;)     local.get 3
    (;32:2;)     local.get 0
    (;33:0;)     i32.store offset=8
    (;34:1;)     local.get 3
    (;35:2;)     local.get 3
    (;36:3;)     i32.const 8
    (;37:2;)     i32.add
    (;38:0;)     i32.store offset=32
    (;39:0;)     block
    (;40:0;)       block
    (;41:1;)         local.get 0
    (;42:2;)         local.get 1
    (;43:3;)         local.get 2
    (;44:1;)         call 62  (reflect.Value).Kind
    (;45:2;)         i32.const 1
    (;46:1;)         i32.ne
    (;47:0;)         br_if 0
    (;48:1;)         local.get 0
    (;49:2;)         local.get 1
    (;50:3;)         local.get 2
    (;51:1;)         call 63  (reflect.Value).isIndirect
    (;52:2;)         i32.const 1
    (;53:1;)         i32.and
    (;54:0;)         br_if 1
    (;55:1;)         i32.const 0
    (;56:2;)         local.get 4
    (;57:0;)         i32.store offset=70816
    (;58:1;)         local.get 3
    (;59:2;)         i32.const 48
    (;60:1;)         i32.add
    (;61:0;)         global.set 0
    (;62:1;)         local.get 1
    (;63:2;)         i32.const 0
    (;64:1;)         i32.ne
    (;65:1;)         return
    (;66:0;)       end
    (;67:1;)       local.get 3
    (;68:2;)       i32.const 36
    (;69:1;)       i32.add
    (;70:2;)       i32.const 8
    (;71:2;)       call 59  runtime.alloc
    (;72:2;)       local.tee 1
    (;73:0;)       i32.store
    (;74:1;)       local.get 3
    (;75:2;)       i32.const 40
    (;76:1;)       i32.add
    (;77:2;)       local.get 1
    (;78:0;)       i32.store
    (;79:1;)       local.get 1
    (;80:2;)       i32.const 4
    (;81:0;)       i32.store offset=4
    (;82:1;)       local.get 1
    (;83:2;)       i32.const 66168
    (;84:0;)       i32.store
    (;85:1;)       i32.const 3045
    (;86:2;)       local.get 1
    (;87:0;)       call 54  runtime._panic
    (;88:0;)       unreachable
    (;89:0;)     end
    (;90:1;)     local.get 1
    (;91:1;)     i32.load8_u
    (;92:0;)     local.set 1
    (;93:1;)     i32.const 0
    (;94:2;)     local.get 4
    (;95:0;)     i32.store offset=70816
    (;96:1;)     local.get 3
    (;97:2;)     i32.const 48
    (;98:1;)     i32.add
    (;99:0;)     global.set 0
    (;100:1;)    local.get 1
    (;101:0;)  end
  )

  (func "(reflect.Value).Kind" (;62;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i32.const 8
    (;7:1;)      i32.add
    (;8:2;)      i32.const 0
    (;9:0;)      i32.store8
    (;10:1;)     local.get 3
    (;11:2;)     i64.const 0
    (;12:0;)     i64.store
    (;13:1;)     local.get 0
    (;14:2;)     local.get 1
    (;15:3;)     local.get 2
    (;16:1;)     call 66  (reflect.Value).Type
    (;17:1;)     call 50  (reflect.Type).Kind
    (;18:0;)     local.set 0
    (;19:1;)     local.get 3
    (;20:2;)     i32.const 16
    (;21:1;)     i32.add
    (;22:0;)     global.set 0
    (;23:1;)     local.get 0
    (;24:0;)   end
  )

  (func "(reflect.Value).isIndirect" (;63;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:2;)      i32.const 8
    (;5:1;)      i32.add
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store8
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store
    (;11:1;)     local.get 2
    (;12:2;)     i32.const 1
    (;13:1;)     i32.and
    (;14:0;)   end
  )

  (func "(reflect.Value).Complex" (;64;) (type 3) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) f32)
    (local (;8;) f64)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 48
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 4
    (;4:0;)      global.set 0
    (;5:1;)      local.get 4
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=16 align=2
    (;8:1;)      local.get 4
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=36 align=2
    (;11:1;)     local.get 4
    (;12:2;)     i32.const 3
    (;13:0;)     i32.store offset=28
    (;14:1;)     local.get 4
    (;15:2;)     local.get 1
    (;16:0;)     i32.store offset=12
    (;17:1;)     i32.const 0
    (;18:1;)     i32.load offset=70816
    (;19:0;)     local.set 5
    (;20:1;)     i32.const 0
    (;21:2;)     local.get 4
    (;22:3;)     i32.const 24
    (;23:2;)     i32.add
    (;24:0;)     i32.store offset=70816
    (;25:1;)     local.get 4
    (;26:2;)     local.get 5
    (;27:0;)     i32.store offset=24
    (;28:1;)     local.get 4
    (;29:2;)     local.get 3
    (;30:0;)     i32.store8 offset=20
    (;31:1;)     local.get 4
    (;32:2;)     local.get 2
    (;33:0;)     i32.store offset=16
    (;34:1;)     local.get 4
    (;35:2;)     local.get 4
    (;36:3;)     i32.const 12
    (;37:2;)     i32.add
    (;38:0;)     i32.store offset=32
    (;39:0;)     block
    (;40:0;)       block
    (;41:0;)         block
    (;42:1;)           local.get 1
    (;43:2;)           local.get 2
    (;44:3;)           local.get 3
    (;45:1;)           call 62  (reflect.Value).Kind
    (;46:2;)           i32.const -15
    (;47:1;)           i32.add
    (;48:1;)           local.tee 6
    (;49:2;)           i32.const 1
    (;50:1;)           i32.gt_u
    (;51:0;)           br_if 0
    (;52:1;)           local.get 6
    (;53:0;)           br_table 1 2 1
    (;54:0;)         end
    (;55:1;)         local.get 4
    (;56:2;)         i32.const 36
    (;57:1;)         i32.add
    (;58:2;)         i32.const 8
    (;59:2;)         call 59  runtime.alloc
    (;60:2;)         local.tee 2
    (;61:0;)         i32.store
    (;62:1;)         local.get 4
    (;63:2;)         i32.const 40
    (;64:1;)         i32.add
    (;65:2;)         local.get 2
    (;66:0;)         i32.store
    (;67:1;)         local.get 2
    (;68:2;)         i32.const 7
    (;69:0;)         i32.store offset=4
    (;70:1;)         local.get 2
    (;71:2;)         i32.const 66172
    (;72:0;)         i32.store
    (;73:1;)         i32.const 3045
    (;74:2;)         local.get 2
    (;75:0;)         call 54  runtime._panic
    (;76:0;)         unreachable
    (;77:0;)       end
    (;78:1;)       local.get 1
    (;79:2;)       local.get 2
    (;80:3;)       local.get 3
    (;81:1;)       call 63  (reflect.Value).isIndirect
    (;82:0;)       drop
    (;83:1;)       local.get 2
    (;84:1;)       f32.load
    (;85:0;)       local.set 7
    (;86:1;)       i32.const 0
    (;87:2;)       local.get 5
    (;88:0;)       i32.store offset=70816
    (;89:1;)       local.get 0
    (;90:2;)       local.get 2
    (;91:2;)       f32.load offset=4
    (;92:2;)       f64.promote_f32
    (;93:0;)       f64.store offset=8
    (;94:1;)       local.get 0
    (;95:2;)       local.get 7
    (;96:2;)       f64.promote_f32
    (;97:0;)       f64.store
    (;98:1;)       local.get 4
    (;99:2;)       i32.const 48
    (;100:1;)      i32.add
    (;101:0;)      global.set 0
    (;102:0;)      return
    (;103:0;)    end
    (;104:1;)    i32.const 0
    (;105:2;)    local.get 5
    (;106:0;)    i32.store offset=70816
    (;107:1;)    local.get 2
    (;108:1;)    f64.load
    (;109:0;)    local.set 8
    (;110:1;)    local.get 0
    (;111:2;)    local.get 2
    (;112:2;)    f64.load offset=8
    (;113:0;)    f64.store offset=8
    (;114:1;)    local.get 0
    (;115:2;)    local.get 8
    (;116:0;)    f64.store
    (;117:1;)    local.get 4
    (;118:2;)    i32.const 48
    (;119:1;)    i32.add
    (;120:0;)    global.set 0
    (;121:0;)  end
  )

  (func "(reflect.Value).Field" (;65;) (type 14) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32 (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i32)
    (local (;10;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 224
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 5
    (;4:0;)      global.set 0
    (;5:1;)      local.get 5
    (;6:2;)      i32.const 77
    (;7:1;)      i32.add
    (;8:2;)      i64.const 0
    (;9:0;)      i64.store align=0
    (;10:1;)     local.get 5
    (;11:2;)     i64.const 0
    (;12:0;)     i64.store offset=40
    (;13:1;)     local.get 5
    (;14:2;)     i64.const 0
    (;15:0;)     i64.store offset=172 align=2
    (;16:1;)     local.get 5
    (;17:2;)     i32.const 0
    (;18:0;)     i32.store offset=220
    (;19:1;)     local.get 5
    (;20:2;)     i64.const 0
    (;21:0;)     i64.store offset=212 align=2
    (;22:1;)     local.get 5
    (;23:2;)     i64.const 0
    (;24:0;)     i64.store offset=204 align=2
    (;25:1;)     local.get 5
    (;26:2;)     i64.const 0
    (;27:0;)     i64.store offset=196 align=2
    (;28:1;)     local.get 5
    (;29:2;)     i64.const 0
    (;30:0;)     i64.store offset=188 align=2
    (;31:1;)     local.get 5
    (;32:2;)     i64.const 0
    (;33:0;)     i64.store offset=180 align=2
    (;34:1;)     local.get 5
    (;35:2;)     i32.const 14
    (;36:0;)     i32.store offset=164
    (;37:1;)     local.get 5
    (;38:2;)     i32.const 0
    (;39:0;)     i32.store offset=88
    (;40:1;)     local.get 5
    (;41:2;)     i64.const 0
    (;42:0;)     i64.store offset=56
    (;43:1;)     local.get 5
    (;44:2;)     i64.const 0
    (;45:0;)     i64.store offset=64
    (;46:1;)     local.get 5
    (;47:2;)     i64.const 0
    (;48:0;)     i64.store offset=72
    (;49:1;)     i32.const 0
    (;50:1;)     i32.load offset=70816
    (;51:0;)     local.set 6
    (;52:1;)     i32.const 0
    (;53:2;)     local.get 5
    (;54:3;)     i32.const 160
    (;55:2;)     i32.add
    (;56:0;)     i32.store offset=70816
    (;57:1;)     local.get 5
    (;58:2;)     local.get 6
    (;59:0;)     i32.store offset=160
    (;60:1;)     local.get 5
    (;61:2;)     local.get 2
    (;62:0;)     i32.store offset=44
    (;63:1;)     local.get 5
    (;64:2;)     local.get 5
    (;65:3;)     i32.const 40
    (;66:2;)     i32.add
    (;67:0;)     i32.store offset=168
    (;68:1;)     local.get 5
    (;69:2;)     local.get 5
    (;70:3;)     i32.const 56
    (;71:2;)     i32.add
    (;72:0;)     i32.store offset=172
    (;73:1;)     local.get 5
    (;74:2;)     local.get 3
    (;75:0;)     i32.store8 offset=48
    (;76:1;)     local.get 5
    (;77:2;)     local.get 1
    (;78:0;)     i32.store offset=40
    (;79:1;)     local.get 5
    (;80:2;)     local.get 1
    (;81:3;)     local.get 2
    (;82:4;)     local.get 3
    (;83:2;)     call 66  (reflect.Value).Type
    (;84:2;)     local.tee 7
    (;85:3;)     local.get 4
    (;86:0;)     call 52  (reflect.Type).Field
    (;87:1;)     local.get 5
    (;88:2;)     i32.const 80
    (;89:1;)     i32.add
    (;90:2;)     local.get 5
    (;91:2;)     i32.load offset=24
    (;92:0;)     i32.store
    (;93:1;)     local.get 5
    (;94:2;)     i32.const 68
    (;95:1;)     i32.add
    (;96:2;)     local.get 5
    (;97:2;)     i32.load offset=12
    (;98:2;)     local.tee 8
    (;99:0;)     i32.store
    (;100:1;)    local.get 5
    (;101:2;)    local.get 5
    (;102:2;)    i32.load offset=8
    (;103:2;)    local.tee 1
    (;104:0;)    i32.store offset=188
    (;105:1;)    local.get 5
    (;106:2;)    local.get 5
    (;107:2;)    i32.load
    (;108:2;)    local.tee 9
    (;109:0;)    i32.store offset=176
    (;110:1;)    local.get 5
    (;111:2;)    local.get 5
    (;112:2;)    i32.load offset=20
    (;113:2;)    local.tee 4
    (;114:0;)    i32.store offset=184
    (;115:1;)    local.get 5
    (;116:2;)    local.get 1
    (;117:0;)    i32.store offset=180
    (;118:1;)    local.get 5
    (;119:2;)    local.get 5
    (;120:2;)    i32.load offset=32
    (;121:2;)    local.tee 10
    (;122:0;)    i32.store offset=88
    (;123:1;)    local.get 5
    (;124:2;)    local.get 4
    (;125:0;)    i32.store offset=76
    (;126:1;)    local.get 5
    (;127:2;)    local.get 5
    (;128:2;)    i32.load offset=16
    (;129:2;)    local.tee 4
    (;130:0;)    i32.store offset=72
    (;131:1;)    local.get 5
    (;132:2;)    local.get 1
    (;133:0;)    i32.store offset=64
    (;134:1;)    local.get 5
    (;135:2;)    local.get 5
    (;136:2;)    i32.load offset=4
    (;137:0;)    i32.store offset=60
    (;138:1;)    local.get 5
    (;139:2;)    local.get 9
    (;140:0;)    i32.store offset=56
    (;141:1;)    local.get 5
    (;142:2;)    local.get 5
    (;143:2;)    i32.load8_u offset=28
    (;144:3;)    i32.const 1
    (;145:2;)    i32.and
    (;146:0;)    i32.store8 offset=84
    (;147:1;)    local.get 7
    (;148:2;)    local.get 2
    (;149:3;)    local.get 3
    (;150:1;)    call 66  (reflect.Value).Type
    (;151:1;)    local.tee 7
    (;152:1;)    call 57  (reflect.Type).Size
    (;153:0;)    local.set 9
    (;154:1;)    local.get 4
    (;155:1;)    call 57  (reflect.Type).Size
    (;156:0;)    local.set 1
    (;157:1;)    local.get 7
    (;158:2;)    local.get 2
    (;159:3;)    local.get 3
    (;160:1;)    call 63  (reflect.Value).isIndirect
    (;161:0;)    local.set 7
    (;162:1;)    local.get 3
    (;163:2;)    i32.const -3
    (;164:1;)    i32.and
    (;165:2;)    local.get 3
    (;166:3;)    local.get 8
    (;167:1;)    select
    (;168:0;)    local.set 3
    (;169:0;)    block
    (;170:0;)      block
    (;171:0;)        block
    (;172:1;)          local.get 1
    (;173:2;)          i32.const 4
    (;174:1;)          i32.gt_u
    (;175:0;)          br_if 0
    (;176:1;)          local.get 7
    (;177:2;)          i32.const 1
    (;178:1;)          i32.and
    (;179:0;)          br_if 0
    (;180:1;)          local.get 1
    (;181:1;)          i32.eqz
    (;182:0;)          br_if 1
    (;183:1;)          local.get 9
    (;184:2;)          i32.const 5
    (;185:1;)          i32.ge_u
    (;186:0;)          br_if 2
    (;187:1;)          i32.const 0
    (;188:2;)          local.get 6
    (;189:0;)          i32.store offset=70816
    (;190:1;)          local.get 5
    (;191:2;)          i32.const 152
    (;192:1;)          i32.add
    (;193:2;)          i32.const 0
    (;194:0;)          i32.store8
    (;195:1;)          local.get 5
    (;196:2;)          i32.const 220
    (;197:1;)          i32.add
    (;198:2;)          i32.const -1
    (;199:3;)          i32.const 32
    (;200:4;)          local.get 1
    (;201:5;)          i32.const 3
    (;202:4;)          i32.shl
    (;203:3;)          i32.sub
    (;204:2;)          i32.shr_u
    (;205:3;)          i32.const 0
    (;206:4;)          local.get 2
    (;207:5;)          local.get 10
    (;208:6;)          i32.const 3
    (;209:5;)          i32.shl
    (;210:5;)          local.tee 1
    (;211:4;)          i32.shr_u
    (;212:5;)          local.get 1
    (;213:6;)          i32.const 31
    (;214:5;)          i32.gt_u
    (;215:3;)          select
    (;216:2;)          i32.and
    (;217:2;)          local.tee 2
    (;218:0;)          i32.store
    (;219:1;)          local.get 5
    (;220:2;)          i32.const 216
    (;221:1;)          i32.add
    (;222:2;)          local.get 2
    (;223:0;)          i32.store
    (;224:1;)          local.get 5
    (;225:2;)          i64.const 0
    (;226:0;)          i64.store offset=144
    (;227:1;)          local.get 5
    (;228:2;)          i32.const 212
    (;229:1;)          i32.add
    (;230:2;)          local.get 5
    (;231:3;)          i32.const 144
    (;232:2;)          i32.add
    (;233:0;)          i32.store
    (;234:1;)          local.get 0
    (;235:2;)          local.get 3
    (;236:0;)          i32.store8 offset=8
    (;237:1;)          local.get 0
    (;238:2;)          local.get 2
    (;239:0;)          i32.store offset=4
    (;240:1;)          local.get 0
    (;241:2;)          local.get 4
    (;242:0;)          i32.store
    (;243:1;)          local.get 5
    (;244:2;)          i32.const 224
    (;245:1;)          i32.add
    (;246:0;)          global.set 0
    (;247:0;)          return
    (;248:0;)        end
    (;249:1;)        i32.const 0
    (;250:2;)        local.get 6
    (;251:0;)        i32.store offset=70816
    (;252:1;)        local.get 5
    (;253:2;)        i32.const 104
    (;254:1;)        i32.add
    (;255:2;)        i32.const 0
    (;256:0;)        i32.store8
    (;257:1;)        local.get 5
    (;258:2;)        i64.const 0
    (;259:0;)        i64.store offset=96
    (;260:1;)        local.get 5
    (;261:2;)        i32.const 192
    (;262:1;)        i32.add
    (;263:2;)        local.get 5
    (;264:3;)        i32.const 96
    (;265:2;)        i32.add
    (;266:0;)        i32.store
    (;267:1;)        local.get 0
    (;268:2;)        local.get 3
    (;269:0;)        i32.store8 offset=8
    (;270:1;)        local.get 0
    (;271:2;)        local.get 2
    (;272:3;)        local.get 10
    (;273:2;)        i32.add
    (;274:0;)        i32.store offset=4
    (;275:1;)        local.get 0
    (;276:2;)        local.get 4
    (;277:0;)        i32.store
    (;278:1;)        local.get 5
    (;279:2;)        i32.const 224
    (;280:1;)        i32.add
    (;281:0;)        global.set 0
    (;282:0;)        return
    (;283:0;)      end
    (;284:1;)      i32.const 0
    (;285:2;)      local.get 6
    (;286:0;)      i32.store offset=70816
    (;287:1;)      local.get 5
    (;288:2;)      i32.const 120
    (;289:1;)      i32.add
    (;290:2;)      i32.const 0
    (;291:0;)      i32.store8
    (;292:1;)      local.get 5
    (;293:2;)      i64.const 0
    (;294:0;)      i64.store offset=112
    (;295:1;)      local.get 5
    (;296:2;)      i32.const 196
    (;297:1;)      i32.add
    (;298:2;)      local.get 5
    (;299:3;)      i32.const 112
    (;300:2;)      i32.add
    (;301:0;)      i32.store
    (;302:1;)      local.get 0
    (;303:2;)      local.get 3
    (;304:0;)      i32.store8 offset=8
    (;305:1;)      local.get 0
    (;306:2;)      i32.const 0
    (;307:0;)      i32.store offset=4
    (;308:1;)      local.get 0
    (;309:2;)      local.get 4
    (;310:0;)      i32.store
    (;311:1;)      local.get 5
    (;312:2;)      i32.const 224
    (;313:1;)      i32.add
    (;314:0;)      global.set 0
    (;315:0;)      return
    (;316:0;)    end
    (;317:1;)    local.get 5
    (;318:2;)    i32.const 200
    (;319:1;)    i32.add
    (;320:2;)    local.get 2
    (;321:3;)    local.get 10
    (;322:2;)    i32.add
    (;323:3;)    local.get 1
    (;324:2;)    call 67  reflect.loadValue
    (;325:2;)    local.tee 3
    (;326:0;)    i32.store
    (;327:1;)    local.get 5
    (;328:2;)    i32.const 208
    (;329:1;)    i32.add
    (;330:2;)    local.get 3
    (;331:0;)    i32.store
    (;332:1;)    local.get 5
    (;333:2;)    i32.const 136
    (;334:1;)    i32.add
    (;335:2;)    i32.const 0
    (;336:0;)    i32.store8
    (;337:1;)    i32.const 0
    (;338:2;)    local.get 6
    (;339:0;)    i32.store offset=70816
    (;340:1;)    local.get 5
    (;341:2;)    i32.const 204
    (;342:1;)    i32.add
    (;343:2;)    local.get 5
    (;344:3;)    i32.const 128
    (;345:2;)    i32.add
    (;346:0;)    i32.store
    (;347:1;)    local.get 5
    (;348:2;)    i64.const 0
    (;349:0;)    i64.store offset=128
    (;350:1;)    local.get 0
    (;351:2;)    i32.const 0
    (;352:0;)    i32.store8 offset=8
    (;353:1;)    local.get 0
    (;354:2;)    local.get 3
    (;355:0;)    i32.store offset=4
    (;356:1;)    local.get 0
    (;357:2;)    local.get 4
    (;358:0;)    i32.store
    (;359:1;)    local.get 5
    (;360:2;)    i32.const 224
    (;361:1;)    i32.add
    (;362:0;)    global.set 0
    (;363:0;)  end
  )

  (func "(reflect.Value).Type" (;66;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:2;)      i32.const 8
    (;5:1;)      i32.add
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store8
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store
    (;11:1;)     local.get 0
    (;12:0;)   end
  )

  (func "reflect.loadValue" (;67;) (type 2) (param (;0;) i32 (;1;) i32) (result i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (;0:1;)      i32.const 0
    (;1:0;)      local.set 2
    (;2:1;)      i32.const 0
    (;3:0;)      local.set 3
    (;4:0;)      block
    (;5:0;)        loop
    (;6:1;)          local.get 1
    (;7:1;)          i32.eqz
    (;8:0;)          br_if 1
    (;9:1;)          i32.const 0
    (;10:2;)         local.get 0
    (;11:2;)         i32.load8_u
    (;12:3;)         local.get 3
    (;13:2;)         i32.shl
    (;14:3;)         local.get 3
    (;15:4;)         i32.const 31
    (;16:3;)         i32.gt_u
    (;17:1;)         select
    (;18:2;)         local.get 2
    (;19:1;)         i32.or
    (;20:0;)         local.set 2
    (;21:1;)         local.get 1
    (;22:2;)         i32.const -1
    (;23:1;)         i32.add
    (;24:0;)         local.set 1
    (;25:1;)         local.get 0
    (;26:2;)         i32.const 1
    (;27:1;)         i32.add
    (;28:0;)         local.set 0
    (;29:1;)         local.get 3
    (;30:2;)         i32.const 8
    (;31:1;)         i32.add
    (;32:0;)         local.set 3
    (;33:0;)         br 0
    (;34:0;)       end
    (;35:0;)     end
    (;36:1;)     local.get 2
    (;37:0;)   end
  )

  (func "(reflect.Value).Float" (;68;) (type 15) (param (;0;) i32 (;1;) i32 (;2;) i32) (result f64)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) f64)
    (local (;7;) f32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 48
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8 align=2
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=36 align=2
    (;11:1;)     local.get 3
    (;12:2;)     i64.const 0
    (;13:0;)     i64.store offset=28 align=2
    (;14:1;)     local.get 3
    (;15:2;)     i32.const 5
    (;16:0;)     i32.store offset=20
    (;17:1;)     local.get 3
    (;18:2;)     local.get 0
    (;19:0;)     i32.store offset=4
    (;20:1;)     i32.const 0
    (;21:1;)     i32.load offset=70816
    (;22:0;)     local.set 4
    (;23:1;)     i32.const 0
    (;24:2;)     local.get 3
    (;25:3;)     i32.const 16
    (;26:2;)     i32.add
    (;27:0;)     i32.store offset=70816
    (;28:1;)     local.get 3
    (;29:2;)     local.get 4
    (;30:0;)     i32.store offset=16
    (;31:1;)     local.get 3
    (;32:2;)     local.get 2
    (;33:0;)     i32.store8 offset=12
    (;34:1;)     local.get 3
    (;35:2;)     local.get 1
    (;36:0;)     i32.store offset=8
    (;37:1;)     local.get 3
    (;38:2;)     local.get 3
    (;39:3;)     i32.const 4
    (;40:2;)     i32.add
    (;41:0;)     i32.store offset=24
    (;42:0;)     block
    (;43:0;)       block
    (;44:0;)         block
    (;45:0;)           block
    (;46:1;)             local.get 0
    (;47:2;)             local.get 1
    (;48:3;)             local.get 2
    (;49:1;)             call 62  (reflect.Value).Kind
    (;50:2;)             i32.const -13
    (;51:1;)             i32.add
    (;52:1;)             local.tee 5
    (;53:2;)             i32.const 1
    (;54:1;)             i32.gt_u
    (;55:0;)             br_if 0
    (;56:1;)             local.get 5
    (;57:0;)             br_table 1 2 1
    (;58:0;)           end
    (;59:1;)           local.get 3
    (;60:2;)           i32.const 28
    (;61:1;)           i32.add
    (;62:2;)           i32.const 8
    (;63:2;)           call 59  runtime.alloc
    (;64:2;)           local.tee 1
    (;65:0;)           i32.store
    (;66:1;)           local.get 3
    (;67:2;)           i32.const 32
    (;68:1;)           i32.add
    (;69:2;)           local.get 1
    (;70:0;)           i32.store
    (;71:1;)           local.get 1
    (;72:2;)           i32.const 5
    (;73:0;)           i32.store offset=4
    (;74:1;)           local.get 1
    (;75:2;)           i32.const 66179
    (;76:0;)           i32.store
    (;77:1;)           i32.const 3045
    (;78:2;)           local.get 1
    (;79:0;)           call 54  runtime._panic
    (;80:0;)           unreachable
    (;81:0;)         end
    (;82:1;)         local.get 0
    (;83:2;)         local.get 1
    (;84:3;)         local.get 2
    (;85:1;)         call 63  (reflect.Value).isIndirect
    (;86:2;)         i32.const 1
    (;87:1;)         i32.and
    (;88:0;)         br_if 1
    (;89:1;)         i32.const 0
    (;90:2;)         local.get 4
    (;91:0;)         i32.store offset=70816
    (;92:1;)         local.get 3
    (;93:2;)         i32.const 36
    (;94:1;)         i32.add
    (;95:2;)         local.get 3
    (;96:3;)         i32.const 8
    (;97:2;)         i32.add
    (;98:2;)         local.tee 2
    (;99:0;)         i32.store
    (;100:1;)        local.get 3
    (;101:2;)        i32.const 40
    (;102:1;)        i32.add
    (;103:2;)        local.get 2
    (;104:0;)        i32.store
    (;105:1;)        local.get 3
    (;106:2;)        i32.const 48
    (;107:1;)        i32.add
    (;108:0;)        global.set 0
    (;109:1;)        local.get 1
    (;110:1;)        f32.reinterpret_i32
    (;111:1;)        f64.promote_f32
    (;112:1;)        return
    (;113:0;)      end
    (;114:1;)      local.get 0
    (;115:2;)      local.get 1
    (;116:3;)      local.get 2
    (;117:1;)      call 63  (reflect.Value).isIndirect
    (;118:0;)      drop
    (;119:1;)      i32.const 0
    (;120:2;)      local.get 4
    (;121:0;)      i32.store offset=70816
    (;122:1;)      local.get 1
    (;123:1;)      f64.load
    (;124:0;)      local.set 6
    (;125:1;)      local.get 3
    (;126:2;)      i32.const 48
    (;127:1;)      i32.add
    (;128:0;)      global.set 0
    (;129:1;)      local.get 6
    (;130:1;)      return
    (;131:0;)    end
    (;132:1;)    local.get 1
    (;133:1;)    f32.load
    (;134:0;)    local.set 7
    (;135:1;)    i32.const 0
    (;136:2;)    local.get 4
    (;137:0;)    i32.store offset=70816
    (;138:1;)    local.get 3
    (;139:2;)    i32.const 48
    (;140:1;)    i32.add
    (;141:0;)    global.set 0
    (;142:1;)    local.get 7
    (;143:1;)    f64.promote_f32
    (;144:0;)  end
  )

  (func "(reflect.Value).Index" (;69;) (type 14) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32 (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 240
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 5
    (;4:0;)      global.set 0
    (;5:1;)      local.get 5
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 5
    (;9:2;)      i64.const 90194313216
    (;10:0;)     i64.store offset=144
    (;11:1;)     local.get 5
    (;12:2;)     i64.const 0
    (;13:0;)     i64.store offset=152
    (;14:1;)     local.get 5
    (;15:2;)     i32.const 0
    (;16:0;)     i32.store offset=232
    (;17:1;)     local.get 5
    (;18:2;)     i64.const 0
    (;19:0;)     i64.store offset=224
    (;20:1;)     local.get 5
    (;21:2;)     i64.const 0
    (;22:0;)     i64.store offset=216
    (;23:1;)     local.get 5
    (;24:2;)     i64.const 0
    (;25:0;)     i64.store offset=208
    (;26:1;)     local.get 5
    (;27:2;)     i64.const 0
    (;28:0;)     i64.store offset=200
    (;29:1;)     local.get 5
    (;30:2;)     i64.const 0
    (;31:0;)     i64.store offset=192
    (;32:1;)     local.get 5
    (;33:2;)     i64.const 0
    (;34:0;)     i64.store offset=184
    (;35:1;)     local.get 5
    (;36:2;)     i64.const 0
    (;37:0;)     i64.store offset=176
    (;38:1;)     local.get 5
    (;39:2;)     i64.const 0
    (;40:0;)     i64.store offset=168
    (;41:1;)     local.get 5
    (;42:2;)     i64.const 0
    (;43:0;)     i64.store offset=160
    (;44:1;)     local.get 5
    (;45:2;)     local.get 3
    (;46:0;)     i32.store8 offset=16
    (;47:1;)     i32.const 0
    (;48:1;)     i32.load offset=70816
    (;49:0;)     local.set 6
    (;50:1;)     i32.const 0
    (;51:2;)     local.get 5
    (;52:3;)     i32.const 144
    (;53:2;)     i32.add
    (;54:0;)     i32.store offset=70816
    (;55:1;)     local.get 5
    (;56:2;)     local.get 1
    (;57:0;)     i32.store offset=8
    (;58:1;)     local.get 5
    (;59:2;)     local.get 2
    (;60:0;)     i32.store offset=12
    (;61:1;)     local.get 5
    (;62:2;)     local.get 6
    (;63:0;)     i32.store offset=144
    (;64:1;)     local.get 5
    (;65:2;)     local.get 5
    (;66:3;)     i32.const 8
    (;67:2;)     i32.add
    (;68:0;)     i32.store offset=152
    (;69:0;)     block
    (;70:0;)       block
    (;71:0;)         block
    (;72:0;)           block
    (;73:0;)             block
    (;74:1;)               local.get 1
    (;75:2;)               local.get 2
    (;76:3;)               local.get 3
    (;77:1;)               call 62  (reflect.Value).Kind
    (;78:2;)               i32.const -17
    (;79:1;)               i32.add
    (;80:1;)               local.tee 7
    (;81:2;)               i32.const 6
    (;82:1;)               i32.gt_u
    (;83:0;)               br_if 0
    (;84:0;)               block
    (;85:0;)                 block
    (;86:1;)                   local.get 7
    (;87:0;)                   br_table 1 2 2 2 2 0 3 1
    (;88:0;)                 end
    (;89:1;)                 local.get 5
    (;90:2;)                 local.get 2
    (;91:2;)                 i32.load offset=4
    (;92:2;)                 local.tee 7
    (;93:0;)                 i32.store offset=28
    (;94:1;)                 local.get 5
    (;95:2;)                 local.get 2
    (;96:2;)                 i32.load offset=8
    (;97:0;)                 i32.store offset=32
    (;98:1;)                 local.get 5
    (;99:2;)                 i32.const 156
    (;100:1;)                i32.add
    (;101:2;)                local.get 5
    (;102:3;)                i32.const 24
    (;103:2;)                i32.add
    (;104:0;)                i32.store
    (;105:1;)                local.get 5
    (;106:2;)                local.get 2
    (;107:2;)                i32.load
    (;108:2;)                local.tee 8
    (;109:0;)                i32.store offset=24
    (;110:1;)                local.get 7
    (;111:2;)                local.get 4
    (;112:1;)                i32.le_u
    (;113:0;)                br_if 3
    (;114:1;)                local.get 5
    (;115:2;)                i32.const 48
    (;116:1;)                i32.add
    (;117:2;)                i32.const 0
    (;118:0;)                i32.store8
    (;119:1;)                local.get 5
    (;120:2;)                i64.const 0
    (;121:0;)                i64.store offset=40
    (;122:1;)                local.get 5
    (;123:2;)                i32.const 160
    (;124:1;)                i32.add
    (;125:2;)                local.get 5
    (;126:3;)                i32.const 40
    (;127:2;)                i32.add
    (;128:0;)                i32.store
    (;129:1;)                local.get 1
    (;130:2;)                local.get 2
    (;131:3;)                local.get 3
    (;132:1;)                call 66  (reflect.Value).Type
    (;133:1;)                call 53  (reflect.Type).Elem
    (;134:2;)                i32.const 0
    (;135:3;)                local.get 3
    (;136:4;)                i32.const 1
    (;137:3;)                i32.or
    (;138:3;)                local.tee 3
    (;139:1;)                call 66  (reflect.Value).Type
    (;140:1;)                local.tee 1
    (;141:1;)                call 57  (reflect.Type).Size
    (;142:0;)                local.set 2
    (;143:1;)                i32.const 0
    (;144:2;)                local.get 6
    (;145:0;)                i32.store offset=70816
    (;146:1;)                local.get 5
    (;147:2;)                i32.const 164
    (;148:1;)                i32.add
    (;149:2;)                local.get 2
    (;150:3;)                local.get 4
    (;151:2;)                i32.mul
    (;152:3;)                local.get 8
    (;153:2;)                i32.add
    (;154:2;)                local.tee 2
    (;155:0;)                i32.store
    (;156:1;)                local.get 5
    (;157:2;)                i32.const 168
    (;158:1;)                i32.add
    (;159:2;)                local.get 2
    (;160:0;)                i32.store
    (;161:1;)                local.get 0
    (;162:2;)                local.get 3
    (;163:0;)                i32.store8 offset=8
    (;164:1;)                local.get 0
    (;165:2;)                local.get 2
    (;166:0;)                i32.store offset=4
    (;167:1;)                local.get 0
    (;168:2;)                local.get 1
    (;169:0;)                i32.store
    (;170:1;)                local.get 5
    (;171:2;)                i32.const 240
    (;172:1;)                i32.add
    (;173:0;)                global.set 0
    (;174:0;)                return
    (;175:0;)              end
    (;176:1;)              local.get 5
    (;177:2;)              local.get 2
    (;178:2;)              i32.load offset=4
    (;179:2;)              local.tee 3
    (;180:0;)              i32.store offset=60
    (;181:1;)              local.get 5
    (;182:2;)              i32.const 172
    (;183:1;)              i32.add
    (;184:2;)              local.get 5
    (;185:3;)              i32.const 56
    (;186:2;)              i32.add
    (;187:0;)              i32.store
    (;188:1;)              local.get 5
    (;189:2;)              local.get 2
    (;190:2;)              i32.load
    (;191:2;)              local.tee 2
    (;192:0;)              i32.store offset=56
    (;193:1;)              local.get 3
    (;194:2;)              local.get 4
    (;195:1;)              i32.le_u
    (;196:0;)              br_if 3
    (;197:1;)              local.get 5
    (;198:2;)              i32.const 72
    (;199:1;)              i32.add
    (;200:2;)              i32.const 0
    (;201:0;)              i32.store8
    (;202:1;)              local.get 5
    (;203:2;)              i32.const 184
    (;204:1;)              i32.add
    (;205:2;)              local.get 2
    (;206:3;)              local.get 4
    (;207:2;)              i32.add
    (;208:2;)              local.tee 2
    (;209:0;)              i32.store
    (;210:1;)              local.get 5
    (;211:2;)              i32.const 180
    (;212:1;)              i32.add
    (;213:2;)              local.get 2
    (;214:0;)              i32.store
    (;215:1;)              local.get 5
    (;216:2;)              i64.const 0
    (;217:0;)              i64.store offset=64
    (;218:1;)              local.get 5
    (;219:2;)              i32.const 176
    (;220:1;)              i32.add
    (;221:2;)              local.get 5
    (;222:3;)              i32.const 64
    (;223:2;)              i32.add
    (;224:0;)              i32.store
    (;225:1;)              local.get 5
    (;226:2;)              i32.const 188
    (;227:1;)              i32.add
    (;228:2;)              local.get 2
    (;229:2;)              i32.load8_u
    (;230:2;)              local.tee 2
    (;231:0;)              i32.store
    (;232:1;)              local.get 5
    (;233:2;)              i32.const 192
    (;234:1;)              i32.add
    (;235:2;)              local.get 2
    (;236:0;)              i32.store
    (;237:1;)              i32.const 0
    (;238:2;)              local.get 6
    (;239:0;)              i32.store offset=70816
    (;240:1;)              local.get 0
    (;241:2;)              i32.const 0
    (;242:0;)              i32.store8 offset=8
    (;243:1;)              local.get 0
    (;244:2;)              local.get 2
    (;245:0;)              i32.store offset=4
    (;246:1;)              local.get 0
    (;247:2;)              i32.const 16
    (;248:0;)              i32.store
    (;249:1;)              local.get 5
    (;250:2;)              i32.const 240
    (;251:1;)              i32.add
    (;252:0;)              global.set 0
    (;253:0;)              return
    (;254:0;)            end
    (;255:1;)            local.get 5
    (;256:2;)            i32.const 212
    (;257:1;)            i32.add
    (;258:2;)            i32.const 8
    (;259:2;)            call 59  runtime.alloc
    (;260:2;)            local.tee 2
    (;261:0;)            i32.store
    (;262:1;)            local.get 5
    (;263:2;)            i32.const 216
    (;264:1;)            i32.add
    (;265:2;)            local.get 2
    (;266:0;)            i32.store
    (;267:1;)            local.get 2
    (;268:2;)            i32.const 5
    (;269:0;)            i32.store offset=4
    (;270:1;)            local.get 2
    (;271:2;)            i32.const 66288
    (;272:0;)            i32.store
    (;273:1;)            i32.const 3045
    (;274:2;)            local.get 2
    (;275:0;)            call 54  runtime._panic
    (;276:0;)            unreachable
    (;277:0;)          end
    (;278:1;)          local.get 1
    (;279:2;)          local.get 2
    (;280:3;)          local.get 3
    (;281:1;)          call 66  (reflect.Value).Type
    (;282:1;)          local.tee 7
    (;283:1;)          call 53  (reflect.Type).Elem
    (;284:1;)          call 57  (reflect.Type).Size
    (;285:0;)          local.set 1
    (;286:1;)          local.get 7
    (;287:2;)          local.get 2
    (;288:3;)          local.get 3
    (;289:1;)          call 66  (reflect.Value).Type
    (;290:1;)          local.tee 7
    (;291:1;)          call 57  (reflect.Type).Size
    (;292:1;)          local.tee 8
    (;293:0;)          br_if 2
    (;294:1;)          local.get 5
    (;295:2;)          i32.const 88
    (;296:1;)          i32.add
    (;297:2;)          i32.const 0
    (;298:0;)          i32.store8
    (;299:1;)          local.get 5
    (;300:2;)          i64.const 0
    (;301:0;)          i64.store offset=80
    (;302:1;)          local.get 5
    (;303:2;)          i32.const 196
    (;304:1;)          i32.add
    (;305:2;)          local.get 5
    (;306:3;)          i32.const 80
    (;307:2;)          i32.add
    (;308:0;)          i32.store
    (;309:1;)          local.get 7
    (;310:2;)          local.get 2
    (;311:3;)          local.get 3
    (;312:1;)          call 66  (reflect.Value).Type
    (;313:1;)          call 53  (reflect.Type).Elem
    (;314:0;)          local.set 2
    (;315:1;)          i32.const 0
    (;316:2;)          local.get 6
    (;317:0;)          i32.store offset=70816
    (;318:1;)          local.get 0
    (;319:2;)          local.get 3
    (;320:0;)          i32.store8 offset=8
    (;321:1;)          local.get 0
    (;322:2;)          i32.const 0
    (;323:0;)          i32.store offset=4
    (;324:1;)          local.get 0
    (;325:2;)          local.get 2
    (;326:0;)          i32.store
    (;327:1;)          local.get 5
    (;328:2;)          i32.const 240
    (;329:1;)          i32.add
    (;330:0;)          global.set 0
    (;331:0;)          return
    (;332:0;)        end
    (;333:1;)        i32.const 34
    (;334:2;)        i32.const 66232
    (;335:0;)        call 54  runtime._panic
    (;336:0;)        unreachable
    (;337:0;)      end
    (;338:1;)      i32.const 34
    (;339:2;)      i32.const 66280
    (;340:0;)      call 54  runtime._panic
    (;341:0;)      unreachable
    (;342:0;)    end
    (;343:0;)    block
    (;344:0;)      block
    (;345:1;)        local.get 1
    (;346:2;)        i32.const 4
    (;347:1;)        i32.gt_u
    (;348:0;)        br_if 0
    (;349:1;)        local.get 8
    (;350:2;)        i32.const 4
    (;351:1;)        i32.gt_u
    (;352:0;)        br_if 1
    (;353:1;)        local.get 5
    (;354:2;)        i32.const 136
    (;355:1;)        i32.add
    (;356:2;)        i32.const 0
    (;357:0;)        i32.store8
    (;358:1;)        local.get 5
    (;359:2;)        i64.const 0
    (;360:0;)        i64.store offset=128
    (;361:1;)        local.get 5
    (;362:2;)        i32.const 200
    (;363:1;)        i32.add
    (;364:2;)        local.get 5
    (;365:3;)        i32.const 128
    (;366:2;)        i32.add
    (;367:0;)        i32.store
    (;368:1;)        local.get 7
    (;369:2;)        local.get 2
    (;370:3;)        local.get 3
    (;371:1;)        call 66  (reflect.Value).Type
    (;372:1;)        call 53  (reflect.Type).Elem
    (;373:0;)        local.set 7
    (;374:1;)        i32.const 0
    (;375:2;)        local.get 6
    (;376:0;)        i32.store offset=70816
    (;377:1;)        local.get 5
    (;378:2;)        i32.const 204
    (;379:1;)        i32.add
    (;380:2;)        i32.const -1
    (;381:3;)        i32.const 32
    (;382:4;)        local.get 1
    (;383:5;)        i32.const 3
    (;384:4;)        i32.shl
    (;385:3;)        i32.sub
    (;386:2;)        i32.shr_u
    (;387:3;)        i32.const 0
    (;388:4;)        local.get 1
    (;389:2;)        select
    (;390:3;)        i32.const 0
    (;391:4;)        local.get 2
    (;392:5;)        local.get 1
    (;393:6;)        local.get 4
    (;394:5;)        i32.mul
    (;395:6;)        i32.const 3
    (;396:5;)        i32.shl
    (;397:5;)        local.tee 1
    (;398:4;)        i32.shr_u
    (;399:5;)        local.get 1
    (;400:6;)        i32.const 31
    (;401:5;)        i32.gt_u
    (;402:3;)        select
    (;403:2;)        i32.and
    (;404:2;)        local.tee 2
    (;405:0;)        i32.store
    (;406:1;)        local.get 5
    (;407:2;)        i32.const 208
    (;408:1;)        i32.add
    (;409:2;)        local.get 2
    (;410:0;)        i32.store
    (;411:1;)        local.get 0
    (;412:2;)        local.get 3
    (;413:0;)        i32.store8 offset=8
    (;414:1;)        local.get 0
    (;415:2;)        local.get 2
    (;416:0;)        i32.store offset=4
    (;417:1;)        local.get 0
    (;418:2;)        local.get 7
    (;419:0;)        i32.store
    (;420:1;)        local.get 5
    (;421:2;)        i32.const 240
    (;422:1;)        i32.add
    (;423:0;)        global.set 0
    (;424:0;)        return
    (;425:0;)      end
    (;426:1;)      local.get 5
    (;427:2;)      i32.const 104
    (;428:1;)      i32.add
    (;429:2;)      i32.const 0
    (;430:0;)      i32.store8
    (;431:1;)      local.get 5
    (;432:2;)      i64.const 0
    (;433:0;)      i64.store offset=96
    (;434:1;)      local.get 5
    (;435:2;)      i32.const 220
    (;436:1;)      i32.add
    (;437:2;)      local.get 5
    (;438:3;)      i32.const 96
    (;439:2;)      i32.add
    (;440:0;)      i32.store
    (;441:1;)      local.get 7
    (;442:2;)      local.get 2
    (;443:3;)      local.get 3
    (;444:1;)      call 66  (reflect.Value).Type
    (;445:1;)      call 53  (reflect.Type).Elem
    (;446:0;)      local.set 7
    (;447:1;)      i32.const 0
    (;448:2;)      local.get 6
    (;449:0;)      i32.store offset=70816
    (;450:1;)      local.get 0
    (;451:2;)      local.get 3
    (;452:0;)      i32.store8 offset=8
    (;453:1;)      local.get 0
    (;454:2;)      local.get 2
    (;455:3;)      local.get 1
    (;456:4;)      local.get 4
    (;457:3;)      i32.mul
    (;458:2;)      i32.add
    (;459:0;)      i32.store offset=4
    (;460:1;)      local.get 0
    (;461:2;)      local.get 7
    (;462:0;)      i32.store
    (;463:1;)      local.get 5
    (;464:2;)      i32.const 240
    (;465:1;)      i32.add
    (;466:0;)      global.set 0
    (;467:0;)      return
    (;468:0;)    end
    (;469:1;)    local.get 5
    (;470:2;)    i32.const 120
    (;471:1;)    i32.add
    (;472:2;)    i32.const 0
    (;473:0;)    i32.store8
    (;474:1;)    local.get 5
    (;475:2;)    i64.const 0
    (;476:0;)    i64.store offset=112
    (;477:1;)    local.get 5
    (;478:2;)    i32.const 224
    (;479:1;)    i32.add
    (;480:2;)    local.get 5
    (;481:3;)    i32.const 112
    (;482:2;)    i32.add
    (;483:0;)    i32.store
    (;484:1;)    local.get 7
    (;485:2;)    local.get 2
    (;486:3;)    local.get 3
    (;487:1;)    call 66  (reflect.Value).Type
    (;488:1;)    call 53  (reflect.Type).Elem
    (;489:0;)    local.set 7
    (;490:1;)    local.get 5
    (;491:2;)    i32.const 228
    (;492:1;)    i32.add
    (;493:2;)    local.get 2
    (;494:3;)    local.get 1
    (;495:4;)    local.get 4
    (;496:3;)    i32.mul
    (;497:2;)    i32.add
    (;498:3;)    local.get 1
    (;499:2;)    call 67  reflect.loadValue
    (;500:2;)    local.tee 2
    (;501:0;)    i32.store
    (;502:1;)    local.get 5
    (;503:2;)    i32.const 232
    (;504:1;)    i32.add
    (;505:2;)    local.get 2
    (;506:0;)    i32.store
    (;507:1;)    i32.const 0
    (;508:2;)    local.get 6
    (;509:0;)    i32.store offset=70816
    (;510:1;)    local.get 0
    (;511:2;)    local.get 3
    (;512:0;)    i32.store8 offset=8
    (;513:1;)    local.get 0
    (;514:2;)    local.get 2
    (;515:0;)    i32.store offset=4
    (;516:1;)    local.get 0
    (;517:2;)    local.get 7
    (;518:0;)    i32.store
    (;519:1;)    local.get 5
    (;520:2;)    i32.const 240
    (;521:1;)    i32.add
    (;522:0;)    global.set 0
    (;523:0;)  end
  )

  (func "(reflect.Value).Int" (;70;) (type 16) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i64)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i64)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 48
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=36 align=2
    (;11:1;)     local.get 3
    (;12:2;)     i32.const 3
    (;13:0;)     i32.store offset=28
    (;14:1;)     local.get 3
    (;15:2;)     local.get 2
    (;16:0;)     i32.store8 offset=16
    (;17:1;)     i32.const 0
    (;18:1;)     i32.load offset=70816
    (;19:0;)     local.set 4
    (;20:1;)     i32.const 0
    (;21:2;)     local.get 3
    (;22:3;)     i32.const 24
    (;23:2;)     i32.add
    (;24:0;)     i32.store offset=70816
    (;25:1;)     local.get 3
    (;26:2;)     local.get 4
    (;27:0;)     i32.store offset=24
    (;28:1;)     local.get 3
    (;29:2;)     local.get 1
    (;30:0;)     i32.store offset=12
    (;31:1;)     local.get 3
    (;32:2;)     local.get 0
    (;33:0;)     i32.store offset=8
    (;34:1;)     local.get 3
    (;35:2;)     local.get 3
    (;36:3;)     i32.const 8
    (;37:2;)     i32.add
    (;38:0;)     i32.store offset=32
    (;39:0;)     block
    (;40:0;)       block
    (;41:0;)         block
    (;42:0;)           block
    (;43:0;)             block
    (;44:0;)               block
    (;45:0;)                 block
    (;46:0;)                   block
    (;47:0;)                     block
    (;48:0;)                       block
    (;49:1;)                         local.get 0
    (;50:2;)                         local.get 1
    (;51:3;)                         local.get 2
    (;52:1;)                         call 62  (reflect.Value).Kind
    (;53:2;)                         i32.const -2
    (;54:1;)                         i32.add
    (;55:1;)                         local.tee 5
    (;56:2;)                         i32.const 4
    (;57:1;)                         i32.gt_u
    (;58:0;)                         br_if 0
    (;59:1;)                         local.get 5
    (;60:0;)                         br_table 1 2 3 4 5 1
    (;61:0;)                       end
    (;62:1;)                       local.get 3
    (;63:2;)                       i32.const 36
    (;64:1;)                       i32.add
    (;65:2;)                       i32.const 8
    (;66:2;)                       call 59  runtime.alloc
    (;67:2;)                       local.tee 1
    (;68:0;)                       i32.store
    (;69:1;)                       local.get 3
    (;70:2;)                       i32.const 40
    (;71:1;)                       i32.add
    (;72:2;)                       local.get 1
    (;73:0;)                       i32.store
    (;74:1;)                       local.get 1
    (;75:2;)                       i32.const 3
    (;76:0;)                       i32.store offset=4
    (;77:1;)                       local.get 1
    (;78:2;)                       i32.const 66293
    (;79:0;)                       i32.store
    (;80:1;)                       i32.const 3045
    (;81:2;)                       local.get 1
    (;82:0;)                       call 54  runtime._panic
    (;83:0;)                       unreachable
    (;84:0;)                     end
    (;85:1;)                     local.get 0
    (;86:2;)                     local.get 1
    (;87:3;)                     local.get 2
    (;88:1;)                     call 63  (reflect.Value).isIndirect
    (;89:2;)                     i32.const 1
    (;90:1;)                     i32.and
    (;91:0;)                     br_if 4
    (;92:1;)                     i32.const 0
    (;93:2;)                     local.get 4
    (;94:0;)                     i32.store offset=70816
    (;95:1;)                     local.get 3
    (;96:2;)                     i32.const 48
    (;97:1;)                     i32.add
    (;98:0;)                     global.set 0
    (;99:1;)                     local.get 1
    (;100:1;)                    i64.extend_i32_s
    (;101:1;)                    return
    (;102:0;)                  end
    (;103:1;)                  local.get 0
    (;104:2;)                  local.get 1
    (;105:3;)                  local.get 2
    (;106:1;)                  call 63  (reflect.Value).isIndirect
    (;107:2;)                  i32.const 1
    (;108:1;)                  i32.and
    (;109:0;)                  br_if 4
    (;110:1;)                  i32.const 0
    (;111:2;)                  local.get 4
    (;112:0;)                  i32.store offset=70816
    (;113:1;)                  local.get 3
    (;114:2;)                  i32.const 48
    (;115:1;)                  i32.add
    (;116:0;)                  global.set 0
    (;117:1;)                  local.get 1
    (;118:1;)                  i64.extend_i32_u
    (;119:2;)                  i64.const 56
    (;120:1;)                  i64.shl
    (;121:2;)                  i64.const 56
    (;122:1;)                  i64.shr_s
    (;123:1;)                  return
    (;124:0;)                end
    (;125:1;)                local.get 0
    (;126:2;)                local.get 1
    (;127:3;)                local.get 2
    (;128:1;)                call 63  (reflect.Value).isIndirect
    (;129:2;)                i32.const 1
    (;130:1;)                i32.and
    (;131:0;)                br_if 4
    (;132:1;)                i32.const 0
    (;133:2;)                local.get 4
    (;134:0;)                i32.store offset=70816
    (;135:1;)                local.get 3
    (;136:2;)                i32.const 48
    (;137:1;)                i32.add
    (;138:0;)                global.set 0
    (;139:1;)                local.get 1
    (;140:1;)                i64.extend_i32_u
    (;141:2;)                i64.const 48
    (;142:1;)                i64.shl
    (;143:2;)                i64.const 48
    (;144:1;)                i64.shr_s
    (;145:1;)                return
    (;146:0;)              end
    (;147:1;)              local.get 0
    (;148:2;)              local.get 1
    (;149:3;)              local.get 2
    (;150:1;)              call 63  (reflect.Value).isIndirect
    (;151:2;)              i32.const 1
    (;152:1;)              i32.and
    (;153:0;)              br_if 4
    (;154:1;)              i32.const 0
    (;155:2;)              local.get 4
    (;156:0;)              i32.store offset=70816
    (;157:1;)              local.get 3
    (;158:2;)              i32.const 48
    (;159:1;)              i32.add
    (;160:0;)              global.set 0
    (;161:1;)              local.get 1
    (;162:1;)              i64.extend_i32_s
    (;163:1;)              return
    (;164:0;)            end
    (;165:1;)            local.get 0
    (;166:2;)            local.get 1
    (;167:3;)            local.get 2
    (;168:1;)            call 63  (reflect.Value).isIndirect
    (;169:0;)            drop
    (;170:1;)            i32.const 0
    (;171:2;)            local.get 4
    (;172:0;)            i32.store offset=70816
    (;173:1;)            local.get 1
    (;174:1;)            i64.load
    (;175:0;)            local.set 6
    (;176:1;)            local.get 3
    (;177:2;)            i32.const 48
    (;178:1;)            i32.add
    (;179:0;)            global.set 0
    (;180:1;)            local.get 6
    (;181:1;)            return
    (;182:0;)          end
    (;183:1;)          local.get 1
    (;184:1;)          i64.load32_s
    (;185:0;)          local.set 6
    (;186:1;)          i32.const 0
    (;187:2;)          local.get 4
    (;188:0;)          i32.store offset=70816
    (;189:1;)          local.get 3
    (;190:2;)          i32.const 48
    (;191:1;)          i32.add
    (;192:0;)          global.set 0
    (;193:1;)          local.get 6
    (;194:1;)          return
    (;195:0;)        end
    (;196:1;)        local.get 1
    (;197:1;)        i64.load8_s
    (;198:0;)        local.set 6
    (;199:1;)        i32.const 0
    (;200:2;)        local.get 4
    (;201:0;)        i32.store offset=70816
    (;202:1;)        local.get 3
    (;203:2;)        i32.const 48
    (;204:1;)        i32.add
    (;205:0;)        global.set 0
    (;206:1;)        local.get 6
    (;207:1;)        return
    (;208:0;)      end
    (;209:1;)      local.get 1
    (;210:1;)      i64.load16_s
    (;211:0;)      local.set 6
    (;212:1;)      i32.const 0
    (;213:2;)      local.get 4
    (;214:0;)      i32.store offset=70816
    (;215:1;)      local.get 3
    (;216:2;)      i32.const 48
    (;217:1;)      i32.add
    (;218:0;)      global.set 0
    (;219:1;)      local.get 6
    (;220:1;)      return
    (;221:0;)    end
    (;222:1;)    local.get 1
    (;223:1;)    i64.load32_s
    (;224:0;)    local.set 6
    (;225:1;)    i32.const 0
    (;226:2;)    local.get 4
    (;227:0;)    i32.store offset=70816
    (;228:1;)    local.get 3
    (;229:2;)    i32.const 48
    (;230:1;)    i32.add
    (;231:0;)    global.set 0
    (;232:1;)    local.get 6
    (;233:0;)  end
  )

  (func "(reflect.Value).Pointer" (;71;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 48
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=36 align=2
    (;11:1;)     local.get 3
    (;12:2;)     i32.const 3
    (;13:0;)     i32.store offset=28
    (;14:1;)     local.get 3
    (;15:2;)     local.get 2
    (;16:0;)     i32.store8 offset=16
    (;17:1;)     i32.const 0
    (;18:1;)     i32.load offset=70816
    (;19:0;)     local.set 4
    (;20:1;)     i32.const 0
    (;21:2;)     local.get 3
    (;22:3;)     i32.const 24
    (;23:2;)     i32.add
    (;24:0;)     i32.store offset=70816
    (;25:1;)     local.get 3
    (;26:2;)     local.get 4
    (;27:0;)     i32.store offset=24
    (;28:1;)     local.get 3
    (;29:2;)     local.get 1
    (;30:0;)     i32.store offset=12
    (;31:1;)     local.get 3
    (;32:2;)     local.get 0
    (;33:0;)     i32.store offset=8
    (;34:1;)     local.get 3
    (;35:2;)     local.get 3
    (;36:3;)     i32.const 8
    (;37:2;)     i32.add
    (;38:0;)     i32.store offset=32
    (;39:0;)     block
    (;40:0;)       block
    (;41:0;)         block
    (;42:0;)           block
    (;43:0;)             block
    (;44:0;)               block
    (;45:1;)                 local.get 0
    (;46:2;)                 local.get 1
    (;47:3;)                 local.get 2
    (;48:1;)                 call 62  (reflect.Value).Kind
    (;49:1;)                 local.tee 5
    (;50:2;)                 i32.const 25
    (;51:1;)                 i32.gt_u
    (;52:0;)                 br_if 0
    (;53:1;)                 i32.const 1
    (;54:2;)                 local.get 5
    (;55:1;)                 i32.shl
    (;56:2;)                 i32.const 36438016
    (;57:1;)                 i32.and
    (;58:0;)                 br_if 1
    (;59:1;)                 local.get 5
    (;60:2;)                 i32.const 22
    (;61:1;)                 i32.eq
    (;62:0;)                 br_if 2
    (;63:1;)                 local.get 5
    (;64:2;)                 i32.const 24
    (;65:1;)                 i32.eq
    (;66:0;)                 br_if 3
    (;67:0;)               end
    (;68:1;)               local.get 3
    (;69:2;)               i32.const 36
    (;70:1;)               i32.add
    (;71:2;)               i32.const 8
    (;72:2;)               call 59  runtime.alloc
    (;73:2;)               local.tee 1
    (;74:0;)               i32.store
    (;75:1;)               local.get 3
    (;76:2;)               i32.const 40
    (;77:1;)               i32.add
    (;78:2;)               local.get 1
    (;79:0;)               i32.store
    (;80:1;)               local.get 1
    (;81:2;)               i32.const 7
    (;82:0;)               i32.store offset=4
    (;83:1;)               local.get 1
    (;84:2;)               i32.const 66352
    (;85:0;)               i32.store
    (;86:1;)               i32.const 3045
    (;87:2;)               local.get 1
    (;88:0;)               call 54  runtime._panic
    (;89:0;)               unreachable
    (;90:0;)             end
    (;91:1;)             local.get 0
    (;92:2;)             local.get 1
    (;93:3;)             local.get 2
    (;94:1;)             call 63  (reflect.Value).isIndirect
    (;95:2;)             i32.const 1
    (;96:1;)             i32.and
    (;97:0;)             br_if 2
    (;98:1;)             i32.const 0
    (;99:2;)             local.get 4
    (;100:0;)            i32.store offset=70816
    (;101:1;)            local.get 3
    (;102:2;)            i32.const 48
    (;103:1;)            i32.add
    (;104:0;)            global.set 0
    (;105:1;)            local.get 1
    (;106:1;)            return
    (;107:0;)          end
    (;108:1;)          local.get 1
    (;109:1;)          i32.eqz
    (;110:0;)          br_if 2
    (;111:1;)          local.get 1
    (;112:1;)          i32.load
    (;113:0;)          local.set 1
    (;114:1;)          i32.const 0
    (;115:2;)          local.get 4
    (;116:0;)          i32.store offset=70816
    (;117:1;)          local.get 3
    (;118:2;)          i32.const 48
    (;119:1;)          i32.add
    (;120:0;)          global.set 0
    (;121:1;)          local.get 1
    (;122:1;)          return
    (;123:0;)        end
    (;124:1;)        i32.const 34
    (;125:2;)        i32.const 66344
    (;126:0;)        call 54  runtime._panic
    (;127:0;)        unreachable
    (;128:0;)      end
    (;129:1;)      local.get 1
    (;130:1;)      i32.load
    (;131:0;)      local.set 1
    (;132:1;)      i32.const 0
    (;133:2;)      local.get 4
    (;134:0;)      i32.store offset=70816
    (;135:1;)      local.get 3
    (;136:2;)      i32.const 48
    (;137:1;)      i32.add
    (;138:0;)      global.set 0
    (;139:1;)      local.get 1
    (;140:1;)      return
    (;141:0;)    end
    (;142:0;)    call 72  runtime.nilPanic
    (;143:0;)    unreachable
    (;144:0;)  end
  )

  (func "runtime.nilPanic" (;72;) (type 6)
    (;0:1;)      i32.const 67216
    (;1:2;)      i32.const 23
    (;2:0;)      call 106  runtime.runtimePanic
    (;3:0;)      unreachable
    (;4:0;)    end
  )

  (func "(reflect.Value).String" (;73;) (type 3) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32)
    (local (;4;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 4
    (;4:0;)      global.set 0
    (;5:1;)      local.get 4
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store
    (;8:1;)      local.get 4
    (;9:2;)      local.get 2
    (;10:0;)     i32.store offset=4
    (;11:1;)     local.get 4
    (;12:2;)     local.get 3
    (;13:0;)     i32.store8 offset=8
    (;14:1;)     local.get 4
    (;15:2;)     local.get 1
    (;16:0;)     i32.store
    (;17:0;)     block
    (;18:1;)       local.get 1
    (;19:2;)       local.get 2
    (;20:3;)       local.get 3
    (;21:1;)       call 62  (reflect.Value).Kind
    (;22:2;)       i32.const 17
    (;23:1;)       i32.eq
    (;24:0;)       br_if 0
    (;25:1;)       local.get 0
    (;26:2;)       i32.const 3
    (;27:0;)       i32.store offset=4
    (;28:1;)       local.get 0
    (;29:2;)       i32.const 66359
    (;30:0;)       i32.store
    (;31:1;)       local.get 4
    (;32:2;)       i32.const 16
    (;33:1;)       i32.add
    (;34:0;)       global.set 0
    (;35:0;)       return
    (;36:0;)     end
    (;37:1;)     local.get 0
    (;38:2;)     local.get 2
    (;39:2;)     i64.load align=2
    (;40:0;)     i64.store align=2
    (;41:1;)     local.get 4
    (;42:2;)     i32.const 16
    (;43:1;)     i32.add
    (;44:0;)     global.set 0
    (;45:0;)   end
  )

  (func "(reflect.Value).Uint" (;74;) (type 16) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i64)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i64)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 48
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=8
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=36 align=2
    (;11:1;)     local.get 3
    (;12:2;)     i32.const 3
    (;13:0;)     i32.store offset=28
    (;14:1;)     local.get 3
    (;15:2;)     local.get 2
    (;16:0;)     i32.store8 offset=16
    (;17:1;)     i32.const 0
    (;18:1;)     i32.load offset=70816
    (;19:0;)     local.set 4
    (;20:1;)     i32.const 0
    (;21:2;)     local.get 3
    (;22:3;)     i32.const 24
    (;23:2;)     i32.add
    (;24:0;)     i32.store offset=70816
    (;25:1;)     local.get 3
    (;26:2;)     local.get 4
    (;27:0;)     i32.store offset=24
    (;28:1;)     local.get 3
    (;29:2;)     local.get 1
    (;30:0;)     i32.store offset=12
    (;31:1;)     local.get 3
    (;32:2;)     local.get 0
    (;33:0;)     i32.store offset=8
    (;34:1;)     local.get 3
    (;35:2;)     local.get 3
    (;36:3;)     i32.const 8
    (;37:2;)     i32.add
    (;38:0;)     i32.store offset=32
    (;39:0;)     block
    (;40:0;)       block
    (;41:0;)         block
    (;42:0;)           block
    (;43:0;)             block
    (;44:0;)               block
    (;45:0;)                 block
    (;46:0;)                   block
    (;47:0;)                     block
    (;48:0;)                       block
    (;49:0;)                         block
    (;50:0;)                           block
    (;51:1;)                             local.get 0
    (;52:2;)                             local.get 1
    (;53:3;)                             local.get 2
    (;54:1;)                             call 62  (reflect.Value).Kind
    (;55:2;)                             i32.const -7
    (;56:1;)                             i32.add
    (;57:1;)                             local.tee 5
    (;58:2;)                             i32.const 5
    (;59:1;)                             i32.gt_u
    (;60:0;)                             br_if 0
    (;61:1;)                             local.get 5
    (;62:0;)                             br_table 4 2 3 5 6 1 4
    (;63:0;)                           end
    (;64:1;)                           local.get 3
    (;65:2;)                           i32.const 36
    (;66:1;)                           i32.add
    (;67:2;)                           i32.const 8
    (;68:2;)                           call 59  runtime.alloc
    (;69:2;)                           local.tee 1
    (;70:0;)                           i32.store
    (;71:1;)                           local.get 3
    (;72:2;)                           i32.const 40
    (;73:1;)                           i32.add
    (;74:2;)                           local.get 1
    (;75:0;)                           i32.store
    (;76:1;)                           local.get 1
    (;77:2;)                           i32.const 4
    (;78:0;)                           i32.store offset=4
    (;79:1;)                           local.get 1
    (;80:2;)                           i32.const 66362
    (;81:0;)                           i32.store
    (;82:1;)                           i32.const 3045
    (;83:2;)                           local.get 1
    (;84:0;)                           call 54  runtime._panic
    (;85:0;)                           unreachable
    (;86:0;)                         end
    (;87:1;)                         local.get 0
    (;88:2;)                         local.get 1
    (;89:3;)                         local.get 2
    (;90:1;)                         call 63  (reflect.Value).isIndirect
    (;91:2;)                         i32.const 1
    (;92:1;)                         i32.and
    (;93:0;)                         br_if 5
    (;94:1;)                         i32.const 0
    (;95:2;)                         local.get 4
    (;96:0;)                         i32.store offset=70816
    (;97:1;)                         local.get 3
    (;98:2;)                         i32.const 48
    (;99:1;)                         i32.add
    (;100:0;)                        global.set 0
    (;101:1;)                        local.get 1
    (;102:1;)                        i64.extend_i32_u
    (;103:1;)                        return
    (;104:0;)                      end
    (;105:1;)                      local.get 0
    (;106:2;)                      local.get 1
    (;107:3;)                      local.get 2
    (;108:1;)                      call 63  (reflect.Value).isIndirect
    (;109:2;)                      i32.const 1
    (;110:1;)                      i32.and
    (;111:0;)                      br_if 5
    (;112:1;)                      i32.const 0
    (;113:2;)                      local.get 4
    (;114:0;)                      i32.store offset=70816
    (;115:1;)                      local.get 3
    (;116:2;)                      i32.const 48
    (;117:1;)                      i32.add
    (;118:0;)                      global.set 0
    (;119:1;)                      local.get 1
    (;120:1;)                      i64.extend_i32_u
    (;121:1;)                      return
    (;122:0;)                    end
    (;123:1;)                    local.get 0
    (;124:2;)                    local.get 1
    (;125:3;)                    local.get 2
    (;126:1;)                    call 63  (reflect.Value).isIndirect
    (;127:2;)                    i32.const 1
    (;128:1;)                    i32.and
    (;129:0;)                    br_if 5
    (;130:1;)                    i32.const 0
    (;131:2;)                    local.get 4
    (;132:0;)                    i32.store offset=70816
    (;133:1;)                    local.get 3
    (;134:2;)                    i32.const 48
    (;135:1;)                    i32.add
    (;136:0;)                    global.set 0
    (;137:1;)                    local.get 1
    (;138:1;)                    i64.extend_i32_u
    (;139:1;)                    return
    (;140:0;)                  end
    (;141:1;)                  local.get 0
    (;142:2;)                  local.get 1
    (;143:3;)                  local.get 2
    (;144:1;)                  call 63  (reflect.Value).isIndirect
    (;145:2;)                  i32.const 1
    (;146:1;)                  i32.and
    (;147:0;)                  br_if 5
    (;148:1;)                  i32.const 0
    (;149:2;)                  local.get 4
    (;150:0;)                  i32.store offset=70816
    (;151:1;)                  local.get 3
    (;152:2;)                  i32.const 48
    (;153:1;)                  i32.add
    (;154:0;)                  global.set 0
    (;155:1;)                  local.get 1
    (;156:1;)                  i64.extend_i32_u
    (;157:1;)                  return
    (;158:0;)                end
    (;159:1;)                local.get 0
    (;160:2;)                local.get 1
    (;161:3;)                local.get 2
    (;162:1;)                call 63  (reflect.Value).isIndirect
    (;163:2;)                i32.const 1
    (;164:1;)                i32.and
    (;165:0;)                br_if 5
    (;166:1;)                i32.const 0
    (;167:2;)                local.get 4
    (;168:0;)                i32.store offset=70816
    (;169:1;)                local.get 3
    (;170:2;)                i32.const 48
    (;171:1;)                i32.add
    (;172:0;)                global.set 0
    (;173:1;)                local.get 1
    (;174:1;)                i64.extend_i32_u
    (;175:1;)                return
    (;176:0;)              end
    (;177:1;)              local.get 0
    (;178:2;)              local.get 1
    (;179:3;)              local.get 2
    (;180:1;)              call 63  (reflect.Value).isIndirect
    (;181:0;)              drop
    (;182:1;)              i32.const 0
    (;183:2;)              local.get 4
    (;184:0;)              i32.store offset=70816
    (;185:1;)              local.get 1
    (;186:1;)              i64.load
    (;187:0;)              local.set 6
    (;188:1;)              local.get 3
    (;189:2;)              i32.const 48
    (;190:1;)              i32.add
    (;191:0;)              global.set 0
    (;192:1;)              local.get 6
    (;193:1;)              return
    (;194:0;)            end
    (;195:1;)            local.get 1
    (;196:1;)            i64.load32_u
    (;197:0;)            local.set 6
    (;198:1;)            i32.const 0
    (;199:2;)            local.get 4
    (;200:0;)            i32.store offset=70816
    (;201:1;)            local.get 3
    (;202:2;)            i32.const 48
    (;203:1;)            i32.add
    (;204:0;)            global.set 0
    (;205:1;)            local.get 6
    (;206:1;)            return
    (;207:0;)          end
    (;208:1;)          local.get 1
    (;209:1;)          i64.load8_u
    (;210:0;)          local.set 6
    (;211:1;)          i32.const 0
    (;212:2;)          local.get 4
    (;213:0;)          i32.store offset=70816
    (;214:1;)          local.get 3
    (;215:2;)          i32.const 48
    (;216:1;)          i32.add
    (;217:0;)          global.set 0
    (;218:1;)          local.get 6
    (;219:1;)          return
    (;220:0;)        end
    (;221:1;)        local.get 1
    (;222:1;)        i64.load16_u
    (;223:0;)        local.set 6
    (;224:1;)        i32.const 0
    (;225:2;)        local.get 4
    (;226:0;)        i32.store offset=70816
    (;227:1;)        local.get 3
    (;228:2;)        i32.const 48
    (;229:1;)        i32.add
    (;230:0;)        global.set 0
    (;231:1;)        local.get 6
    (;232:1;)        return
    (;233:0;)      end
    (;234:1;)      local.get 1
    (;235:1;)      i64.load32_u
    (;236:0;)      local.set 6
    (;237:1;)      i32.const 0
    (;238:2;)      local.get 4
    (;239:0;)      i32.store offset=70816
    (;240:1;)      local.get 3
    (;241:2;)      i32.const 48
    (;242:1;)      i32.add
    (;243:0;)      global.set 0
    (;244:1;)      local.get 6
    (;245:1;)      return
    (;246:0;)    end
    (;247:1;)    local.get 1
    (;248:1;)    i64.load32_u
    (;249:0;)    local.set 6
    (;250:1;)    i32.const 0
    (;251:2;)    local.get 4
    (;252:0;)    i32.store offset=70816
    (;253:1;)    local.get 3
    (;254:2;)    i32.const 48
    (;255:1;)    i32.add
    (;256:0;)    global.set 0
    (;257:1;)    local.get 6
    (;258:0;)  end
  )

  (func "reflect.ValueOf" (;75;) (type 1) (param (;0;) i32 (;1;) i32 (;2;) i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:2;)      i32.const 16
    (;5:1;)      i32.add
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store8
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=8
    (;11:1;)     local.get 0
    (;12:2;)     local.get 2
    (;13:0;)     i32.store offset=4
    (;14:1;)     local.get 0
    (;15:2;)     local.get 1
    (;16:0;)     i32.store
    (;17:0;)   end
  )

  (func "strconv.FormatInt" (;76;) (type 12) (param (;0;) i32 (;1;) i64)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i64)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i64)
    (local (;10;) i32)
    (local (;11;) i32)
    (local (;12;) i32)
    (local (;13;) i32)
    (local (;14;) i32)
    (local (;15;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=28
    (;8:1;)      local.get 2
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=20 align=2
    (;11:1;)     local.get 2
    (;12:2;)     i64.const 4
    (;13:0;)     i64.store offset=12 align=2
    (;14:1;)     i32.const 0
    (;15:1;)     i32.load offset=70816
    (;16:0;)     local.set 3
    (;17:1;)     i32.const 0
    (;18:2;)     local.get 2
    (;19:3;)     i32.const 8
    (;20:2;)     i32.add
    (;21:0;)     i32.store offset=70816
    (;22:1;)     local.get 2
    (;23:2;)     local.get 3
    (;24:0;)     i32.store offset=8
    (;25:0;)     block
    (;26:0;)       block
    (;27:0;)         block
    (;28:1;)           local.get 1
    (;29:2;)           i64.const 99
    (;30:1;)           i64.le_u
    (;31:0;)           br_if 0
    (;32:1;)           local.get 2
    (;33:2;)           i32.const 20
    (;34:1;)           i32.add
    (;35:2;)           i32.const 65
    (;36:2;)           call 59  runtime.alloc
    (;37:2;)           local.tee 4
    (;38:0;)           i32.store
    (;39:1;)           local.get 1
    (;40:2;)           local.get 1
    (;41:3;)           i64.const 63
    (;42:2;)           i64.shr_s
    (;43:2;)           local.tee 5
    (;44:1;)           i64.add
    (;45:2;)           local.get 5
    (;46:1;)           i64.xor
    (;47:0;)           local.set 5
    (;48:1;)           local.get 4
    (;49:2;)           i32.const -2
    (;50:1;)           i32.add
    (;51:0;)           local.set 6
    (;52:1;)           i32.const 65
    (;53:0;)           local.set 7
    (;54:0;)           loop
    (;55:1;)             local.get 5
    (;56:2;)             i64.const 1000000000
    (;57:1;)             i64.lt_u
    (;58:0;)             br_if 2
    (;59:1;)             local.get 6
    (;60:2;)             local.get 7
    (;61:1;)             i32.add
    (;62:0;)             local.set 8
    (;63:1;)             local.get 5
    (;64:2;)             i64.const 1000000000
    (;65:1;)             i64.div_u
    (;66:1;)             local.tee 9
    (;67:2;)             i64.const -1000000000
    (;68:1;)             i64.mul
    (;69:2;)             local.get 5
    (;70:1;)             i64.add
    (;71:1;)             i32.wrap_i64
    (;72:0;)             local.set 10
    (;73:1;)             i32.const 0
    (;74:0;)             local.set 11
    (;75:0;)             block
    (;76:0;)               loop
    (;77:1;)                 local.get 11
    (;78:2;)                 i32.const -8
    (;79:1;)                 i32.eq
    (;80:0;)                 br_if 1
    (;81:1;)                 local.get 10
    (;82:2;)                 i32.const 100
    (;83:1;)                 i32.div_u
    (;84:0;)                 local.set 12
    (;85:1;)                 local.get 7
    (;86:2;)                 local.get 11
    (;87:1;)                 i32.add
    (;88:1;)                 local.tee 13
    (;89:2;)                 i32.const -1
    (;90:1;)                 i32.add
    (;91:2;)                 i32.const 64
    (;92:1;)                 i32.gt_u
    (;93:0;)                 br_if 5
    (;94:1;)                 local.get 10
    (;95:2;)                 local.get 12
    (;96:3;)                 i32.const 100
    (;97:2;)                 i32.mul
    (;98:1;)                 i32.sub
    (;99:2;)                 i32.const 1
    (;100:1;)                i32.shl
    (;101:1;)                local.tee 10
    (;102:2;)                i32.const 1
    (;103:1;)                i32.or
    (;104:1;)                local.tee 14
    (;105:2;)                i32.const 200
    (;106:1;)                i32.ge_u
    (;107:0;)                br_if 5
    (;108:1;)                local.get 8
    (;109:2;)                local.get 11
    (;110:1;)                i32.add
    (;111:1;)                local.tee 15
    (;112:2;)                i32.const 1
    (;113:1;)                i32.add
    (;114:2;)                local.get 14
    (;115:3;)                i32.const 66512
    (;116:2;)                i32.add
    (;117:2;)                i32.load8_u
    (;118:0;)                i32.store8
    (;119:1;)                local.get 13
    (;120:2;)                i32.const -2
    (;121:1;)                i32.add
    (;122:2;)                i32.const 65
    (;123:1;)                i32.ge_u
    (;124:0;)                br_if 5
    (;125:1;)                local.get 15
    (;126:2;)                local.get 10
    (;127:3;)                i32.const 66512
    (;128:2;)                i32.add
    (;129:2;)                i32.load8_u
    (;130:0;)                i32.store8
    (;131:1;)                local.get 11
    (;132:2;)                i32.const -2
    (;133:1;)                i32.add
    (;134:0;)                local.set 11
    (;135:1;)                local.get 12
    (;136:0;)                local.set 10
    (;137:0;)                br 0
    (;138:0;)              end
    (;139:0;)            end
    (;140:1;)            local.get 7
    (;141:2;)            local.get 11
    (;142:1;)            i32.add
    (;143:2;)            i32.const -1
    (;144:1;)            i32.add
    (;145:1;)            local.tee 7
    (;146:2;)            i32.const 64
    (;147:1;)            i32.gt_u
    (;148:0;)            br_if 3
    (;149:1;)            local.get 10
    (;150:2;)            i32.const 1
    (;151:1;)            i32.shl
    (;152:2;)            i32.const 1
    (;153:1;)            i32.or
    (;154:1;)            local.tee 10
    (;155:2;)            i32.const 200
    (;156:1;)            i32.ge_u
    (;157:0;)            br_if 3
    (;158:1;)            local.get 8
    (;159:2;)            local.get 11
    (;160:1;)            i32.add
    (;161:2;)            i32.const 1
    (;162:1;)            i32.add
    (;163:2;)            local.get 10
    (;164:3;)            i32.const 66512
    (;165:2;)            i32.add
    (;166:2;)            i32.load8_u
    (;167:0;)            i32.store8
    (;168:1;)            local.get 9
    (;169:0;)            local.set 5
    (;170:0;)            br 0
    (;171:0;)          end
    (;172:0;)        end
    (;173:1;)        i32.const 0
    (;174:2;)        local.get 3
    (;175:0;)        i32.store offset=70816
    (;176:1;)        local.get 2
    (;177:2;)        i32.const 16
    (;178:1;)        i32.add
    (;179:2;)        local.get 1
    (;180:2;)        i32.wrap_i64
    (;181:2;)        local.tee 11
    (;182:3;)        i32.const 66464
    (;183:2;)        i32.add
    (;184:3;)        local.get 11
    (;185:4;)        i32.const 1
    (;186:3;)        i32.shl
    (;187:4;)        i32.const 66512
    (;188:3;)        i32.add
    (;189:4;)        local.get 11
    (;190:5;)        i32.const 10
    (;191:4;)        i32.lt_s
    (;192:4;)        local.tee 11
    (;193:2;)        select
    (;194:2;)        local.tee 10
    (;195:0;)        i32.store
    (;196:1;)        local.get 0
    (;197:2;)        i32.const 1
    (;198:3;)        i32.const 2
    (;199:4;)        local.get 11
    (;200:2;)        select
    (;201:0;)        i32.store offset=4
    (;202:1;)        local.get 0
    (;203:2;)        local.get 10
    (;204:0;)        i32.store
    (;205:1;)        local.get 2
    (;206:2;)        i32.const 32
    (;207:1;)        i32.add
    (;208:0;)        global.set 0
    (;209:0;)        return
    (;210:0;)      end
    (;211:1;)      local.get 7
    (;212:2;)      i32.const -1
    (;213:1;)      i32.add
    (;214:0;)      local.set 11
    (;215:1;)      local.get 5
    (;216:1;)      i32.wrap_i64
    (;217:0;)      local.set 10
    (;218:0;)      block
    (;219:0;)        loop
    (;220:1;)          local.get 10
    (;221:2;)          i32.const 100
    (;222:1;)          i32.lt_u
    (;223:0;)          br_if 1
    (;224:1;)          local.get 10
    (;225:2;)          i32.const 100
    (;226:1;)          i32.div_u
    (;227:0;)          local.set 12
    (;228:1;)          local.get 11
    (;229:2;)          i32.const 64
    (;230:1;)          i32.gt_u
    (;231:0;)          br_if 2
    (;232:1;)          local.get 10
    (;233:2;)          local.get 12
    (;234:3;)          i32.const 100
    (;235:2;)          i32.mul
    (;236:1;)          i32.sub
    (;237:2;)          i32.const 1
    (;238:1;)          i32.shl
    (;239:1;)          local.tee 10
    (;240:2;)          i32.const 1
    (;241:1;)          i32.or
    (;242:1;)          local.tee 13
    (;243:2;)          i32.const 200
    (;244:1;)          i32.ge_u
    (;245:0;)          br_if 2
    (;246:1;)          local.get 4
    (;247:2;)          local.get 11
    (;248:1;)          i32.add
    (;249:1;)          local.tee 14
    (;250:2;)          local.get 13
    (;251:3;)          i32.const 66512
    (;252:2;)          i32.add
    (;253:2;)          i32.load8_u
    (;254:0;)          i32.store8
    (;255:1;)          local.get 11
    (;256:2;)          i32.const -1
    (;257:1;)          i32.add
    (;258:2;)          i32.const 65
    (;259:1;)          i32.ge_u
    (;260:0;)          br_if 2
    (;261:1;)          local.get 14
    (;262:2;)          i32.const -1
    (;263:1;)          i32.add
    (;264:2;)          local.get 10
    (;265:3;)          i32.const 66512
    (;266:2;)          i32.add
    (;267:2;)          i32.load8_u
    (;268:0;)          i32.store8
    (;269:1;)          local.get 11
    (;270:2;)          i32.const -2
    (;271:1;)          i32.add
    (;272:0;)          local.set 11
    (;273:1;)          local.get 12
    (;274:0;)          local.set 10
    (;275:0;)          br 0
    (;276:0;)        end
    (;277:0;)      end
    (;278:1;)      local.get 11
    (;279:2;)      i32.const 64
    (;280:1;)      i32.gt_u
    (;281:0;)      br_if 0
    (;282:1;)      local.get 10
    (;283:2;)      i32.const 1
    (;284:1;)      i32.shl
    (;285:1;)      local.tee 13
    (;286:2;)      i32.const 1
    (;287:1;)      i32.or
    (;288:1;)      local.tee 12
    (;289:2;)      i32.const 200
    (;290:1;)      i32.ge_u
    (;291:0;)      br_if 0
    (;292:1;)      local.get 4
    (;293:2;)      local.get 11
    (;294:1;)      i32.add
    (;295:1;)      local.tee 14
    (;296:2;)      local.get 12
    (;297:3;)      i32.const 66512
    (;298:2;)      i32.add
    (;299:2;)      i32.load8_u
    (;300:0;)      i32.store8
    (;301:0;)      block
    (;302:1;)        local.get 10
    (;303:2;)        i32.const 9
    (;304:1;)        i32.le_u
    (;305:0;)        br_if 0
    (;306:1;)        local.get 11
    (;307:2;)        i32.const -1
    (;308:1;)        i32.add
    (;309:1;)        local.tee 11
    (;310:2;)        i32.const 64
    (;311:1;)        i32.gt_u
    (;312:0;)        br_if 1
    (;313:1;)        local.get 14
    (;314:2;)        i32.const -1
    (;315:1;)        i32.add
    (;316:2;)        local.get 13
    (;317:3;)        i32.const 66512
    (;318:2;)        i32.add
    (;319:2;)        i32.load8_u
    (;320:0;)        i32.store8
    (;321:0;)      end
    (;322:0;)      block
    (;323:1;)        local.get 1
    (;324:2;)        i64.const -1
    (;325:1;)        i64.gt_s
    (;326:0;)        br_if 0
    (;327:1;)        local.get 11
    (;328:2;)        i32.const -1
    (;329:1;)        i32.add
    (;330:1;)        local.tee 11
    (;331:2;)        i32.const 64
    (;332:1;)        i32.gt_u
    (;333:0;)        br_if 1
    (;334:1;)        local.get 4
    (;335:2;)        local.get 11
    (;336:1;)        i32.add
    (;337:2;)        i32.const 45
    (;338:0;)        i32.store8
    (;339:0;)      end
    (;340:1;)      local.get 2
    (;341:2;)      local.get 4
    (;342:3;)      local.get 11
    (;343:2;)      i32.add
    (;344:3;)      i32.const 65
    (;345:4;)      local.get 11
    (;346:3;)      i32.sub
    (;347:3;)      local.tee 11
    (;348:4;)      local.get 11
    (;349:0;)      call 14  runtime.stringFromBytes
    (;350:1;)      i32.const 0
    (;351:2;)      local.get 3
    (;352:0;)      i32.store offset=70816
    (;353:1;)      local.get 2
    (;354:2;)      i32.const 28
    (;355:1;)      i32.add
    (;356:2;)      local.get 2
    (;357:2;)      i32.load
    (;358:2;)      local.tee 11
    (;359:0;)      i32.store
    (;360:1;)      local.get 2
    (;361:2;)      i32.const 24
    (;362:1;)      i32.add
    (;363:2;)      local.get 11
    (;364:0;)      i32.store
    (;365:1;)      local.get 0
    (;366:2;)      local.get 2
    (;367:2;)      i32.load offset=4
    (;368:0;)      i32.store offset=4
    (;369:1;)      local.get 0
    (;370:2;)      local.get 11
    (;371:0;)      i32.store
    (;372:1;)      local.get 2
    (;373:2;)      i32.const 32
    (;374:1;)      i32.add
    (;375:0;)      global.set 0
    (;376:0;)      return
    (;377:0;)    end
    (;378:0;)    call 77  runtime.lookupPanic
    (;379:0;)    unreachable
    (;380:0;)  end
  )

  (func "runtime.lookupPanic" (;77;) (type 6)
    (;0:1;)      i32.const 67184
    (;1:2;)      i32.const 18
    (;2:0;)      call 106  runtime.runtimePanic
    (;3:0;)      unreachable
    (;4:0;)    end
  )

  (func "strconv.ParseInt" (;78;) (type 1) (param (;0;) i32 (;1;) i32 (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i64)
    (local (;10;) i32)
    (local (;11;) i32)
    (local (;12;) i64)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 160
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i64.const 120259084288
    (;7:0;)      i64.store offset=40
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=152
    (;11:1;)     local.get 3
    (;12:2;)     i64.const 0
    (;13:0;)     i64.store offset=144
    (;14:1;)     local.get 3
    (;15:2;)     i64.const 0
    (;16:0;)     i64.store offset=136
    (;17:1;)     local.get 3
    (;18:2;)     i64.const 0
    (;19:0;)     i64.store offset=128
    (;20:1;)     local.get 3
    (;21:2;)     i64.const 0
    (;22:0;)     i64.store offset=120
    (;23:1;)     local.get 3
    (;24:2;)     i64.const 0
    (;25:0;)     i64.store offset=112
    (;26:1;)     local.get 3
    (;27:2;)     i64.const 0
    (;28:0;)     i64.store offset=104
    (;29:1;)     local.get 3
    (;30:2;)     i64.const 0
    (;31:0;)     i64.store offset=96
    (;32:1;)     local.get 3
    (;33:2;)     i64.const 0
    (;34:0;)     i64.store offset=88
    (;35:1;)     local.get 3
    (;36:2;)     i64.const 0
    (;37:0;)     i64.store offset=80
    (;38:1;)     local.get 3
    (;39:2;)     i64.const 0
    (;40:0;)     i64.store offset=72
    (;41:1;)     local.get 3
    (;42:2;)     i64.const 0
    (;43:0;)     i64.store offset=64
    (;44:1;)     local.get 3
    (;45:2;)     i64.const 0
    (;46:0;)     i64.store offset=56
    (;47:1;)     local.get 3
    (;48:2;)     i64.const 0
    (;49:0;)     i64.store offset=48
    (;50:1;)     i32.const 0
    (;51:0;)     local.set 4
    (;52:1;)     i32.const 0
    (;53:1;)     i32.load offset=70816
    (;54:0;)     local.set 5
    (;55:1;)     i32.const 0
    (;56:2;)     local.get 3
    (;57:3;)     i32.const 40
    (;58:2;)     i32.add
    (;59:0;)     i32.store offset=70816
    (;60:1;)     local.get 3
    (;61:2;)     local.get 5
    (;62:0;)     i32.store offset=40
    (;63:0;)     block
    (;64:1;)       local.get 2
    (;65:0;)       br_if 0
    (;66:1;)       local.get 3
    (;67:2;)       i32.const 40
    (;68:1;)       i32.add
    (;69:2;)       i32.const 8
    (;70:1;)       i32.add
    (;71:2;)       i32.const 66366
    (;72:3;)       i32.const 8
    (;73:4;)       local.get 1
    (;74:5;)       i32.const 0
    (;75:2;)       call 79  strconv.syntaxError
    (;76:2;)       local.tee 6
    (;77:0;)       i32.store
    (;78:1;)       local.get 3
    (;79:2;)       i32.const 52
    (;80:1;)       i32.add
    (;81:2;)       local.get 6
    (;82:0;)       i32.store
    (;83:1;)       i32.const 0
    (;84:2;)       local.get 5
    (;85:0;)       i32.store offset=70816
    (;86:1;)       local.get 0
    (;87:2;)       local.get 6
    (;88:0;)       i32.store offset=12
    (;89:1;)       local.get 0
    (;90:2;)       i32.const 997
    (;91:0;)       i32.store offset=8
    (;92:1;)       local.get 0
    (;93:2;)       i64.const 0
    (;94:0;)       i64.store
    (;95:1;)       local.get 3
    (;96:2;)       i32.const 160
    (;97:1;)       i32.add
    (;98:0;)       global.set 0
    (;99:0;)       return
    (;100:0;)    end
    (;101:1;)    local.get 2
    (;102:0;)    local.set 7
    (;103:1;)    local.get 1
    (;104:0;)    local.set 8
    (;105:0;)    block
    (;106:1;)      local.get 1
    (;107:1;)      i32.load8_u
    (;108:2;)      i32.const -43
    (;109:1;)      i32.add
    (;110:1;)      local.tee 6
    (;111:2;)      i32.const 2
    (;112:1;)      i32.gt_u
    (;113:0;)      br_if 0
    (;114:0;)      block
    (;115:0;)        block
    (;116:1;)          local.get 6
    (;117:0;)          br_table 1 2 0 1
    (;118:0;)        end
    (;119:1;)        local.get 2
    (;120:2;)        i32.const -1
    (;121:1;)        i32.add
    (;122:0;)        local.set 7
    (;123:1;)        i32.const 1
    (;124:0;)        local.set 4
    (;125:1;)        local.get 1
    (;126:2;)        i32.const 1
    (;127:1;)        i32.add
    (;128:0;)        local.set 8
    (;129:0;)        br 1
    (;130:0;)      end
    (;131:1;)      local.get 2
    (;132:2;)      i32.const -1
    (;133:1;)      i32.add
    (;134:0;)      local.set 7
    (;135:1;)      local.get 1
    (;136:2;)      i32.const 1
    (;137:1;)      i32.add
    (;138:0;)      local.set 8
    (;139:0;)    end
    (;140:1;)    local.get 3
    (;141:2;)    i32.const 84
    (;142:1;)    i32.add
    (;143:2;)    local.get 8
    (;144:0;)    i32.store
    (;145:1;)    local.get 3
    (;146:2;)    i32.const 88
    (;147:1;)    i32.add
    (;148:2;)    local.get 8
    (;149:0;)    i32.store
    (;150:1;)    local.get 3
    (;151:2;)    i32.const 68
    (;152:1;)    i32.add
    (;153:2;)    local.get 8
    (;154:0;)    i32.store
    (;155:1;)    local.get 3
    (;156:2;)    i32.const 56
    (;157:1;)    i32.add
    (;158:2;)    local.get 8
    (;159:0;)    i32.store
    (;160:0;)    block
    (;161:0;)      block
    (;162:0;)        block
    (;163:0;)          block
    (;164:0;)            block
    (;165:0;)              block
    (;166:1;)                local.get 7
    (;167:0;)                br_if 0
    (;168:1;)                local.get 3
    (;169:2;)                i32.const 60
    (;170:1;)                i32.add
    (;171:2;)                i32.const 66374
    (;172:3;)                i32.const 9
    (;173:4;)                local.get 8
    (;174:5;)                i32.const 0
    (;175:2;)                call 79  strconv.syntaxError
    (;176:2;)                local.tee 6
    (;177:0;)                i32.store
    (;178:1;)                local.get 3
    (;179:2;)                i32.const 64
    (;180:1;)                i32.add
    (;181:2;)                local.get 6
    (;182:0;)                i32.store
    (;183:0;)                br 1
    (;184:0;)              end
    (;185:1;)              local.get 3
    (;186:2;)              i32.const 76
    (;187:1;)              i32.add
    (;188:2;)              local.get 3
    (;189:3;)              i32.const 24
    (;190:2;)              i32.add
    (;191:0;)              i32.store
    (;192:1;)              local.get 3
    (;193:2;)              i32.const 72
    (;194:1;)              i32.add
    (;195:2;)              local.get 3
    (;196:3;)              i32.const 16
    (;197:2;)              i32.add
    (;198:0;)              i32.store
    (;199:1;)              i32.const 0
    (;200:0;)              local.set 6
    (;201:1;)              local.get 3
    (;202:2;)              i32.const 0
    (;203:0;)              i32.store offset=32
    (;204:1;)              i64.const 0
    (;205:0;)              local.set 9
    (;206:1;)              local.get 3
    (;207:2;)              i64.const 0
    (;208:0;)              i64.store offset=24
    (;209:1;)              local.get 3
    (;210:2;)              i64.const 0
    (;211:0;)              i64.store offset=16
    (;212:1;)              local.get 3
    (;213:2;)              i32.const 96
    (;214:1;)              i32.add
    (;215:2;)              local.get 7
    (;216:2;)              call 59  runtime.alloc
    (;217:2;)              local.tee 10
    (;218:0;)              i32.store
    (;219:1;)              local.get 3
    (;220:2;)              i32.const 100
    (;221:1;)              i32.add
    (;222:2;)              local.get 10
    (;223:0;)              i32.store
    (;224:1;)              local.get 3
    (;225:2;)              i32.const 92
    (;226:1;)              i32.add
    (;227:2;)              local.get 10
    (;228:0;)              i32.store
    (;229:1;)              local.get 3
    (;230:2;)              i32.const 80
    (;231:1;)              i32.add
    (;232:2;)              local.get 10
    (;233:0;)              i32.store
    (;234:1;)              local.get 10
    (;235:2;)              local.get 8
    (;236:3;)              local.get 7
    (;237:1;)              call 8  memcpy
    (;238:0;)              local.set 11
    (;239:0;)              block
    (;240:0;)                loop
    (;241:1;)                  local.get 6
    (;242:2;)                  local.get 7
    (;243:1;)                  i32.ge_s
    (;244:0;)                  br_if 3
    (;245:1;)                  local.get 7
    (;246:2;)                  local.get 6
    (;247:1;)                  i32.eq
    (;248:0;)                  br_if 4
    (;249:1;)                  local.get 11
    (;250:2;)                  local.get 6
    (;251:1;)                  i32.add
    (;252:1;)                  i32.load8_u
    (;253:2;)                  i32.const -48
    (;254:1;)                  i32.add
    (;255:1;)                  local.tee 10
    (;256:2;)                  i32.const 255
    (;257:1;)                  i32.and
    (;258:2;)                  i32.const 10
    (;259:1;)                  i32.ge_u
    (;260:0;)                  br_if 1
    (;261:0;)                  block
    (;262:1;)                    local.get 9
    (;263:2;)                    i64.const 1844674407370955162
    (;264:1;)                    i64.lt_u
    (;265:0;)                    br_if 0
    (;266:1;)                    local.get 3
    (;267:2;)                    i32.const 104
    (;268:1;)                    i32.add
    (;269:2;)                    i32.const 66374
    (;270:3;)                    i32.const 9
    (;271:4;)                    local.get 8
    (;272:5;)                    local.get 7
    (;273:2;)                    call 80  strconv.rangeError
    (;274:2;)                    local.tee 6
    (;275:0;)                    i32.store
    (;276:1;)                    local.get 3
    (;277:2;)                    i32.const 108
    (;278:1;)                    i32.add
    (;279:2;)                    local.get 6
    (;280:0;)                    i32.store
    (;281:0;)                    br 6
    (;282:0;)                  end
    (;283:1;)                  local.get 6
    (;284:2;)                  i32.const 1
    (;285:1;)                  i32.add
    (;286:0;)                  local.set 6
    (;287:1;)                  local.get 9
    (;288:2;)                  i64.const 10
    (;289:1;)                  i64.mul
    (;290:1;)                  local.tee 12
    (;291:2;)                  local.get 10
    (;292:2;)                  i64.extend_i32_u
    (;293:3;)                  i64.const 255
    (;294:2;)                  i64.and
    (;295:1;)                  i64.add
    (;296:1;)                  local.tee 9
    (;297:2;)                  local.get 12
    (;298:1;)                  i64.ge_u
    (;299:0;)                  br_if 0
    (;300:0;)                end
    (;301:1;)                local.get 3
    (;302:2;)                i32.const 112
    (;303:1;)                i32.add
    (;304:2;)                i32.const 66374
    (;305:3;)                i32.const 9
    (;306:4;)                local.get 8
    (;307:5;)                local.get 7
    (;308:2;)                call 80  strconv.rangeError
    (;309:2;)                local.tee 6
    (;310:0;)                i32.store
    (;311:1;)                local.get 3
    (;312:2;)                i32.const 116
    (;313:1;)                i32.add
    (;314:2;)                local.get 6
    (;315:0;)                i32.store
    (;316:0;)                br 4
    (;317:0;)              end
    (;318:1;)              local.get 3
    (;319:2;)              i32.const 120
    (;320:1;)              i32.add
    (;321:2;)              i32.const 66374
    (;322:3;)              i32.const 9
    (;323:4;)              local.get 8
    (;324:5;)              local.get 7
    (;325:2;)              call 79  strconv.syntaxError
    (;326:2;)              local.tee 6
    (;327:0;)              i32.store
    (;328:1;)              local.get 3
    (;329:2;)              i32.const 124
    (;330:1;)              i32.add
    (;331:2;)              local.get 6
    (;332:0;)              i32.store
    (;333:0;)            end
    (;334:1;)            i32.const 997
    (;335:0;)            local.set 7
    (;336:1;)            i64.const 0
    (;337:0;)            local.set 9
    (;338:0;)            br 3
    (;339:0;)          end
    (;340:1;)          i32.const 0
    (;341:0;)          local.set 7
    (;342:1;)          i32.const 0
    (;343:0;)          local.set 6
    (;344:0;)          br 2
    (;345:0;)        end
    (;346:0;)        call 77  runtime.lookupPanic
    (;347:0;)        unreachable
    (;348:0;)      end
    (;349:1;)      i32.const 997
    (;350:0;)      local.set 7
    (;351:1;)      i64.const -1
    (;352:0;)      local.set 9
    (;353:0;)    end
    (;354:1;)    local.get 3
    (;355:2;)    i32.const 128
    (;356:1;)    i32.add
    (;357:2;)    local.get 6
    (;358:0;)    i32.store
    (;359:0;)    block
    (;360:1;)      local.get 7
    (;361:1;)      i32.eqz
    (;362:0;)      br_if 0
    (;363:1;)      local.get 7
    (;364:2;)      i32.const 997
    (;365:1;)      i32.eq
    (;366:0;)      call 81  runtime.interfaceTypeAssert
    (;367:0;)      block
    (;368:0;)        block
    (;369:1;)          local.get 6
    (;370:1;)          i32.eqz
    (;371:0;)          br_if 0
    (;372:1;)          local.get 7
    (;373:2;)          i32.const 997
    (;374:1;)          i32.eq
    (;375:0;)          br_if 1
    (;376:0;)        end
    (;377:0;)        call 72  runtime.nilPanic
    (;378:0;)        unreachable
    (;379:0;)      end
    (;380:1;)      local.get 6
    (;381:1;)      i32.load offset=16
    (;382:0;)      local.set 10
    (;383:1;)      local.get 3
    (;384:2;)      i32.const 148
    (;385:1;)      i32.add
    (;386:2;)      local.get 6
    (;387:2;)      i32.load offset=20
    (;388:2;)      local.tee 8
    (;389:0;)      i32.store
    (;390:1;)      local.get 3
    (;391:2;)      i32.const 8
    (;392:1;)      i32.add
    (;393:2;)      local.get 10
    (;394:3;)      local.get 8
    (;395:0;)      call 75  reflect.ValueOf
    (;396:1;)      local.get 3
    (;397:2;)      i32.const 152
    (;398:1;)      i32.add
    (;399:2;)      local.get 3
    (;400:2;)      i32.load offset=12
    (;401:2;)      local.tee 10
    (;402:0;)      i32.store
    (;403:1;)      local.get 3
    (;404:1;)      i32.load offset=8
    (;405:0;)      local.set 8
    (;406:1;)      local.get 3
    (;407:2;)      i32.const 5093
    (;408:3;)      i32.const 70760
    (;409:0;)      call 75  reflect.ValueOf
    (;410:1;)      local.get 3
    (;411:2;)      i32.const 156
    (;412:1;)      i32.add
    (;413:2;)      local.get 3
    (;414:2;)      i32.load offset=4
    (;415:2;)      local.tee 11
    (;416:0;)      i32.store
    (;417:1;)      local.get 8
    (;418:2;)      local.get 10
    (;419:3;)      i32.const 2
    (;420:4;)      local.get 3
    (;421:4;)      i32.load
    (;422:5;)      local.get 11
    (;423:6;)      i32.const 2
    (;424:1;)      call 82  runtime.reflectValueEqual
    (;425:2;)      i32.const 1
    (;426:1;)      i32.and
    (;427:0;)      br_if 0
    (;428:1;)      local.get 7
    (;429:2;)      i32.const 997
    (;430:1;)      i32.eq
    (;431:1;)      local.tee 10
    (;432:0;)      call 81  runtime.interfaceTypeAssert
    (;433:1;)      local.get 6
    (;434:2;)      i32.const 8
    (;435:0;)      i32.store offset=4
    (;436:1;)      local.get 6
    (;437:2;)      i32.const 66366
    (;438:0;)      i32.store
    (;439:1;)      local.get 10
    (;440:0;)      call 81  runtime.interfaceTypeAssert
    (;441:1;)      local.get 6
    (;442:2;)      local.get 2
    (;443:0;)      i32.store offset=12
    (;444:1;)      local.get 6
    (;445:2;)      local.get 1
    (;446:0;)      i32.store offset=8
    (;447:1;)      i32.const 0
    (;448:2;)      local.get 5
    (;449:0;)      i32.store offset=70816
    (;450:1;)      local.get 0
    (;451:2;)      local.get 6
    (;452:0;)      i32.store offset=12
    (;453:1;)      local.get 0
    (;454:2;)      local.get 7
    (;455:0;)      i32.store offset=8
    (;456:1;)      local.get 0
    (;457:2;)      i64.const 0
    (;458:0;)      i64.store
    (;459:1;)      local.get 3
    (;460:2;)      i32.const 160
    (;461:1;)      i32.add
    (;462:0;)      global.set 0
    (;463:0;)      return
    (;464:0;)    end
    (;465:0;)    block
    (;466:0;)      block
    (;467:0;)        block
    (;468:1;)          local.get 4
    (;469:1;)          i32.eqz
    (;470:0;)          br_if 0
    (;471:1;)          local.get 9
    (;472:2;)          i64.const -9223372036854775807
    (;473:1;)          i64.ge_u
    (;474:0;)          br_if 1
    (;475:0;)          br 2
    (;476:0;)        end
    (;477:1;)        local.get 9
    (;478:2;)        i64.const -1
    (;479:1;)        i64.gt_s
    (;480:0;)        br_if 1
    (;481:1;)        local.get 3
    (;482:2;)        i32.const 140
    (;483:1;)        i32.add
    (;484:2;)        i32.const 66366
    (;485:3;)        i32.const 8
    (;486:4;)        local.get 1
    (;487:5;)        local.get 2
    (;488:2;)        call 80  strconv.rangeError
    (;489:2;)        local.tee 6
    (;490:0;)        i32.store
    (;491:1;)        local.get 3
    (;492:2;)        i32.const 144
    (;493:1;)        i32.add
    (;494:2;)        local.get 6
    (;495:0;)        i32.store
    (;496:1;)        i32.const 0
    (;497:2;)        local.get 5
    (;498:0;)        i32.store offset=70816
    (;499:1;)        local.get 0
    (;500:2;)        local.get 6
    (;501:0;)        i32.store offset=12
    (;502:1;)        local.get 0
    (;503:2;)        i32.const 997
    (;504:0;)        i32.store offset=8
    (;505:1;)        local.get 0
    (;506:2;)        i64.const 9223372036854775807
    (;507:0;)        i64.store
    (;508:1;)        local.get 3
    (;509:2;)        i32.const 160
    (;510:1;)        i32.add
    (;511:0;)        global.set 0
    (;512:0;)        return
    (;513:0;)      end
    (;514:1;)      local.get 3
    (;515:2;)      i32.const 132
    (;516:1;)      i32.add
    (;517:2;)      i32.const 66366
    (;518:3;)      i32.const 8
    (;519:4;)      local.get 1
    (;520:5;)      local.get 2
    (;521:2;)      call 80  strconv.rangeError
    (;522:2;)      local.tee 6
    (;523:0;)      i32.store
    (;524:1;)      local.get 3
    (;525:2;)      i32.const 136
    (;526:1;)      i32.add
    (;527:2;)      local.get 6
    (;528:0;)      i32.store
    (;529:1;)      i32.const 0
    (;530:2;)      local.get 5
    (;531:0;)      i32.store offset=70816
    (;532:1;)      local.get 0
    (;533:2;)      local.get 6
    (;534:0;)      i32.store offset=12
    (;535:1;)      local.get 0
    (;536:2;)      i32.const 997
    (;537:0;)      i32.store offset=8
    (;538:1;)      local.get 0
    (;539:2;)      i64.const -9223372036854775808
    (;540:0;)      i64.store
    (;541:1;)      local.get 3
    (;542:2;)      i32.const 160
    (;543:1;)      i32.add
    (;544:0;)      global.set 0
    (;545:0;)      return
    (;546:0;)    end
    (;547:1;)    i32.const 0
    (;548:2;)    local.get 5
    (;549:0;)    i32.store offset=70816
    (;550:1;)    local.get 0
    (;551:2;)    i64.const 0
    (;552:0;)    i64.store offset=8 align=2
    (;553:1;)    local.get 0
    (;554:2;)    i64.const 0
    (;555:3;)    local.get 9
    (;556:2;)    i64.sub
    (;557:3;)    local.get 9
    (;558:4;)    local.get 4
    (;559:2;)    select
    (;560:0;)    i64.store
    (;561:1;)    local.get 3
    (;562:2;)    i32.const 160
    (;563:1;)    i32.add
    (;564:0;)    global.set 0
    (;565:0;)  end
  )

  (func "strconv.syntaxError" (;79;) (type 5) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32) (result i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 4
    (;4:0;)      global.set 0
    (;5:1;)      local.get 4
    (;6:2;)      i64.const 1
    (;7:0;)      i64.store offset=4 align=2
    (;8:1;)      i32.const 0
    (;9:1;)      i32.load offset=70816
    (;10:0;)     local.set 5
    (;11:1;)     i32.const 0
    (;12:2;)     local.get 4
    (;13:0;)     i32.store offset=70816
    (;14:1;)     local.get 4
    (;15:2;)     local.get 5
    (;16:0;)     i32.store
    (;17:1;)     i32.const 24
    (;18:1;)     call 59  runtime.alloc
    (;19:1;)     local.tee 6
    (;20:2;)     i32.const 70768
    (;21:0;)     i32.store offset=20
    (;22:1;)     local.get 6
    (;23:2;)     i32.const 5093
    (;24:0;)     i32.store offset=16
    (;25:1;)     local.get 6
    (;26:2;)     local.get 3
    (;27:0;)     i32.store offset=12
    (;28:1;)     local.get 6
    (;29:2;)     local.get 2
    (;30:0;)     i32.store offset=8
    (;31:1;)     local.get 6
    (;32:2;)     local.get 1
    (;33:0;)     i32.store offset=4
    (;34:1;)     local.get 6
    (;35:2;)     local.get 0
    (;36:0;)     i32.store
    (;37:1;)     i32.const 0
    (;38:2;)     local.get 5
    (;39:0;)     i32.store offset=70816
    (;40:1;)     local.get 4
    (;41:2;)     local.get 6
    (;42:0;)     i32.store offset=8
    (;43:1;)     local.get 4
    (;44:2;)     i32.const 16
    (;45:1;)     i32.add
    (;46:0;)     global.set 0
    (;47:1;)     local.get 6
    (;48:0;)   end
  )

  (func "strconv.rangeError" (;80;) (type 5) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32) (result i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 4
    (;4:0;)      global.set 0
    (;5:1;)      local.get 4
    (;6:2;)      i64.const 1
    (;7:0;)      i64.store offset=4 align=2
    (;8:1;)      i32.const 0
    (;9:1;)      i32.load offset=70816
    (;10:0;)     local.set 5
    (;11:1;)     i32.const 0
    (;12:2;)     local.get 4
    (;13:0;)     i32.store offset=70816
    (;14:1;)     local.get 4
    (;15:2;)     local.get 5
    (;16:0;)     i32.store
    (;17:1;)     i32.const 24
    (;18:1;)     call 59  runtime.alloc
    (;19:1;)     local.tee 6
    (;20:2;)     i32.const 70760
    (;21:0;)     i32.store offset=20
    (;22:1;)     local.get 6
    (;23:2;)     i32.const 5093
    (;24:0;)     i32.store offset=16
    (;25:1;)     local.get 6
    (;26:2;)     local.get 3
    (;27:0;)     i32.store offset=12
    (;28:1;)     local.get 6
    (;29:2;)     local.get 2
    (;30:0;)     i32.store offset=8
    (;31:1;)     local.get 6
    (;32:2;)     local.get 1
    (;33:0;)     i32.store offset=4
    (;34:1;)     local.get 6
    (;35:2;)     local.get 0
    (;36:0;)     i32.store
    (;37:1;)     i32.const 0
    (;38:2;)     local.get 5
    (;39:0;)     i32.store offset=70816
    (;40:1;)     local.get 4
    (;41:2;)     local.get 6
    (;42:0;)     i32.store offset=8
    (;43:1;)     local.get 4
    (;44:2;)     i32.const 16
    (;45:1;)     i32.add
    (;46:0;)     global.set 0
    (;47:1;)     local.get 6
    (;48:0;)   end
  )

  (func "runtime.interfaceTypeAssert" (;81;) (type 0) (param (;0;) i32)
    (;0:0;)      block
    (;1:1;)        local.get 0
    (;2:2;)        i32.const 1
    (;3:1;)        i32.and
    (;4:1;)        i32.eqz
    (;5:0;)        br_if 0
    (;6:0;)        return
    (;7:0;)      end
    (;8:1;)      i32.const 67152
    (;9:2;)      i32.const 18
    (;10:0;)     call 106  runtime.runtimePanic
    (;11:0;)     unreachable
    (;12:0;)   end
  )

  (func "runtime.reflectValueEqual" (;82;) (type 17) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32 (;4;) i32 (;5;) i32) (result i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i32)
    (local (;10;) i64)
    (local (;11;) i64)
    (local (;12;) f64)
    (local (;13;) f64)
    (local (;14;) f64)
    (local (;15;) f64)
    (local (;16;) i32)
    (local (;17;) i32)
    (local (;18;) i32)
    (local (;19;) i32)
    (local (;20;) i32)
    (local (;21;) i32)
    (local (;22;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 224
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 6
    (;4:0;)      global.set 0
    (;5:1;)      local.get 6
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=120
    (;8:1;)      local.get 6
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=136
    (;11:1;)     local.get 6
    (;12:2;)     i64.const 0
    (;13:0;)     i64.store offset=180 align=2
    (;14:1;)     local.get 6
    (;15:2;)     i32.const 0
    (;16:0;)     i32.store offset=220
    (;17:1;)     local.get 6
    (;18:2;)     i64.const 0
    (;19:0;)     i64.store offset=212 align=2
    (;20:1;)     local.get 6
    (;21:2;)     i64.const 0
    (;22:0;)     i64.store offset=204 align=2
    (;23:1;)     local.get 6
    (;24:2;)     i64.const 0
    (;25:0;)     i64.store offset=196 align=2
    (;26:1;)     local.get 6
    (;27:2;)     i64.const 0
    (;28:0;)     i64.store offset=188 align=2
    (;29:1;)     local.get 6
    (;30:2;)     i32.const 12
    (;31:0;)     i32.store offset=172
    (;32:1;)     local.get 6
    (;33:2;)     local.get 2
    (;34:0;)     i32.store8 offset=128
    (;35:1;)     local.get 6
    (;36:2;)     local.get 5
    (;37:0;)     i32.store8 offset=144
    (;38:1;)     i32.const 0
    (;39:1;)     i32.load offset=70816
    (;40:0;)     local.set 7
    (;41:1;)     i32.const 0
    (;42:2;)     local.get 6
    (;43:3;)     i32.const 168
    (;44:2;)     i32.add
    (;45:0;)     i32.store offset=70816
    (;46:1;)     local.get 6
    (;47:2;)     local.get 7
    (;48:0;)     i32.store offset=168
    (;49:1;)     local.get 6
    (;50:2;)     local.get 1
    (;51:0;)     i32.store offset=124
    (;52:1;)     local.get 6
    (;53:2;)     local.get 3
    (;54:0;)     i32.store offset=136
    (;55:1;)     local.get 6
    (;56:2;)     local.get 4
    (;57:0;)     i32.store offset=140
    (;58:1;)     local.get 6
    (;59:2;)     local.get 6
    (;60:3;)     i32.const 120
    (;61:2;)     i32.add
    (;62:0;)     i32.store offset=176
    (;63:1;)     local.get 6
    (;64:2;)     local.get 6
    (;65:3;)     i32.const 136
    (;66:2;)     i32.add
    (;67:0;)     i32.store offset=180
    (;68:1;)     local.get 6
    (;69:2;)     local.get 0
    (;70:0;)     i32.store offset=120
    (;71:0;)     block
    (;72:1;)       local.get 0
    (;73:2;)       local.get 1
    (;74:3;)       local.get 2
    (;75:1;)       call 66  (reflect.Value).Type
    (;76:1;)       local.tee 0
    (;77:1;)       i32.eqz
    (;78:0;)       br_if 0
    (;79:1;)       local.get 3
    (;80:2;)       local.get 4
    (;81:3;)       local.get 5
    (;82:1;)       call 66  (reflect.Value).Type
    (;83:1;)       local.tee 8
    (;84:1;)       i32.eqz
    (;85:0;)       br_if 0
    (;86:1;)       i32.const 0
    (;87:0;)       local.set 3
    (;88:0;)       block
    (;89:1;)         local.get 0
    (;90:2;)         local.get 1
    (;91:3;)         local.get 2
    (;92:1;)         call 66  (reflect.Value).Type
    (;93:1;)         local.tee 9
    (;94:2;)         local.get 8
    (;95:3;)         local.get 4
    (;96:4;)         local.get 5
    (;97:2;)         call 66  (reflect.Value).Type
    (;98:2;)         local.tee 0
    (;99:1;)         i32.ne
    (;100:0;)        br_if 0
    (;101:0;)        block
    (;102:0;)          block
    (;103:0;)            block
    (;104:0;)              block
    (;105:1;)                local.get 9
    (;106:2;)                local.get 1
    (;107:3;)                local.get 2
    (;108:1;)                call 66  (reflect.Value).Type
    (;109:1;)                local.tee 8
    (;110:1;)                call 50  (reflect.Type).Kind
    (;111:2;)                i32.const -1
    (;112:1;)                i32.add
    (;113:1;)                local.tee 3
    (;114:2;)                i32.const 25
    (;115:1;)                i32.gt_u
    (;116:0;)                br_if 0
    (;117:0;)                block
    (;118:0;)                  block
    (;119:0;)                    block
    (;120:0;)                      block
    (;121:0;)                        block
    (;122:0;)                          block
    (;123:0;)                            block
    (;124:1;)                              local.get 3
    (;125:0;)                              br_table 0 1 1 1 1 1 2 2 2 2 2 2 3 3 4 4 5 6 6 7 6 7 9 7 7 8 0
    (;126:0;)                            end
    (;127:1;)                            local.get 8
    (;128:2;)                            local.get 1
    (;129:3;)                            local.get 2
    (;130:1;)                            call 61  (reflect.Value).Bool
    (;131:0;)                            local.set 1
    (;132:1;)                            local.get 0
    (;133:2;)                            local.get 4
    (;134:3;)                            local.get 5
    (;135:1;)                            call 61  (reflect.Value).Bool
    (;136:0;)                            local.set 2
    (;137:1;)                            i32.const 0
    (;138:2;)                            local.get 7
    (;139:0;)                            i32.store offset=70816
    (;140:1;)                            local.get 6
    (;141:2;)                            i32.const 224
    (;142:1;)                            i32.add
    (;143:0;)                            global.set 0
    (;144:1;)                            local.get 1
    (;145:2;)                            local.get 2
    (;146:1;)                            i32.xor
    (;147:2;)                            i32.const 1
    (;148:1;)                            i32.xor
    (;149:1;)                            return
    (;150:0;)                          end
    (;151:1;)                          local.get 8
    (;152:2;)                          local.get 1
    (;153:3;)                          local.get 2
    (;154:1;)                          call 70  (reflect.Value).Int
    (;155:0;)                          local.set 10
    (;156:1;)                          local.get 0
    (;157:2;)                          local.get 4
    (;158:3;)                          local.get 5
    (;159:1;)                          call 70  (reflect.Value).Int
    (;160:0;)                          local.set 11
    (;161:1;)                          i32.const 0
    (;162:2;)                          local.get 7
    (;163:0;)                          i32.store offset=70816
    (;164:1;)                          local.get 6
    (;165:2;)                          i32.const 224
    (;166:1;)                          i32.add
    (;167:0;)                          global.set 0
    (;168:1;)                          local.get 10
    (;169:2;)                          local.get 11
    (;170:1;)                          i64.eq
    (;171:1;)                          return
    (;172:0;)                        end
    (;173:1;)                        local.get 8
    (;174:2;)                        local.get 1
    (;175:3;)                        local.get 2
    (;176:1;)                        call 74  (reflect.Value).Uint
    (;177:0;)                        local.set 10
    (;178:1;)                        local.get 0
    (;179:2;)                        local.get 4
    (;180:3;)                        local.get 5
    (;181:1;)                        call 74  (reflect.Value).Uint
    (;182:0;)                        local.set 11
    (;183:1;)                        i32.const 0
    (;184:2;)                        local.get 7
    (;185:0;)                        i32.store offset=70816
    (;186:1;)                        local.get 6
    (;187:2;)                        i32.const 224
    (;188:1;)                        i32.add
    (;189:0;)                        global.set 0
    (;190:1;)                        local.get 10
    (;191:2;)                        local.get 11
    (;192:1;)                        i64.eq
    (;193:1;)                        return
    (;194:0;)                      end
    (;195:1;)                      local.get 8
    (;196:2;)                      local.get 1
    (;197:3;)                      local.get 2
    (;198:1;)                      call 68  (reflect.Value).Float
    (;199:0;)                      local.set 12
    (;200:1;)                      local.get 0
    (;201:2;)                      local.get 4
    (;202:3;)                      local.get 5
    (;203:1;)                      call 68  (reflect.Value).Float
    (;204:0;)                      local.set 13
    (;205:1;)                      i32.const 0
    (;206:2;)                      local.get 7
    (;207:0;)                      i32.store offset=70816
    (;208:1;)                      local.get 6
    (;209:2;)                      i32.const 224
    (;210:1;)                      i32.add
    (;211:0;)                      global.set 0
    (;212:1;)                      local.get 12
    (;213:2;)                      local.get 13
    (;214:1;)                      f64.eq
    (;215:2;)                      local.get 12
    (;216:3;)                      local.get 12
    (;217:2;)                      f64.ne
    (;218:3;)                      local.get 13
    (;219:4;)                      local.get 13
    (;220:3;)                      f64.ne
    (;221:2;)                      i32.or
    (;222:1;)                      i32.or
    (;223:1;)                      return
    (;224:0;)                    end
    (;225:1;)                    local.get 6
    (;226:2;)                    i32.const 24
    (;227:1;)                    i32.add
    (;228:2;)                    local.get 8
    (;229:3;)                    local.get 1
    (;230:4;)                    local.get 2
    (;231:0;)                    call 64  (reflect.Value).Complex
    (;232:1;)                    local.get 6
    (;233:1;)                    f64.load offset=24
    (;234:0;)                    local.set 12
    (;235:1;)                    local.get 6
    (;236:1;)                    f64.load offset=32
    (;237:0;)                    local.set 13
    (;238:1;)                    local.get 6
    (;239:2;)                    i32.const 8
    (;240:1;)                    i32.add
    (;241:2;)                    local.get 0
    (;242:3;)                    local.get 4
    (;243:4;)                    local.get 5
    (;244:0;)                    call 64  (reflect.Value).Complex
    (;245:1;)                    i32.const 0
    (;246:2;)                    local.get 7
    (;247:0;)                    i32.store offset=70816
    (;248:1;)                    local.get 6
    (;249:1;)                    f64.load offset=16
    (;250:0;)                    local.set 14
    (;251:1;)                    local.get 6
    (;252:1;)                    f64.load offset=8
    (;253:0;)                    local.set 15
    (;254:1;)                    local.get 6
    (;255:2;)                    i32.const 224
    (;256:1;)                    i32.add
    (;257:0;)                    global.set 0
    (;258:1;)                    local.get 12
    (;259:2;)                    local.get 15
    (;260:1;)                    f64.eq
    (;261:2;)                    local.get 13
    (;262:3;)                    local.get 14
    (;263:2;)                    f64.eq
    (;264:1;)                    i32.and
    (;265:1;)                    return
    (;266:0;)                  end
    (;267:1;)                  local.get 6
    (;268:2;)                  i32.const 48
    (;269:1;)                  i32.add
    (;270:2;)                  local.get 8
    (;271:3;)                  local.get 1
    (;272:4;)                  local.get 2
    (;273:0;)                  call 73  (reflect.Value).String
    (;274:1;)                  local.get 6
    (;275:2;)                  i32.const 200
    (;276:1;)                  i32.add
    (;277:2;)                  local.get 6
    (;278:2;)                  i32.load offset=48
    (;279:2;)                  local.tee 9
    (;280:0;)                  i32.store
    (;281:1;)                  local.get 6
    (;282:1;)                  i32.load offset=52
    (;283:0;)                  local.set 8
    (;284:1;)                  local.get 6
    (;285:2;)                  i32.const 40
    (;286:1;)                  i32.add
    (;287:2;)                  local.get 0
    (;288:3;)                  local.get 4
    (;289:4;)                  local.get 5
    (;290:0;)                  call 73  (reflect.Value).String
    (;291:1;)                  local.get 6
    (;292:2;)                  i32.const 204
    (;293:1;)                  i32.add
    (;294:2;)                  local.get 6
    (;295:2;)                  i32.load offset=40
    (;296:2;)                  local.tee 5
    (;297:0;)                  i32.store
    (;298:1;)                  i32.const 0
    (;299:0;)                  local.set 3
    (;300:1;)                  local.get 8
    (;301:2;)                  local.get 6
    (;302:2;)                  i32.load offset=44
    (;303:1;)                  i32.ne
    (;304:0;)                  br_if 5
    (;305:1;)                  i32.const 0
    (;306:0;)                  local.set 1
    (;307:0;)                  loop
    (;308:1;)                    local.get 1
    (;309:2;)                    local.get 8
    (;310:1;)                    i32.ge_s
    (;311:0;)                    br_if 5
    (;312:1;)                    local.get 5
    (;313:2;)                    local.get 1
    (;314:1;)                    i32.add
    (;315:0;)                    local.set 2
    (;316:1;)                    local.get 9
    (;317:2;)                    local.get 1
    (;318:1;)                    i32.add
    (;319:0;)                    local.set 4
    (;320:1;)                    local.get 1
    (;321:2;)                    i32.const 1
    (;322:1;)                    i32.add
    (;323:0;)                    local.set 1
    (;324:1;)                    i32.const 0
    (;325:0;)                    local.set 3
    (;326:1;)                    local.get 4
    (;327:1;)                    i32.load8_u
    (;328:2;)                    local.get 2
    (;329:2;)                    i32.load8_u
    (;330:1;)                    i32.eq
    (;331:0;)                    br_if 0
    (;332:0;)                    br 6
    (;333:0;)                  end
    (;334:0;)                end
    (;335:1;)                local.get 8
    (;336:2;)                local.get 1
    (;337:3;)                local.get 2
    (;338:1;)                call 71  (reflect.Value).Pointer
    (;339:0;)                local.set 1
    (;340:1;)                local.get 0
    (;341:2;)                local.get 4
    (;342:3;)                local.get 5
    (;343:1;)                call 71  (reflect.Value).Pointer
    (;344:0;)                local.set 2
    (;345:1;)                i32.const 0
    (;346:2;)                local.get 7
    (;347:0;)                i32.store offset=70816
    (;348:1;)                local.get 6
    (;349:2;)                i32.const 224
    (;350:1;)                i32.add
    (;351:0;)                global.set 0
    (;352:1;)                local.get 1
    (;353:2;)                local.get 2
    (;354:1;)                i32.eq
    (;355:1;)                return
    (;356:0;)              end
    (;357:1;)              i32.const 67264
    (;358:2;)              i32.const 28
    (;359:0;)              call 106  runtime.runtimePanic
    (;360:0;)              unreachable
    (;361:0;)            end
    (;362:1;)            local.get 6
    (;363:2;)            i32.const 196
    (;364:1;)            i32.add
    (;365:2;)            local.get 6
    (;366:3;)            i32.const 152
    (;367:2;)            i32.add
    (;368:0;)            i32.store
    (;369:1;)            local.get 6
    (;370:2;)            i32.const 160
    (;371:1;)            i32.add
    (;372:0;)            local.set 16
    (;373:1;)            local.get 6
    (;374:2;)            i32.const 216
    (;375:1;)            i32.add
    (;376:0;)            local.set 17
    (;377:1;)            local.get 6
    (;378:2;)            i32.const 220
    (;379:1;)            i32.add
    (;380:0;)            local.set 18
    (;381:1;)            i32.const 0
    (;382:0;)            local.set 9
    (;383:0;)            loop
    (;384:1;)              local.get 16
    (;385:2;)              i32.const 0
    (;386:0;)              i32.store8
    (;387:1;)              local.get 6
    (;388:2;)              i64.const 0
    (;389:0;)              i64.store offset=152
    (;390:1;)              local.get 9
    (;391:2;)              local.get 8
    (;392:3;)              local.get 1
    (;393:4;)              local.get 2
    (;394:2;)              call 66  (reflect.Value).Type
    (;395:2;)              local.tee 3
    (;396:2;)              call 51  (reflect.Type).NumField
    (;397:1;)              i32.ge_s
    (;398:0;)              br_if 2
    (;399:1;)              local.get 6
    (;400:2;)              i32.const 104
    (;401:1;)              i32.add
    (;402:2;)              local.get 3
    (;403:3;)              local.get 1
    (;404:4;)              local.get 2
    (;405:5;)              local.get 9
    (;406:0;)              call 65  (reflect.Value).Field
    (;407:1;)              local.get 17
    (;408:2;)              local.get 6
    (;409:2;)              i32.load offset=108
    (;410:2;)              local.tee 19
    (;411:0;)              i32.store
    (;412:1;)              local.get 6
    (;413:1;)              i32.load8_u offset=112
    (;414:0;)              local.set 20
    (;415:1;)              local.get 6
    (;416:1;)              i32.load offset=104
    (;417:0;)              local.set 21
    (;418:1;)              local.get 6
    (;419:2;)              i32.const 88
    (;420:1;)              i32.add
    (;421:2;)              local.get 0
    (;422:3;)              local.get 4
    (;423:4;)              local.get 5
    (;424:5;)              local.get 9
    (;425:0;)              call 65  (reflect.Value).Field
    (;426:1;)              local.get 18
    (;427:2;)              local.get 6
    (;428:2;)              i32.load offset=92
    (;429:2;)              local.tee 22
    (;430:0;)              i32.store
    (;431:1;)              local.get 9
    (;432:2;)              i32.const 1
    (;433:1;)              i32.add
    (;434:0;)              local.set 9
    (;435:1;)              i32.const 0
    (;436:0;)              local.set 3
    (;437:1;)              local.get 21
    (;438:2;)              local.get 19
    (;439:3;)              local.get 20
    (;440:4;)              local.get 6
    (;441:4;)              i32.load offset=88
    (;442:5;)              local.get 22
    (;443:6;)              local.get 6
    (;444:6;)              i32.load8_u offset=96
    (;445:1;)              call 82  runtime.reflectValueEqual
    (;446:2;)              i32.const 1
    (;447:1;)              i32.and
    (;448:0;)              br_if 0
    (;449:0;)              br 3
    (;450:0;)            end
    (;451:0;)          end
    (;452:1;)          local.get 6
    (;453:2;)          i32.const 184
    (;454:1;)          i32.add
    (;455:2;)          local.get 6
    (;456:3;)          i32.const 152
    (;457:2;)          i32.add
    (;458:0;)          i32.store
    (;459:1;)          i32.const 0
    (;460:0;)          local.set 9
    (;461:1;)          local.get 6
    (;462:2;)          i32.const 208
    (;463:1;)          i32.add
    (;464:0;)          local.set 16
    (;465:1;)          local.get 6
    (;466:2;)          i32.const 212
    (;467:1;)          i32.add
    (;468:0;)          local.set 17
    (;469:0;)          loop
    (;470:1;)            local.get 6
    (;471:2;)            i32.const 152
    (;472:1;)            i32.add
    (;473:2;)            i32.const 8
    (;474:1;)            i32.add
    (;475:2;)            local.get 2
    (;476:0;)            i32.store8
    (;477:1;)            local.get 6
    (;478:2;)            i64.const 0
    (;479:0;)            i64.store offset=152
    (;480:1;)            local.get 6
    (;481:2;)            local.get 1
    (;482:0;)            i32.store offset=156
    (;483:1;)            local.get 6
    (;484:2;)            local.get 8
    (;485:0;)            i32.store offset=152
    (;486:0;)            block
    (;487:0;)              block
    (;488:0;)                block
    (;489:0;)                  block
    (;490:0;)                    block
    (;491:0;)                      block
    (;492:0;)                        block
    (;493:1;)                          local.get 8
    (;494:2;)                          local.get 1
    (;495:3;)                          local.get 2
    (;496:1;)                          call 66  (reflect.Value).Type
    (;497:1;)                          local.tee 3
    (;498:1;)                          call 50  (reflect.Type).Kind
    (;499:2;)                          i32.const -17
    (;500:1;)                          i32.add
    (;501:1;)                          local.tee 19
    (;502:2;)                          i32.const 8
    (;503:1;)                          i32.gt_u
    (;504:0;)                          br_if 0
    (;505:1;)                          local.get 19
    (;506:0;)                          br_table 4 0 2 0 0 4 1 0 3 4
    (;507:0;)                        end
    (;508:1;)                        local.get 6
    (;509:2;)                        i32.const 188
    (;510:1;)                        i32.add
    (;511:2;)                        i32.const 8
    (;512:2;)                        call 59  runtime.alloc
    (;513:2;)                        local.tee 1
    (;514:0;)                        i32.store
    (;515:1;)                        local.get 6
    (;516:2;)                        i32.const 192
    (;517:1;)                        i32.add
    (;518:2;)                        local.get 1
    (;519:0;)                        i32.store
    (;520:1;)                        local.get 1
    (;521:2;)                        i32.const 3
    (;522:0;)                        i32.store offset=4
    (;523:1;)                        local.get 1
    (;524:2;)                        i32.const 66296
    (;525:0;)                        i32.store
    (;526:1;)                        i32.const 3045
    (;527:2;)                        local.get 1
    (;528:0;)                        call 54  runtime._panic
    (;529:0;)                        unreachable
    (;530:0;)                      end
    (;531:1;)                      local.get 3
    (;532:2;)                      local.get 1
    (;533:3;)                      local.get 2
    (;534:1;)                      call 66  (reflect.Value).Type
    (;535:1;)                      call 60  (reflect.Type).Len
    (;536:0;)                      local.set 19
    (;537:0;)                      br 4
    (;538:0;)                    end
    (;539:1;)                    local.get 1
    (;540:1;)                    i32.eqz
    (;541:0;)                    br_if 2
    (;542:1;)                    local.get 1
    (;543:1;)                    i32.load offset=24
    (;544:0;)                    local.set 19
    (;545:0;)                    br 3
    (;546:0;)                  end
    (;547:1;)                  local.get 1
    (;548:1;)                  i32.eqz
    (;549:0;)                  br_if 1
    (;550:1;)                  local.get 1
    (;551:1;)                  i32.load offset=8
    (;552:0;)                  local.set 19
    (;553:0;)                  br 2
    (;554:0;)                end
    (;555:1;)                local.get 1
    (;556:1;)                i32.load offset=4
    (;557:0;)                local.set 19
    (;558:0;)                br 1
    (;559:0;)              end
    (;560:1;)              i32.const 0
    (;561:0;)              local.set 19
    (;562:0;)            end
    (;563:1;)            local.get 9
    (;564:2;)            local.get 19
    (;565:1;)            i32.ge_s
    (;566:0;)            br_if 1
    (;567:1;)            local.get 6
    (;568:2;)            i32.const 72
    (;569:1;)            i32.add
    (;570:2;)            local.get 3
    (;571:3;)            local.get 1
    (;572:4;)            local.get 2
    (;573:5;)            local.get 9
    (;574:0;)            call 69  (reflect.Value).Index
    (;575:1;)            local.get 16
    (;576:2;)            local.get 6
    (;577:2;)            i32.load offset=76
    (;578:2;)            local.tee 19
    (;579:0;)            i32.store
    (;580:1;)            local.get 6
    (;581:1;)            i32.load8_u offset=80
    (;582:0;)            local.set 20
    (;583:1;)            local.get 6
    (;584:1;)            i32.load offset=72
    (;585:0;)            local.set 21
    (;586:1;)            local.get 6
    (;587:2;)            i32.const 56
    (;588:1;)            i32.add
    (;589:2;)            local.get 0
    (;590:3;)            local.get 4
    (;591:4;)            local.get 5
    (;592:5;)            local.get 9
    (;593:0;)            call 69  (reflect.Value).Index
    (;594:1;)            local.get 17
    (;595:2;)            local.get 6
    (;596:2;)            i32.load offset=60
    (;597:2;)            local.tee 22
    (;598:0;)            i32.store
    (;599:1;)            local.get 9
    (;600:2;)            i32.const 1
    (;601:1;)            i32.add
    (;602:0;)            local.set 9
    (;603:1;)            i32.const 0
    (;604:0;)            local.set 3
    (;605:1;)            local.get 21
    (;606:2;)            local.get 19
    (;607:3;)            local.get 20
    (;608:4;)            local.get 6
    (;609:4;)            i32.load offset=56
    (;610:5;)            local.get 22
    (;611:6;)            local.get 6
    (;612:6;)            i32.load8_u offset=64
    (;613:1;)            call 82  runtime.reflectValueEqual
    (;614:2;)            i32.const 1
    (;615:1;)            i32.and
    (;616:0;)            br_if 0
    (;617:0;)            br 2
    (;618:0;)          end
    (;619:0;)        end
    (;620:1;)        i32.const 1
    (;621:0;)        local.set 3
    (;622:0;)      end
    (;623:1;)      i32.const 0
    (;624:2;)      local.get 7
    (;625:0;)      i32.store offset=70816
    (;626:1;)      local.get 6
    (;627:2;)      i32.const 224
    (;628:1;)      i32.add
    (;629:0;)      global.set 0
    (;630:1;)      local.get 3
    (;631:1;)      return
    (;632:0;)    end
    (;633:1;)    local.get 0
    (;634:2;)    local.get 1
    (;635:3;)    local.get 2
    (;636:1;)    call 66  (reflect.Value).Type
    (;637:0;)    local.set 1
    (;638:1;)    local.get 3
    (;639:2;)    local.get 4
    (;640:3;)    local.get 5
    (;641:1;)    call 66  (reflect.Value).Type
    (;642:0;)    local.set 2
    (;643:1;)    i32.const 0
    (;644:2;)    local.get 7
    (;645:0;)    i32.store offset=70816
    (;646:1;)    local.get 6
    (;647:2;)    i32.const 224
    (;648:1;)    i32.add
    (;649:0;)    global.set 0
    (;650:1;)    local.get 1
    (;651:2;)    local.get 2
    (;652:1;)    i32.eq
    (;653:0;)  end
  )

  (func "strconv.bsearch16" (;83;) (type 4) (param (;0;) i32 (;1;) i32 (;2;) i32) (result i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (;0:1;)      i32.const 0
    (;1:0;)      local.set 3
    (;2:1;)      local.get 2
    (;3:2;)      i32.const 65535
    (;4:1;)      i32.and
    (;5:0;)      local.set 4
    (;6:1;)      local.get 1
    (;7:0;)      local.set 2
    (;8:0;)      block
    (;9:0;)        block
    (;10:0;)         loop
    (;11:1;)           local.get 2
    (;12:2;)           local.get 3
    (;13:1;)           i32.le_s
    (;14:0;)           br_if 1
    (;15:1;)           local.get 2
    (;16:2;)           local.get 3
    (;17:1;)           i32.sub
    (;18:2;)           i32.const 2
    (;19:1;)           i32.div_s
    (;20:2;)           local.get 3
    (;21:1;)           i32.add
    (;22:1;)           local.tee 5
    (;23:2;)           local.get 1
    (;24:1;)           i32.ge_u
    (;25:0;)           br_if 2
    (;26:1;)           local.get 2
    (;27:2;)           local.get 5
    (;28:3;)           local.get 0
    (;29:4;)           local.get 5
    (;30:5;)           i32.const 1
    (;31:4;)           i32.shl
    (;32:3;)           i32.add
    (;33:3;)           i32.load16_u
    (;34:4;)           local.get 4
    (;35:3;)           i32.lt_u
    (;36:3;)           local.tee 6
    (;37:1;)           select
    (;38:0;)           local.set 2
    (;39:1;)           local.get 5
    (;40:2;)           i32.const 1
    (;41:1;)           i32.add
    (;42:2;)           local.get 3
    (;43:3;)           local.get 6
    (;44:1;)           select
    (;45:0;)           local.set 3
    (;46:0;)           br 0
    (;47:0;)         end
    (;48:0;)       end
    (;49:1;)       local.get 3
    (;50:1;)       return
    (;51:0;)     end
    (;52:0;)     call 77  runtime.lookupPanic
    (;53:0;)     unreachable
    (;54:0;)   end
  )

  (func "increment" (;84;) (type 6)
    (local (;0;) i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 0
    (;4:0;)      global.set 0
    (;5:1;)      local.get 0
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=16
    (;8:1;)      call 16  github.com/iotaledger/wart/wasplib.NewScContext
    (;9:1;)      local.tee 1
    (;10:2;)     i32.const 66713
    (;11:3;)     i32.const 12
    (;12:0;)     call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;13:1;)     local.get 0
    (;14:2;)     i64.const 0
    (;15:0;)     i64.store offset=24
    (;16:1;)     local.get 0
    (;17:2;)     i32.const 8
    (;18:1;)     i32.add
    (;19:2;)     local.get 1
    (;20:2;)     call 25  (github.com/iotaledger/wart/wasplib.ScContext).State
    (;21:3;)     i32.const 66790
    (;22:4;)     i32.const 7
    (;23:0;)     call 31  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt
    (;24:1;)     local.get 0
    (;25:1;)     i32.load offset=8
    (;26:1;)     local.tee 1
    (;27:2;)     local.get 0
    (;28:2;)     i32.load offset=12
    (;29:2;)     local.tee 2
    (;30:3;)     local.get 1
    (;31:4;)     local.get 2
    (;32:3;)     call 38  (github.com/iotaledger/wart/wasplib.ScMutableInt).Value
    (;33:4;)     i64.const 1
    (;34:3;)     i64.add
    (;35:0;)     call 32  (github.com/iotaledger/wart/wasplib.ScMutableInt).SetValue
    (;36:1;)     local.get 0
    (;37:2;)     i32.const 32
    (;38:1;)     i32.add
    (;39:0;)     global.set 0
    (;40:0;)   end
  )

  (func "incrementRepeat1" (;85;) (type 6)
    (local (;0;) i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i64)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 0
    (;4:0;)      global.set 0
    (;5:1;)      local.get 0
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      local.get 0
    (;9:2;)      call 16  github.com/iotaledger/wart/wasplib.NewScContext
    (;10:2;)     local.tee 1
    (;11:0;)     i32.store offset=8
    (;12:1;)     local.get 1
    (;13:2;)     i32.const 66736
    (;14:3;)     i32.const 19
    (;15:0;)     call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;16:1;)     local.get 0
    (;17:2;)     i64.const 0
    (;18:0;)     i64.store offset=16
    (;19:1;)     local.get 0
    (;20:2;)     local.get 1
    (;21:2;)     call 25  (github.com/iotaledger/wart/wasplib.ScContext).State
    (;22:3;)     i32.const 66790
    (;23:4;)     i32.const 7
    (;24:0;)     call 31  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt
    (;25:1;)     local.get 0
    (;26:2;)     local.get 0
    (;27:2;)     i32.load offset=4
    (;28:2;)     local.tee 2
    (;29:0;)     i32.store offset=20
    (;30:1;)     local.get 0
    (;31:2;)     local.get 0
    (;32:2;)     i32.load
    (;33:2;)     local.tee 3
    (;34:0;)     i32.store offset=16
    (;35:1;)     local.get 3
    (;36:2;)     local.get 2
    (;37:3;)     local.get 3
    (;38:4;)     local.get 2
    (;39:3;)     call 38  (github.com/iotaledger/wart/wasplib.ScMutableInt).Value
    (;40:3;)     local.tee 4
    (;41:4;)     i64.const 1
    (;42:3;)     i64.add
    (;43:0;)     call 32  (github.com/iotaledger/wart/wasplib.ScMutableInt).SetValue
    (;44:0;)     block
    (;45:1;)       local.get 4
    (;46:2;)       i64.const 0
    (;47:1;)       i64.ne
    (;48:0;)       br_if 0
    (;49:1;)       local.get 0
    (;50:2;)       i32.const 0
    (;51:0;)       i32.store offset=24
    (;52:1;)       local.get 0
    (;53:2;)       local.get 1
    (;54:2;)       call 20  (github.com/iotaledger/wart/wasplib.ScContext).Event
    (;55:2;)       local.tee 1
    (;56:0;)       i32.store offset=24
    (;57:1;)       local.get 1
    (;58:2;)       i64.const 2
    (;59:0;)       call 30  (github.com/iotaledger/wart/wasplib.ScEvent).Code
    (;60:1;)       local.get 1
    (;61:2;)       i64.const 5
    (;62:0;)       call 33  (github.com/iotaledger/wart/wasplib.ScEvent).Delay
    (;63:0;)     end
    (;64:1;)     local.get 0
    (;65:2;)     i32.const 32
    (;66:1;)     i32.add
    (;67:0;)     global.set 0
    (;68:0;)   end
  )

  (func "incrementRepeatMany" (;86;) (type 6)
    (local (;0;) i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i64)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 64
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 0
    (;4:0;)      global.set 0
    (;5:1;)      local.get 0
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=32
    (;8:1;)      local.get 0
    (;9:2;)      call 16  github.com/iotaledger/wart/wasplib.NewScContext
    (;10:2;)     local.tee 1
    (;11:0;)     i32.store offset=32
    (;12:1;)     local.get 1
    (;13:2;)     i32.const 66768
    (;14:3;)     i32.const 22
    (;15:0;)     call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;16:1;)     local.get 0
    (;17:2;)     i64.const 0
    (;18:0;)     i64.store offset=40
    (;19:1;)     local.get 0
    (;20:2;)     i32.const 24
    (;21:1;)     i32.add
    (;22:2;)     local.get 1
    (;23:2;)     call 25  (github.com/iotaledger/wart/wasplib.ScContext).State
    (;24:3;)     i32.const 66790
    (;25:4;)     i32.const 7
    (;26:0;)     call 31  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt
    (;27:1;)     local.get 0
    (;28:2;)     local.get 0
    (;29:2;)     i32.load offset=28
    (;30:2;)     local.tee 2
    (;31:0;)     i32.store offset=44
    (;32:1;)     local.get 0
    (;33:2;)     local.get 0
    (;34:2;)     i32.load offset=24
    (;35:2;)     local.tee 3
    (;36:0;)     i32.store offset=40
    (;37:1;)     local.get 3
    (;38:2;)     local.get 2
    (;39:3;)     local.get 3
    (;40:4;)     local.get 2
    (;41:3;)     call 38  (github.com/iotaledger/wart/wasplib.ScMutableInt).Value
    (;42:4;)     i64.const 1
    (;43:3;)     i64.add
    (;44:0;)     call 32  (github.com/iotaledger/wart/wasplib.ScMutableInt).SetValue
    (;45:1;)     local.get 0
    (;46:2;)     i32.const 16
    (;47:1;)     i32.add
    (;48:2;)     local.get 1
    (;49:2;)     call 24  (github.com/iotaledger/wart/wasplib.ScContext).Request
    (;50:2;)     call 46  (github.com/iotaledger/wart/wasplib.ScRequest).Params
    (;51:3;)     i32.const 66797
    (;52:4;)     i32.const 10
    (;53:0;)     call 35  (github.com/iotaledger/wart/wasplib.ScImmutableMap).GetInt
    (;54:1;)     local.get 0
    (;55:1;)     i32.load offset=16
    (;56:2;)     local.get 0
    (;57:2;)     i32.load offset=20
    (;58:1;)     call 34  (github.com/iotaledger/wart/wasplib.ScImmutableInt).Value
    (;59:0;)     local.set 4
    (;60:1;)     local.get 0
    (;61:2;)     i64.const 0
    (;62:0;)     i64.store offset=48
    (;63:1;)     local.get 0
    (;64:2;)     i32.const 8
    (;65:1;)     i32.add
    (;66:2;)     local.get 1
    (;67:2;)     call 25  (github.com/iotaledger/wart/wasplib.ScContext).State
    (;68:3;)     i32.const 66797
    (;69:4;)     i32.const 10
    (;70:0;)     call 31  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt
    (;71:1;)     local.get 0
    (;72:2;)     local.get 0
    (;73:2;)     i32.load offset=12
    (;74:2;)     local.tee 2
    (;75:0;)     i32.store offset=52
    (;76:1;)     local.get 0
    (;77:2;)     local.get 0
    (;78:2;)     i32.load offset=8
    (;79:2;)     local.tee 3
    (;80:0;)     i32.store offset=48
    (;81:0;)     block
    (;82:0;)       block
    (;83:1;)         local.get 4
    (;84:1;)         i64.eqz
    (;85:1;)         i32.eqz
    (;86:0;)         br_if 0
    (;87:1;)         local.get 3
    (;88:2;)         local.get 2
    (;89:1;)         call 38  (github.com/iotaledger/wart/wasplib.ScMutableInt).Value
    (;90:1;)         local.tee 4
    (;91:1;)         i64.eqz
    (;92:0;)         br_if 1
    (;93:0;)       end
    (;94:1;)       local.get 3
    (;95:2;)       local.get 2
    (;96:3;)       local.get 4
    (;97:4;)       i64.const -1
    (;98:3;)       i64.add
    (;99:0;)       call 32  (github.com/iotaledger/wart/wasplib.ScMutableInt).SetValue
    (;100:1;)      local.get 0
    (;101:2;)      i32.const 0
    (;102:0;)      i32.store offset=56
    (;103:1;)      local.get 1
    (;104:1;)      call 20  (github.com/iotaledger/wart/wasplib.ScContext).Event
    (;105:1;)      local.tee 1
    (;106:2;)      i64.const 4
    (;107:0;)      call 30  (github.com/iotaledger/wart/wasplib.ScEvent).Code
    (;108:1;)      local.get 1
    (;109:2;)      i64.const 3
    (;110:0;)      call 33  (github.com/iotaledger/wart/wasplib.ScEvent).Delay
    (;111:1;)      local.get 0
    (;112:2;)      i32.const 64
    (;113:1;)      i32.add
    (;114:0;)      global.set 0
    (;115:0;)      return
    (;116:0;)    end
    (;117:1;)    local.get 0
    (;118:2;)    i32.const 64
    (;119:1;)    i32.add
    (;120:0;)    global.set 0
    (;121:0;)  end
  )

  (func "lockBets" (;87;) (type 6)
    (local (;0;) i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 128
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 0
    (;4:0;)      global.set 0
    (;5:1;)      local.get 0
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=124
    (;8:1;)      local.get 0
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=116 align=2
    (;11:1;)     local.get 0
    (;12:2;)     i64.const 0
    (;13:0;)     i64.store offset=108 align=2
    (;14:1;)     local.get 0
    (;15:2;)     i64.const 0
    (;16:0;)     i64.store offset=100 align=2
    (;17:1;)     local.get 0
    (;18:2;)     i32.const 8
    (;19:0;)     i32.store offset=92
    (;20:1;)     local.get 0
    (;21:2;)     i32.const 0
    (;22:0;)     i32.store offset=48
    (;23:1;)     i32.const 0
    (;24:1;)     i32.load offset=70816
    (;25:0;)     local.set 1
    (;26:1;)     i32.const 0
    (;27:2;)     local.get 0
    (;28:3;)     i32.const 88
    (;29:2;)     i32.add
    (;30:0;)     i32.store offset=70816
    (;31:1;)     local.get 0
    (;32:2;)     local.get 1
    (;33:0;)     i32.store offset=88
    (;34:1;)     local.get 0
    (;35:2;)     local.get 0
    (;36:3;)     i32.const 48
    (;37:2;)     i32.add
    (;38:0;)     i32.store offset=96
    (;39:1;)     local.get 0
    (;40:2;)     call 16  github.com/iotaledger/wart/wasplib.NewScContext
    (;41:2;)     local.tee 2
    (;42:0;)     i32.store offset=48
    (;43:1;)     local.get 2
    (;44:2;)     i32.const 66807
    (;45:3;)     i32.const 12
    (;46:0;)     call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;47:1;)     local.get 0
    (;48:2;)     i32.const 40
    (;49:1;)     i32.add
    (;50:2;)     local.get 2
    (;51:2;)     call 24  (github.com/iotaledger/wart/wasplib.ScContext).Request
    (;52:0;)     call 45  (github.com/iotaledger/wart/wasplib.ScRequest).Address
    (;53:1;)     local.get 0
    (;54:2;)     local.get 0
    (;55:2;)     i32.load offset=40
    (;56:2;)     local.tee 3
    (;57:0;)     i32.store offset=100
    (;58:1;)     local.get 0
    (;59:1;)     i32.load offset=44
    (;60:0;)     local.set 4
    (;61:1;)     local.get 0
    (;62:2;)     i32.const 32
    (;63:1;)     i32.add
    (;64:2;)     local.get 2
    (;65:2;)     call 17  (github.com/iotaledger/wart/wasplib.ScContext).Contract
    (;66:0;)     call 27  (github.com/iotaledger/wart/wasplib.ScContract).Address
    (;67:1;)     local.get 0
    (;68:2;)     local.get 0
    (;69:2;)     i32.load offset=32
    (;70:2;)     local.tee 5
    (;71:0;)     i32.store offset=104
    (;72:0;)     block
    (;73:0;)       block
    (;74:1;)         local.get 4
    (;75:2;)         local.get 0
    (;76:2;)         i32.load offset=36
    (;77:1;)         i32.ne
    (;78:0;)         br_if 0
    (;79:1;)         i32.const 0
    (;80:0;)         local.set 6
    (;81:0;)         loop
    (;82:1;)           local.get 6
    (;83:2;)           local.get 4
    (;84:1;)           i32.ge_s
    (;85:0;)           br_if 2
    (;86:1;)           local.get 5
    (;87:2;)           local.get 6
    (;88:1;)           i32.add
    (;89:0;)           local.set 7
    (;90:1;)           local.get 3
    (;91:2;)           local.get 6
    (;92:1;)           i32.add
    (;93:0;)           local.set 8
    (;94:1;)           local.get 6
    (;95:2;)           i32.const 1
    (;96:1;)           i32.add
    (;97:0;)           local.set 6
    (;98:1;)           local.get 8
    (;99:1;)           i32.load8_u
    (;100:2;)          local.get 7
    (;101:2;)          i32.load8_u
    (;102:1;)          i32.eq
    (;103:0;)          br_if 0
    (;104:0;)        end
    (;105:0;)      end
    (;106:1;)      local.get 2
    (;107:2;)      i32.const 67024
    (;108:3;)      i32.const 22
    (;109:0;)      call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;110:1;)      i32.const 0
    (;111:2;)      local.get 1
    (;112:0;)      i32.store offset=70816
    (;113:1;)      local.get 0
    (;114:2;)      i32.const 128
    (;115:1;)      i32.add
    (;116:0;)      global.set 0
    (;117:0;)      return
    (;118:0;)    end
    (;119:1;)    i32.const 0
    (;120:0;)    local.set 6
    (;121:1;)    local.get 0
    (;122:2;)    i32.const 0
    (;123:0;)    i32.store offset=56
    (;124:1;)    local.get 0
    (;125:2;)    i32.const 108
    (;126:1;)    i32.add
    (;127:2;)    local.get 0
    (;128:3;)    i32.const 56
    (;129:2;)    i32.add
    (;130:0;)    i32.store
    (;131:1;)    local.get 2
    (;132:1;)    call 25  (github.com/iotaledger/wart/wasplib.ScContext).State
    (;133:0;)    local.set 8
    (;134:1;)    local.get 0
    (;135:2;)    i32.const 0
    (;136:0;)    i32.store offset=64
    (;137:1;)    local.get 0
    (;138:2;)    local.get 8
    (;139:0;)    i32.store offset=56
    (;140:1;)    local.get 0
    (;141:2;)    i32.const 112
    (;142:1;)    i32.add
    (;143:2;)    local.get 0
    (;144:3;)    i32.const 64
    (;145:2;)    i32.add
    (;146:0;)    i32.store
    (;147:1;)    local.get 8
    (;148:2;)    i32.const 67004
    (;149:3;)    i32.const 4
    (;150:1;)    call 39  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetStringArray
    (;151:0;)    local.set 7
    (;152:1;)    local.get 0
    (;153:2;)    i32.const 0
    (;154:0;)    i32.store offset=72
    (;155:1;)    local.get 0
    (;156:2;)    local.get 7
    (;157:0;)    i32.store offset=64
    (;158:1;)    local.get 0
    (;159:2;)    i32.const 116
    (;160:1;)    i32.add
    (;161:2;)    local.get 0
    (;162:3;)    i32.const 72
    (;163:2;)    i32.add
    (;164:0;)    i32.store
    (;165:1;)    local.get 0
    (;166:2;)    local.get 8
    (;167:3;)    i32.const 66901
    (;168:4;)    i32.const 10
    (;169:2;)    call 39  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetStringArray
    (;170:2;)    local.tee 3
    (;171:0;)    i32.store offset=72
    (;172:1;)    local.get 0
    (;173:2;)    i32.const 120
    (;174:1;)    i32.add
    (;175:0;)    local.set 5
    (;176:0;)    block
    (;177:0;)      loop
    (;178:1;)        local.get 6
    (;179:2;)        local.get 7
    (;180:2;)        call 44  (github.com/iotaledger/wart/wasplib.ScMutableStringArray).Length
    (;181:1;)        i32.ge_s
    (;182:0;)        br_if 1
    (;183:1;)        local.get 0
    (;184:2;)        i32.const 24
    (;185:1;)        i32.add
    (;186:2;)        local.get 7
    (;187:3;)        local.get 6
    (;188:0;)        call 43  (github.com/iotaledger/wart/wasplib.ScMutableStringArray).GetString
    (;189:1;)        local.get 0
    (;190:2;)        i32.const 16
    (;191:1;)        i32.add
    (;192:2;)        local.get 0
    (;193:2;)        i32.load offset=24
    (;194:3;)        local.get 0
    (;195:3;)        i32.load offset=28
    (;196:0;)        call 41  (github.com/iotaledger/wart/wasplib.ScMutableString).Value
    (;197:1;)        local.get 5
    (;198:2;)        local.get 0
    (;199:2;)        i32.load offset=16
    (;200:2;)        local.tee 8
    (;201:0;)        i32.store
    (;202:1;)        local.get 0
    (;203:1;)        i32.load offset=20
    (;204:0;)        local.set 4
    (;205:1;)        local.get 0
    (;206:2;)        i32.const 8
    (;207:1;)        i32.add
    (;208:2;)        local.get 3
    (;209:3;)        local.get 6
    (;210:0;)        call 43  (github.com/iotaledger/wart/wasplib.ScMutableStringArray).GetString
    (;211:1;)        local.get 0
    (;212:1;)        i32.load offset=8
    (;213:2;)        local.get 0
    (;214:2;)        i32.load offset=12
    (;215:3;)        local.get 8
    (;216:4;)        local.get 4
    (;217:0;)        call 40  (github.com/iotaledger/wart/wasplib.ScMutableString).SetValue
    (;218:1;)        local.get 6
    (;219:2;)        i32.const 1
    (;220:1;)        i32.add
    (;221:0;)        local.set 6
    (;222:0;)        br 0
    (;223:0;)      end
    (;224:0;)    end
    (;225:1;)    local.get 7
    (;226:0;)    call 42  (github.com/iotaledger/wart/wasplib.ScMutableStringArray).Clear
    (;227:1;)    local.get 0
    (;228:2;)    i32.const 124
    (;229:1;)    i32.add
    (;230:2;)    local.get 0
    (;231:3;)    i32.const 80
    (;232:2;)    i32.add
    (;233:0;)    i32.store
    (;234:1;)    local.get 0
    (;235:2;)    i32.const 0
    (;236:0;)    i32.store offset=80
    (;237:1;)    local.get 2
    (;238:1;)    call 20  (github.com/iotaledger/wart/wasplib.ScContext).Event
    (;239:2;)    i64.const 7
    (;240:0;)    call 30  (github.com/iotaledger/wart/wasplib.ScEvent).Code
    (;241:1;)    i32.const 0
    (;242:2;)    local.get 1
    (;243:0;)    i32.store offset=70816
    (;244:1;)    local.get 0
    (;245:2;)    i32.const 128
    (;246:1;)    i32.add
    (;247:0;)    global.set 0
    (;248:0;)  end
  )

  (func "command-line-arguments.main" (;88;) (type 11) (param (;0;) i32 (;1;) i32)
    (;0:0;)    end
  )

  (func "no_op" (;89;) (type 6)
    (local (;0;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 0
    (;4:0;)      global.set 0
    (;5:1;)      local.get 0
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      call 16  github.com/iotaledger/wart/wasplib.NewScContext
    (;9:2;)      i32.const 66832
    (;10:3;)     i32.const 39
    (;11:0;)     call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;12:1;)     local.get 0
    (;13:2;)     i32.const 16
    (;14:1;)     i32.add
    (;15:0;)     global.set 0
    (;16:0;)   end
  )

  (func "payWinners" (;90;) (type 6)
    (local (;0;) i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i64)
    (local (;10;) i64)
    (local (;11;) i32)
    (local (;12;) i32)
    (local (;13;) i64)
    (local (;14;) i32)
    (local (;15;) i32)
    (local (;16;) i32)
    (local (;17;) i32)
    (local (;18;) i32)
    (local (;19;) i32)
    (local (;20;) i32)
    (local (;21;) i32)
    (local (;22;) i32)
    (local (;23;) i32)
    (local (;24;) i32)
    (local (;25;) i32)
    (local (;26;) i32)
    (local (;27;) i32)
    (local (;28;) i32)
    (local (;29;) i64)
    (local (;30;) i32)
    (local (;31;) i32)
    (local (;32;) i32)
    (local (;33;) i32)
    (local (;34;) i32)
    (local (;35;) i32)
    (local (;36;) i64)
    (local (;37;) i32)
    (local (;38;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 352
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 0
    (;4:0;)      global.set 0
    (;5:1;)      local.get 0
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=344
    (;8:1;)      local.get 0
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=336
    (;11:1;)     local.get 0
    (;12:2;)     i64.const 0
    (;13:0;)     i64.store offset=328
    (;14:1;)     local.get 0
    (;15:2;)     i64.const 0
    (;16:0;)     i64.store offset=320
    (;17:1;)     local.get 0
    (;18:2;)     i64.const 0
    (;19:0;)     i64.store offset=312
    (;20:1;)     local.get 0
    (;21:2;)     i64.const 0
    (;22:0;)     i64.store offset=304
    (;23:1;)     local.get 0
    (;24:2;)     i64.const 0
    (;25:0;)     i64.store offset=296
    (;26:1;)     local.get 0
    (;27:2;)     i64.const 0
    (;28:0;)     i64.store offset=288
    (;29:1;)     local.get 0
    (;30:2;)     i64.const 0
    (;31:0;)     i64.store offset=280
    (;32:1;)     local.get 0
    (;33:2;)     i64.const 0
    (;34:0;)     i64.store offset=272
    (;35:1;)     local.get 0
    (;36:2;)     i64.const 0
    (;37:0;)     i64.store offset=264
    (;38:1;)     local.get 0
    (;39:2;)     i64.const 0
    (;40:0;)     i64.store offset=256
    (;41:1;)     local.get 0
    (;42:2;)     i64.const 0
    (;43:0;)     i64.store offset=248
    (;44:1;)     local.get 0
    (;45:2;)     i64.const 0
    (;46:0;)     i64.store offset=240
    (;47:1;)     local.get 0
    (;48:2;)     i64.const 0
    (;49:0;)     i64.store offset=232
    (;50:1;)     local.get 0
    (;51:2;)     i64.const 0
    (;52:0;)     i64.store offset=224
    (;53:1;)     local.get 0
    (;54:2;)     i64.const 0
    (;55:0;)     i64.store offset=216
    (;56:1;)     local.get 0
    (;57:2;)     i64.const 0
    (;58:0;)     i64.store offset=208
    (;59:1;)     local.get 0
    (;60:2;)     i64.const 150323855360
    (;61:0;)     i64.store offset=200
    (;62:1;)     local.get 0
    (;63:2;)     i32.const 0
    (;64:0;)     i32.store offset=152
    (;65:1;)     local.get 0
    (;66:2;)     i32.const 0
    (;67:2;)     i32.load offset=70816
    (;68:2;)     local.tee 1
    (;69:0;)     i32.store offset=200
    (;70:1;)     i32.const 0
    (;71:2;)     local.get 0
    (;72:3;)     i32.const 200
    (;73:2;)     i32.add
    (;74:0;)     i32.store offset=70816
    (;75:1;)     local.get 0
    (;76:2;)     local.get 0
    (;77:3;)     i32.const 152
    (;78:2;)     i32.add
    (;79:0;)     i32.store offset=208
    (;80:1;)     local.get 0
    (;81:2;)     call 16  github.com/iotaledger/wart/wasplib.NewScContext
    (;82:2;)     local.tee 2
    (;83:0;)     i32.store offset=152
    (;84:1;)     local.get 2
    (;85:2;)     i32.const 66871
    (;86:3;)     i32.const 14
    (;87:0;)     call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;88:1;)     local.get 0
    (;89:2;)     i32.const 144
    (;90:1;)     i32.add
    (;91:2;)     local.get 2
    (;92:2;)     call 17  (github.com/iotaledger/wart/wasplib.ScContext).Contract
    (;93:0;)     call 27  (github.com/iotaledger/wart/wasplib.ScContract).Address
    (;94:1;)     local.get 0
    (;95:2;)     local.get 0
    (;96:2;)     i32.load offset=144
    (;97:2;)     local.tee 3
    (;98:0;)     i32.store offset=212
    (;99:1;)     local.get 0
    (;100:1;)    i32.load offset=148
    (;101:0;)    local.set 4
    (;102:1;)    local.get 0
    (;103:2;)    i32.const 136
    (;104:1;)    i32.add
    (;105:2;)    local.get 2
    (;106:2;)    call 24  (github.com/iotaledger/wart/wasplib.ScContext).Request
    (;107:0;)    call 45  (github.com/iotaledger/wart/wasplib.ScRequest).Address
    (;108:1;)    local.get 0
    (;109:2;)    local.get 0
    (;110:2;)    i32.load offset=136
    (;111:2;)    local.tee 5
    (;112:0;)    i32.store offset=216
    (;113:0;)    block
    (;114:0;)      block
    (;115:1;)        local.get 4
    (;116:2;)        local.get 0
    (;117:2;)        i32.load offset=140
    (;118:1;)        i32.ne
    (;119:0;)        br_if 0
    (;120:1;)        i32.const 0
    (;121:0;)        local.set 6
    (;122:0;)        loop
    (;123:1;)          local.get 6
    (;124:2;)          local.get 4
    (;125:1;)          i32.ge_s
    (;126:0;)          br_if 2
    (;127:1;)          local.get 3
    (;128:2;)          local.get 6
    (;129:1;)          i32.add
    (;130:0;)          local.set 7
    (;131:1;)          local.get 5
    (;132:2;)          local.get 6
    (;133:1;)          i32.add
    (;134:0;)          local.set 8
    (;135:1;)          local.get 6
    (;136:2;)          i32.const 1
    (;137:1;)          i32.add
    (;138:0;)          local.set 6
    (;139:1;)          local.get 8
    (;140:1;)          i32.load8_u
    (;141:2;)          local.get 7
    (;142:2;)          i32.load8_u
    (;143:1;)          i32.eq
    (;144:0;)          br_if 0
    (;145:0;)        end
    (;146:0;)      end
    (;147:1;)      local.get 2
    (;148:2;)      i32.const 67024
    (;149:3;)      i32.const 22
    (;150:0;)      call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;151:1;)      i32.const 0
    (;152:2;)      local.get 1
    (;153:0;)      i32.store offset=70816
    (;154:1;)      local.get 0
    (;155:2;)      i32.const 352
    (;156:1;)      i32.add
    (;157:0;)      global.set 0
    (;158:0;)      return
    (;159:0;)    end
    (;160:1;)    local.get 0
    (;161:2;)    i32.const 264
    (;162:1;)    i32.add
    (;163:2;)    local.get 0
    (;164:3;)    i32.const 192
    (;165:2;)    i32.add
    (;166:0;)    i32.store
    (;167:1;)    local.get 0
    (;168:2;)    i32.const 0
    (;169:0;)    i32.store offset=192
    (;170:1;)    local.get 0
    (;171:2;)    i32.const 128
    (;172:1;)    i32.add
    (;173:2;)    local.get 2
    (;174:3;)    i32.const 65564
    (;175:4;)    i32.const 6
    (;176:0;)    call 31  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt
    (;177:1;)    local.get 0
    (;178:1;)    i32.load offset=128
    (;179:2;)    local.get 0
    (;180:2;)    i32.load offset=132
    (;181:1;)    call 38  (github.com/iotaledger/wart/wasplib.ScMutableInt).Value
    (;182:0;)    local.set 9
    (;183:1;)    local.get 0
    (;184:2;)    i32.const 0
    (;185:0;)    i32.store offset=160
    (;186:1;)    local.get 0
    (;187:2;)    i32.const 268
    (;188:1;)    i32.add
    (;189:2;)    local.get 0
    (;190:3;)    i32.const 160
    (;191:2;)    i32.add
    (;192:0;)    i32.store
    (;193:1;)    local.get 0
    (;194:2;)    local.get 2
    (;195:2;)    call 25  (github.com/iotaledger/wart/wasplib.ScContext).State
    (;196:2;)    local.tee 6
    (;197:0;)    i32.store offset=160
    (;198:1;)    local.get 0
    (;199:2;)    i32.const 120
    (;200:1;)    i32.add
    (;201:2;)    local.get 6
    (;202:3;)    i32.const 66885
    (;203:4;)    i32.const 16
    (;204:0;)    call 31  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt
    (;205:1;)    local.get 0
    (;206:1;)    i32.load offset=120
    (;207:2;)    local.get 0
    (;208:2;)    i32.load offset=124
    (;209:3;)    local.get 9
    (;210:4;)    i64.const 5
    (;211:3;)    i64.rem_u
    (;212:4;)    i64.const 1
    (;213:3;)    i64.add
    (;214:3;)    local.tee 10
    (;215:0;)    call 32  (github.com/iotaledger/wart/wasplib.ScMutableInt).SetValue
    (;216:1;)    local.get 0
    (;217:2;)    i32.const 272
    (;218:1;)    i32.add
    (;219:2;)    local.get 0
    (;220:3;)    i32.const 168
    (;221:2;)    i32.add
    (;222:0;)    i32.store
    (;223:1;)    local.get 0
    (;224:2;)    i32.const 0
    (;225:0;)    i32.store offset=168
    (;226:1;)    local.get 0
    (;227:2;)    local.get 6
    (;228:3;)    i32.const 66901
    (;229:4;)    i32.const 10
    (;230:2;)    call 39  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetStringArray
    (;231:2;)    local.tee 11
    (;232:0;)    i32.store offset=168
    (;233:1;)    local.get 0
    (;234:2;)    i32.const 276
    (;235:1;)    i32.add
    (;236:2;)    i32.const 0
    (;237:2;)    call 59  runtime.alloc
    (;238:2;)    local.tee 12
    (;239:0;)    i32.store
    (;240:1;)    local.get 0
    (;241:2;)    i32.const 332
    (;242:1;)    i32.add
    (;243:2;)    local.get 0
    (;244:3;)    i32.const 188
    (;245:2;)    i32.add
    (;246:0;)    i32.store
    (;247:1;)    i64.const 0
    (;248:0;)    local.set 13
    (;249:1;)    local.get 0
    (;250:2;)    i32.const 220
    (;251:1;)    i32.add
    (;252:0;)    local.set 14
    (;253:1;)    local.get 0
    (;254:2;)    i32.const 280
    (;255:1;)    i32.add
    (;256:0;)    local.set 15
    (;257:1;)    local.get 0
    (;258:2;)    i32.const 292
    (;259:1;)    i32.add
    (;260:0;)    local.set 16
    (;261:1;)    local.get 0
    (;262:2;)    i32.const 296
    (;263:1;)    i32.add
    (;264:0;)    local.set 17
    (;265:1;)    local.get 0
    (;266:2;)    i32.const 288
    (;267:1;)    i32.add
    (;268:0;)    local.set 18
    (;269:1;)    local.get 0
    (;270:2;)    i32.const 284
    (;271:1;)    i32.add
    (;272:0;)    local.set 19
    (;273:1;)    local.get 0
    (;274:2;)    i32.const 300
    (;275:1;)    i32.add
    (;276:0;)    local.set 20
    (;277:1;)    local.get 0
    (;278:2;)    i32.const 304
    (;279:1;)    i32.add
    (;280:0;)    local.set 21
    (;281:1;)    local.get 0
    (;282:2;)    i32.const 308
    (;283:1;)    i32.add
    (;284:0;)    local.set 22
    (;285:1;)    local.get 0
    (;286:2;)    i32.const 312
    (;287:1;)    i32.add
    (;288:0;)    local.set 23
    (;289:1;)    local.get 0
    (;290:2;)    i32.const 316
    (;291:1;)    i32.add
    (;292:0;)    local.set 24
    (;293:1;)    local.get 0
    (;294:2;)    i32.const 328
    (;295:1;)    i32.add
    (;296:0;)    local.set 25
    (;297:1;)    local.get 0
    (;298:2;)    i32.const 320
    (;299:1;)    i32.add
    (;300:0;)    local.set 26
    (;301:1;)    local.get 0
    (;302:2;)    i32.const 336
    (;303:1;)    i32.add
    (;304:0;)    local.set 27
    (;305:1;)    local.get 0
    (;306:2;)    i32.const 224
    (;307:1;)    i32.add
    (;308:0;)    local.set 28
    (;309:1;)    i64.const 0
    (;310:0;)    local.set 29
    (;311:1;)    i32.const 0
    (;312:0;)    local.set 30
    (;313:1;)    i32.const 0
    (;314:0;)    local.set 31
    (;315:1;)    i32.const 0
    (;316:0;)    local.set 32
    (;317:0;)    block
    (;318:0;)      loop
    (;319:1;)        local.get 14
    (;320:2;)        local.get 12
    (;321:0;)        i32.store
    (;322:0;)        block
    (;323:0;)          block
    (;324:0;)            block
    (;325:0;)              block
    (;326:1;)                local.get 32
    (;327:2;)                local.get 11
    (;328:2;)                call 44  (github.com/iotaledger/wart/wasplib.ScMutableStringArray).Length
    (;329:1;)                i32.ge_s
    (;330:0;)                br_if 0
    (;331:1;)                local.get 0
    (;332:2;)                i32.const 64
    (;333:1;)                i32.add
    (;334:2;)                local.get 11
    (;335:3;)                local.get 32
    (;336:0;)                call 43  (github.com/iotaledger/wart/wasplib.ScMutableStringArray).GetString
    (;337:1;)                local.get 0
    (;338:2;)                i32.const 56
    (;339:1;)                i32.add
    (;340:2;)                local.get 0
    (;341:2;)                i32.load offset=64
    (;342:3;)                local.get 0
    (;343:3;)                i32.load offset=68
    (;344:0;)                call 41  (github.com/iotaledger/wart/wasplib.ScMutableString).Value
    (;345:1;)                local.get 15
    (;346:2;)                local.get 0
    (;347:2;)                i32.load offset=56
    (;348:2;)                local.tee 5
    (;349:0;)                i32.store
    (;350:1;)                i32.const 0
    (;351:0;)                local.set 8
    (;352:1;)                local.get 0
    (;353:1;)                i32.load offset=60
    (;354:0;)                local.set 7
    (;355:1;)                i32.const 0
    (;356:0;)                local.set 6
    (;357:0;)                block
    (;358:0;)                  loop
    (;359:1;)                    local.get 6
    (;360:2;)                    local.get 7
    (;361:1;)                    i32.ge_s
    (;362:0;)                    br_if 1
    (;363:1;)                    local.get 8
    (;364:2;)                    local.get 5
    (;365:3;)                    local.get 6
    (;366:2;)                    i32.add
    (;367:2;)                    i32.load8_u
    (;368:3;)                    i32.const 124
    (;369:2;)                    i32.eq
    (;370:1;)                    i32.add
    (;371:0;)                    local.set 8
    (;372:1;)                    local.get 6
    (;373:2;)                    i32.const 1
    (;374:1;)                    i32.add
    (;375:0;)                    local.set 6
    (;376:0;)                    br 0
    (;377:0;)                  end
    (;378:0;)                end
    (;379:1;)                local.get 8
    (;380:2;)                i32.const 1
    (;381:1;)                i32.add
    (;382:1;)                local.tee 33
    (;383:2;)                i32.const 0
    (;384:1;)                i32.lt_s
    (;385:0;)                br_if 2
    (;386:1;)                local.get 16
    (;387:2;)                local.get 33
    (;388:3;)                i32.const 3
    (;389:2;)                i32.shl
    (;390:2;)                call 59  runtime.alloc
    (;391:2;)                local.tee 34
    (;392:0;)                i32.store
    (;393:1;)                local.get 17
    (;394:2;)                local.get 34
    (;395:0;)                i32.store
    (;396:1;)                local.get 18
    (;397:2;)                local.get 34
    (;398:0;)                i32.store
    (;399:1;)                i32.const 0
    (;400:0;)                local.set 35
    (;401:0;)                br 1
    (;402:0;)              end
    (;403:1;)              local.get 11
    (;404:0;)              call 42  (github.com/iotaledger/wart/wasplib.ScMutableStringArray).Clear
    (;405:0;)              block
    (;406:1;)                local.get 30
    (;407:1;)                i32.eqz
    (;408:0;)                br_if 0
    (;409:1;)                local.get 0
    (;410:2;)                i32.const 228
    (;411:1;)                i32.add
    (;412:2;)                local.get 0
    (;413:3;)                i32.const 184
    (;414:2;)                i32.add
    (;415:0;)                i32.store
    (;416:1;)                i64.const 0
    (;417:0;)                local.set 36
    (;418:1;)                local.get 0
    (;419:2;)                i32.const 344
    (;420:1;)                i32.add
    (;421:0;)                local.set 37
    (;422:1;)                local.get 0
    (;423:2;)                i32.const 236
    (;424:1;)                i32.add
    (;425:0;)                local.set 34
    (;426:1;)                local.get 0
    (;427:2;)                i32.const 240
    (;428:1;)                i32.add
    (;429:0;)                local.set 35
    (;430:1;)                local.get 0
    (;431:2;)                i32.const 244
    (;432:1;)                i32.add
    (;433:0;)                local.set 32
    (;434:1;)                local.get 0
    (;435:2;)                i32.const 248
    (;436:1;)                i32.add
    (;437:0;)                local.set 33
    (;438:1;)                local.get 0
    (;439:2;)                i32.const 252
    (;440:1;)                i32.add
    (;441:0;)                local.set 11
    (;442:1;)                local.get 0
    (;443:2;)                i32.const 232
    (;444:1;)                i32.add
    (;445:0;)                local.set 19
    (;446:1;)                i32.const 0
    (;447:0;)                local.set 7
    (;448:0;)                loop
    (;449:0;)                  block
    (;450:1;)                    local.get 7
    (;451:2;)                    local.get 30
    (;452:1;)                    i32.lt_s
    (;453:0;)                    br_if 0
    (;454:0;)                    block
    (;455:1;)                      local.get 13
    (;456:2;)                      local.get 36
    (;457:1;)                      i64.eq
    (;458:0;)                      br_if 0
    (;459:1;)                      local.get 0
    (;460:2;)                      i32.const 112
    (;461:1;)                      i32.add
    (;462:2;)                      local.get 13
    (;463:3;)                      local.get 36
    (;464:2;)                      i64.sub
    (;465:0;)                      call 76  strconv.FormatInt
    (;466:1;)                      local.get 0
    (;467:2;)                      i32.const 256
    (;468:1;)                      i32.add
    (;469:2;)                      local.get 0
    (;470:2;)                      i32.load offset=112
    (;471:2;)                      local.tee 6
    (;472:0;)                      i32.store
    (;473:1;)                      local.get 0
    (;474:2;)                      i32.const 104
    (;475:1;)                      i32.add
    (;476:2;)                      i32.const 66931
    (;477:3;)                      i32.const 13
    (;478:4;)                      local.get 6
    (;479:5;)                      local.get 0
    (;480:5;)                      i32.load offset=116
    (;481:0;)                      call 91  runtime.stringConcat
    (;482:1;)                      local.get 0
    (;483:2;)                      i32.const 260
    (;484:1;)                      i32.add
    (;485:2;)                      local.get 0
    (;486:2;)                      i32.load offset=104
    (;487:2;)                      local.tee 6
    (;488:0;)                      i32.store
    (;489:1;)                      local.get 2
    (;490:2;)                      local.get 6
    (;491:3;)                      local.get 0
    (;492:3;)                      i32.load offset=108
    (;493:0;)                      call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;494:0;)                    end
    (;495:1;)                    i32.const 0
    (;496:2;)                    local.get 1
    (;497:0;)                    i32.store offset=70816
    (;498:1;)                    local.get 0
    (;499:2;)                    i32.const 352
    (;500:1;)                    i32.add
    (;501:0;)                    global.set 0
    (;502:0;)                    return
    (;503:0;)                  end
    (;504:1;)                  local.get 37
    (;505:2;)                  local.get 12
    (;506:2;)                  i32.load
    (;507:2;)                  local.tee 6
    (;508:0;)                  i32.store
    (;509:0;)                  block
    (;510:1;)                    local.get 6
    (;511:1;)                    i32.eqz
    (;512:0;)                    br_if 0
    (;513:0;)                    block
    (;514:1;)                      local.get 6
    (;515:1;)                      i64.load offset=24
    (;516:2;)                      local.get 13
    (;517:1;)                      i64.mul
    (;518:2;)                      local.get 29
    (;519:1;)                      i64.div_s
    (;520:1;)                      local.tee 9
    (;521:1;)                      i64.eqz
    (;522:0;)                      br_if 0
    (;523:1;)                      local.get 0
    (;524:2;)                      i32.const 0
    (;525:0;)                      i32.store offset=184
    (;526:1;)                      local.get 2
    (;527:2;)                      local.get 7
    (;528:1;)                      call 26  (github.com/iotaledger/wart/wasplib.ScContext).Transfer
    (;529:0;)                      local.set 8
    (;530:1;)                      local.get 19
    (;531:2;)                      local.get 6
    (;532:2;)                      i32.load offset=8
    (;533:2;)                      local.tee 5
    (;534:0;)                      i32.store
    (;535:1;)                      local.get 0
    (;536:2;)                      local.get 8
    (;537:0;)                      i32.store offset=184
    (;538:1;)                      local.get 8
    (;539:2;)                      local.get 5
    (;540:3;)                      local.get 6
    (;541:4;)                      i32.const 12
    (;542:3;)                      i32.add
    (;543:3;)                      i32.load
    (;544:0;)                      call 47  (github.com/iotaledger/wart/wasplib.ScTransfer).Address
    (;545:1;)                      local.get 8
    (;546:2;)                      local.get 9
    (;547:0;)                      call 48  (github.com/iotaledger/wart/wasplib.ScTransfer).Amount
    (;548:1;)                      local.get 9
    (;549:2;)                      local.get 36
    (;550:1;)                      i64.add
    (;551:0;)                      local.set 36
    (;552:0;)                    end
    (;553:1;)                    local.get 0
    (;554:2;)                    i32.const 96
    (;555:1;)                    i32.add
    (;556:2;)                    local.get 9
    (;557:0;)                    call 76  strconv.FormatInt
    (;558:1;)                    local.get 34
    (;559:2;)                    local.get 0
    (;560:2;)                    i32.load offset=96
    (;561:2;)                    local.tee 8
    (;562:0;)                    i32.store
    (;563:1;)                    local.get 0
    (;564:2;)                    i32.const 88
    (;565:1;)                    i32.add
    (;566:2;)                    i32.const 66923
    (;567:3;)                    i32.const 4
    (;568:4;)                    local.get 8
    (;569:5;)                    local.get 0
    (;570:5;)                    i32.load offset=100
    (;571:0;)                    call 91  runtime.stringConcat
    (;572:1;)                    local.get 35
    (;573:2;)                    local.get 0
    (;574:2;)                    i32.load offset=88
    (;575:2;)                    local.tee 8
    (;576:0;)                    i32.store
    (;577:1;)                    local.get 0
    (;578:2;)                    i32.const 80
    (;579:1;)                    i32.add
    (;580:2;)                    local.get 8
    (;581:3;)                    local.get 0
    (;582:3;)                    i32.load offset=92
    (;583:4;)                    i32.const 66927
    (;584:5;)                    i32.const 4
    (;585:0;)                    call 91  runtime.stringConcat
    (;586:1;)                    local.get 32
    (;587:2;)                    local.get 0
    (;588:2;)                    i32.load offset=80
    (;589:2;)                    local.tee 8
    (;590:0;)                    i32.store
    (;591:1;)                    local.get 33
    (;592:2;)                    local.get 6
    (;593:2;)                    i32.load offset=8
    (;594:2;)                    local.tee 5
    (;595:0;)                    i32.store
    (;596:1;)                    local.get 0
    (;597:2;)                    i32.const 72
    (;598:1;)                    i32.add
    (;599:2;)                    local.get 8
    (;600:3;)                    local.get 0
    (;601:3;)                    i32.load offset=84
    (;602:4;)                    local.get 5
    (;603:5;)                    local.get 6
    (;604:6;)                    i32.const 12
    (;605:5;)                    i32.add
    (;606:5;)                    i32.load
    (;607:0;)                    call 91  runtime.stringConcat
    (;608:1;)                    local.get 11
    (;609:2;)                    local.get 0
    (;610:2;)                    i32.load offset=72
    (;611:2;)                    local.tee 6
    (;612:0;)                    i32.store
    (;613:1;)                    local.get 2
    (;614:2;)                    local.get 6
    (;615:3;)                    local.get 0
    (;616:3;)                    i32.load offset=76
    (;617:0;)                    call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;618:1;)                    local.get 12
    (;619:2;)                    i32.const 4
    (;620:1;)                    i32.add
    (;621:0;)                    local.set 12
    (;622:1;)                    local.get 7
    (;623:2;)                    i32.const 1
    (;624:1;)                    i32.add
    (;625:0;)                    local.set 7
    (;626:0;)                    br 1
    (;627:0;)                  end
    (;628:0;)                end
    (;629:0;)                call 72  runtime.nilPanic
    (;630:0;)                unreachable
    (;631:0;)              end
    (;632:1;)              local.get 2
    (;633:2;)              i32.const 66911
    (;634:3;)              i32.const 12
    (;635:0;)              call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;636:1;)              local.get 0
    (;637:2;)              i32.const 340
    (;638:1;)              i32.add
    (;639:2;)              local.get 0
    (;640:3;)              i32.const 176
    (;641:2;)              i32.add
    (;642:0;)              i32.store
    (;643:1;)              local.get 0
    (;644:2;)              i32.const 0
    (;645:0;)              i32.store offset=176
    (;646:1;)              local.get 2
    (;647:2;)              i32.const 0
    (;648:1;)              call 26  (github.com/iotaledger/wart/wasplib.ScContext).Transfer
    (;649:1;)              local.tee 6
    (;650:2;)              local.get 3
    (;651:3;)              local.get 4
    (;652:0;)              call 47  (github.com/iotaledger/wart/wasplib.ScTransfer).Address
    (;653:1;)              local.get 6
    (;654:2;)              local.get 13
    (;655:0;)              call 48  (github.com/iotaledger/wart/wasplib.ScTransfer).Amount
    (;656:1;)              i32.const 0
    (;657:2;)              local.get 1
    (;658:0;)              i32.store offset=70816
    (;659:1;)              local.get 0
    (;660:2;)              i32.const 352
    (;661:1;)              i32.add
    (;662:0;)              global.set 0
    (;663:0;)              return
    (;664:0;)            end
    (;665:0;)            loop
    (;666:1;)              local.get 19
    (;667:2;)              local.get 5
    (;668:0;)              i32.store
    (;669:1;)              local.get 35
    (;670:2;)              local.get 8
    (;671:1;)              i32.ge_s
    (;672:0;)              br_if 2
    (;673:1;)              i32.const 0
    (;674:0;)              local.set 6
    (;675:0;)              loop
    (;676:1;)                local.get 6
    (;677:2;)                local.get 7
    (;678:1;)                i32.ge_s
    (;679:0;)                br_if 3
    (;680:0;)                block
    (;681:1;)                  local.get 5
    (;682:2;)                  local.get 6
    (;683:1;)                  i32.add
    (;684:1;)                  local.tee 37
    (;685:1;)                  i32.load8_u
    (;686:2;)                  i32.const 124
    (;687:1;)                  i32.ne
    (;688:0;)                  br_if 0
    (;689:1;)                  local.get 35
    (;690:2;)                  local.get 33
    (;691:1;)                  i32.eq
    (;692:0;)                  br_if 6
    (;693:1;)                  local.get 6
    (;694:2;)                  local.get 7
    (;695:1;)                  i32.gt_u
    (;696:0;)                  br_if 3
    (;697:1;)                  local.get 34
    (;698:2;)                  local.get 35
    (;699:3;)                  i32.const 3
    (;700:2;)                  i32.shl
    (;701:1;)                  i32.add
    (;702:1;)                  local.tee 38
    (;703:2;)                  local.get 6
    (;704:0;)                  i32.store offset=4
    (;705:1;)                  local.get 38
    (;706:2;)                  local.get 5
    (;707:0;)                  i32.store
    (;708:1;)                  local.get 7
    (;709:2;)                  local.get 6
    (;710:1;)                  i32.le_u
    (;711:0;)                  br_if 3
    (;712:1;)                  local.get 35
    (;713:2;)                  i32.const 1
    (;714:1;)                  i32.add
    (;715:0;)                  local.set 35
    (;716:1;)                  local.get 6
    (;717:2;)                  i32.const -1
    (;718:1;)                  i32.xor
    (;719:2;)                  local.get 7
    (;720:1;)                  i32.add
    (;721:0;)                  local.set 7
    (;722:1;)                  local.get 37
    (;723:2;)                  i32.const 1
    (;724:1;)                  i32.add
    (;725:0;)                  local.set 5
    (;726:0;)                  br 2
    (;727:0;)                end
    (;728:1;)                local.get 6
    (;729:2;)                i32.const 1
    (;730:1;)                i32.add
    (;731:0;)                local.set 6
    (;732:0;)                br 0
    (;733:0;)              end
    (;734:0;)            end
    (;735:0;)          end
    (;736:0;)          call 92  runtime.slicePanic
    (;737:0;)          unreachable
    (;738:0;)        end
    (;739:1;)        local.get 35
    (;740:2;)        local.get 33
    (;741:1;)        i32.ge_u
    (;742:0;)        br_if 1
    (;743:1;)        local.get 34
    (;744:2;)        local.get 35
    (;745:3;)        i32.const 3
    (;746:2;)        i32.shl
    (;747:1;)        i32.add
    (;748:1;)        local.tee 6
    (;749:2;)        local.get 7
    (;750:0;)        i32.store offset=4
    (;751:1;)        local.get 6
    (;752:2;)        local.get 5
    (;753:0;)        i32.store
    (;754:1;)        local.get 35
    (;755:2;)        i32.const 1
    (;756:1;)        i32.le_u
    (;757:0;)        br_if 1
    (;758:1;)        local.get 20
    (;759:2;)        local.get 34
    (;760:2;)        i32.load offset=16
    (;761:2;)        local.tee 6
    (;762:0;)        i32.store
    (;763:1;)        local.get 0
    (;764:2;)        i32.const 40
    (;765:1;)        i32.add
    (;766:2;)        local.get 6
    (;767:3;)        local.get 34
    (;768:3;)        i32.load offset=20
    (;769:0;)        call 78  strconv.ParseInt
    (;770:1;)        local.get 21
    (;771:2;)        local.get 0
    (;772:2;)        i32.load offset=52
    (;773:0;)        i32.store
    (;774:1;)        local.get 35
    (;775:2;)        i32.const 2
    (;776:1;)        i32.eq
    (;777:0;)        br_if 1
    (;778:1;)        local.get 0
    (;779:1;)        i64.load offset=40
    (;780:0;)        local.set 36
    (;781:1;)        local.get 22
    (;782:2;)        local.get 34
    (;783:2;)        i32.load offset=24
    (;784:2;)        local.tee 6
    (;785:0;)        i32.store
    (;786:1;)        local.get 0
    (;787:2;)        i32.const 24
    (;788:1;)        i32.add
    (;789:2;)        local.get 6
    (;790:3;)        local.get 34
    (;791:3;)        i32.load offset=28
    (;792:0;)        call 78  strconv.ParseInt
    (;793:1;)        local.get 23
    (;794:2;)        local.get 0
    (;795:2;)        i32.load offset=36
    (;796:0;)        i32.store
    (;797:1;)        local.get 0
    (;798:1;)        i64.load offset=24
    (;799:0;)        local.set 9
    (;800:1;)        local.get 24
    (;801:2;)        i32.const 32
    (;802:2;)        call 59  runtime.alloc
    (;803:2;)        local.tee 6
    (;804:0;)        i32.store
    (;805:1;)        local.get 25
    (;806:2;)        local.get 6
    (;807:0;)        i32.store
    (;808:1;)        local.get 6
    (;809:2;)        local.get 9
    (;810:0;)        i64.store offset=24
    (;811:1;)        local.get 6
    (;812:2;)        local.get 36
    (;813:0;)        i64.store offset=16
    (;814:1;)        local.get 26
    (;815:2;)        local.get 34
    (;816:2;)        i32.load
    (;817:2;)        local.tee 7
    (;818:0;)        i32.store
    (;819:1;)        local.get 0
    (;820:2;)        i32.const 200
    (;821:1;)        i32.add
    (;822:2;)        i32.const 124
    (;823:1;)        i32.add
    (;824:2;)        local.get 34
    (;825:2;)        i32.load offset=8
    (;826:2;)        local.tee 8
    (;827:0;)        i32.store
    (;828:1;)        local.get 6
    (;829:2;)        local.get 34
    (;830:2;)        i32.load offset=12
    (;831:0;)        i32.store offset=12
    (;832:1;)        local.get 6
    (;833:2;)        local.get 8
    (;834:0;)        i32.store offset=8
    (;835:1;)        local.get 6
    (;836:2;)        local.get 34
    (;837:2;)        i32.load offset=4
    (;838:0;)        i32.store offset=4
    (;839:1;)        local.get 6
    (;840:2;)        local.get 7
    (;841:0;)        i32.store
    (;842:0;)        block
    (;843:1;)          local.get 36
    (;844:2;)          local.get 10
    (;845:1;)          i64.ne
    (;846:0;)          br_if 0
    (;847:1;)          local.get 0
    (;848:2;)          local.get 6
    (;849:0;)          i32.store offset=188
    (;850:1;)          local.get 0
    (;851:2;)          i32.const 8
    (;852:1;)          i32.add
    (;853:2;)          local.get 12
    (;854:3;)          local.get 0
    (;855:4;)          i32.const 188
    (;856:3;)          i32.add
    (;857:4;)          local.get 30
    (;858:5;)          local.get 31
    (;859:6;)          i32.const 1
    (;860:7;)          i32.const 4
    (;861:0;)          call 13  runtime.sliceAppend
    (;862:1;)          local.get 27
    (;863:2;)          local.get 0
    (;864:2;)          i32.load offset=8
    (;865:2;)          local.tee 12
    (;866:0;)          i32.store
    (;867:1;)          local.get 9
    (;868:2;)          local.get 29
    (;869:1;)          i64.add
    (;870:0;)          local.set 29
    (;871:1;)          local.get 0
    (;872:1;)          i32.load offset=16
    (;873:0;)          local.set 31
    (;874:1;)          local.get 0
    (;875:1;)          i32.load offset=12
    (;876:0;)          local.set 30
    (;877:0;)        end
    (;878:1;)        local.get 9
    (;879:2;)        local.get 13
    (;880:1;)        i64.add
    (;881:0;)        local.set 13
    (;882:1;)        local.get 28
    (;883:2;)        local.get 12
    (;884:0;)        i32.store
    (;885:1;)        local.get 32
    (;886:2;)        i32.const 1
    (;887:1;)        i32.add
    (;888:0;)        local.set 32
    (;889:0;)        br 0
    (;890:0;)      end
    (;891:0;)    end
    (;892:0;)    call 77  runtime.lookupPanic
    (;893:0;)    unreachable
    (;894:0;)  end
  )

  (func "runtime.stringConcat" (;91;) (type 14) (param (;0;) i32 (;1;) i32 (;2;) i32 (;3;) i32 (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 64
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 5
    (;4:0;)      global.set 0
    (;5:1;)      local.get 5
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=56
    (;8:1;)      local.get 5
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=48
    (;11:1;)     local.get 5
    (;12:2;)     i32.const 6
    (;13:0;)     i32.store offset=36
    (;14:1;)     local.get 5
    (;15:2;)     local.get 1
    (;16:0;)     i32.store offset=8
    (;17:1;)     local.get 5
    (;18:2;)     local.get 2
    (;19:0;)     i32.store offset=12
    (;20:1;)     local.get 5
    (;21:2;)     local.get 3
    (;22:0;)     i32.store offset=16
    (;23:1;)     local.get 5
    (;24:2;)     local.get 4
    (;25:0;)     i32.store offset=20
    (;26:1;)     i32.const 0
    (;27:1;)     i32.load offset=70816
    (;28:0;)     local.set 6
    (;29:1;)     i32.const 0
    (;30:2;)     local.get 5
    (;31:3;)     i32.const 32
    (;32:2;)     i32.add
    (;33:0;)     i32.store offset=70816
    (;34:1;)     local.get 5
    (;35:2;)     local.get 6
    (;36:0;)     i32.store offset=32
    (;37:1;)     local.get 5
    (;38:2;)     local.get 5
    (;39:3;)     i32.const 8
    (;40:2;)     i32.add
    (;41:0;)     i32.store offset=40
    (;42:1;)     local.get 5
    (;43:2;)     local.get 5
    (;44:3;)     i32.const 16
    (;45:2;)     i32.add
    (;46:0;)     i32.store offset=44
    (;47:0;)     block
    (;48:0;)       block
    (;49:1;)         local.get 2
    (;50:1;)         i32.eqz
    (;51:0;)         br_if 0
    (;52:1;)         local.get 4
    (;53:1;)         i32.eqz
    (;54:0;)         br_if 1
    (;55:1;)         local.get 5
    (;56:2;)         i32.const 56
    (;57:1;)         i32.add
    (;58:2;)         local.get 4
    (;59:3;)         local.get 2
    (;60:2;)         i32.add
    (;61:2;)         local.tee 7
    (;62:2;)         call 59  runtime.alloc
    (;63:2;)         local.tee 8
    (;64:0;)         i32.store
    (;65:1;)         local.get 5
    (;66:2;)         i32.const 60
    (;67:1;)         i32.add
    (;68:2;)         local.get 8
    (;69:0;)         i32.store
    (;70:1;)         local.get 5
    (;71:2;)         i32.const 48
    (;72:1;)         i32.add
    (;73:2;)         local.get 8
    (;74:0;)         i32.store
    (;75:1;)         local.get 8
    (;76:2;)         local.get 1
    (;77:3;)         local.get 2
    (;78:1;)         call 8  memcpy
    (;79:1;)         local.tee 1
    (;80:2;)         local.get 2
    (;81:1;)         i32.add
    (;82:2;)         local.get 3
    (;83:3;)         local.get 4
    (;84:1;)         call 8  memcpy
    (;85:0;)         drop
    (;86:1;)         i32.const 0
    (;87:2;)         local.get 6
    (;88:0;)         i32.store offset=70816
    (;89:1;)         local.get 5
    (;90:2;)         i64.const 0
    (;91:0;)         i64.store offset=24
    (;92:1;)         local.get 5
    (;93:2;)         i32.const 52
    (;94:1;)         i32.add
    (;95:2;)         local.get 5
    (;96:3;)         i32.const 24
    (;97:2;)         i32.add
    (;98:0;)         i32.store
    (;99:1;)         local.get 0
    (;100:2;)        local.get 7
    (;101:0;)        i32.store offset=4
    (;102:1;)        local.get 0
    (;103:2;)        local.get 1
    (;104:0;)        i32.store
    (;105:1;)        local.get 5
    (;106:2;)        i32.const 64
    (;107:1;)        i32.add
    (;108:0;)        global.set 0
    (;109:0;)        return
    (;110:0;)      end
    (;111:1;)      i32.const 0
    (;112:2;)      local.get 6
    (;113:0;)      i32.store offset=70816
    (;114:1;)      local.get 0
    (;115:2;)      local.get 4
    (;116:0;)      i32.store offset=4
    (;117:1;)      local.get 0
    (;118:2;)      local.get 3
    (;119:0;)      i32.store
    (;120:1;)      local.get 5
    (;121:2;)      i32.const 64
    (;122:1;)      i32.add
    (;123:0;)      global.set 0
    (;124:0;)      return
    (;125:0;)    end
    (;126:1;)    i32.const 0
    (;127:2;)    local.get 6
    (;128:0;)    i32.store offset=70816
    (;129:1;)    local.get 0
    (;130:2;)    local.get 2
    (;131:0;)    i32.store offset=4
    (;132:1;)    local.get 0
    (;133:2;)    local.get 1
    (;134:0;)    i32.store
    (;135:1;)    local.get 5
    (;136:2;)    i32.const 64
    (;137:1;)    i32.add
    (;138:0;)    global.set 0
    (;139:0;)  end
  )

  (func "runtime.slicePanic" (;92;) (type 6)
    (;0:1;)      i32.const 67328
    (;1:2;)      i32.const 18
    (;2:0;)      call 106  runtime.runtimePanic
    (;3:0;)      unreachable
    (;4:0;)    end
  )

  (func "placeBet" (;93;) (type 6)
    (local (;0;) i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i64)
    (local (;5;) i64)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i32)
    (local (;10;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 304
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 0
    (;4:0;)      global.set 0
    (;5:1;)      local.get 0
    (;6:2;)      i64.const 94489280512
    (;7:0;)      i64.store offset=208
    (;8:1;)      local.get 0
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=216
    (;11:1;)     local.get 0
    (;12:2;)     i64.const 0
    (;13:0;)     i64.store offset=296
    (;14:1;)     local.get 0
    (;15:2;)     i64.const 0
    (;16:0;)     i64.store offset=288
    (;17:1;)     local.get 0
    (;18:2;)     i64.const 0
    (;19:0;)     i64.store offset=280
    (;20:1;)     local.get 0
    (;21:2;)     i64.const 0
    (;22:0;)     i64.store offset=272
    (;23:1;)     local.get 0
    (;24:2;)     i64.const 0
    (;25:0;)     i64.store offset=264
    (;26:1;)     local.get 0
    (;27:2;)     i64.const 0
    (;28:0;)     i64.store offset=256
    (;29:1;)     local.get 0
    (;30:2;)     i64.const 0
    (;31:0;)     i64.store offset=248
    (;32:1;)     local.get 0
    (;33:2;)     i64.const 0
    (;34:0;)     i64.store offset=240
    (;35:1;)     local.get 0
    (;36:2;)     i64.const 0
    (;37:0;)     i64.store offset=232
    (;38:1;)     local.get 0
    (;39:2;)     i64.const 0
    (;40:0;)     i64.store offset=224
    (;41:1;)     local.get 0
    (;42:2;)     i32.const 0
    (;43:0;)     i32.store offset=128
    (;44:1;)     i32.const 0
    (;45:1;)     i32.load offset=70816
    (;46:0;)     local.set 1
    (;47:1;)     i32.const 0
    (;48:2;)     local.get 0
    (;49:3;)     i32.const 208
    (;50:2;)     i32.add
    (;51:0;)     i32.store offset=70816
    (;52:1;)     local.get 0
    (;53:2;)     local.get 1
    (;54:0;)     i32.store offset=208
    (;55:1;)     local.get 0
    (;56:2;)     local.get 0
    (;57:3;)     i32.const 128
    (;58:2;)     i32.add
    (;59:0;)     i32.store offset=216
    (;60:1;)     local.get 0
    (;61:2;)     call 16  github.com/iotaledger/wart/wasplib.NewScContext
    (;62:2;)     local.tee 2
    (;63:0;)     i32.store offset=128
    (;64:1;)     local.get 2
    (;65:2;)     i32.const 66944
    (;66:3;)     i32.const 12
    (;67:0;)     call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;68:1;)     local.get 0
    (;69:2;)     i32.const 0
    (;70:0;)     i32.store offset=136
    (;71:1;)     local.get 0
    (;72:2;)     local.get 0
    (;73:3;)     i32.const 136
    (;74:2;)     i32.add
    (;75:0;)     i32.store offset=220
    (;76:1;)     local.get 0
    (;77:2;)     local.get 2
    (;78:2;)     call 24  (github.com/iotaledger/wart/wasplib.ScContext).Request
    (;79:2;)     local.tee 3
    (;80:0;)     i32.store offset=136
    (;81:1;)     local.get 0
    (;82:2;)     local.get 0
    (;83:3;)     i32.const 200
    (;84:2;)     i32.add
    (;85:0;)     i32.store offset=224
    (;86:1;)     local.get 0
    (;87:2;)     i32.const 0
    (;88:0;)     i32.store offset=200
    (;89:1;)     local.get 0
    (;90:2;)     i32.const 120
    (;91:1;)     i32.add
    (;92:2;)     local.get 3
    (;93:3;)     i32.const 65605
    (;94:4;)     i32.const 7
    (;95:2;)     call 36  (github.com/iotaledger/wart/wasplib.ScImmutableMap).GetMap
    (;96:3;)     i32.const 66956
    (;97:4;)     i32.const 4
    (;98:0;)     call 35  (github.com/iotaledger/wart/wasplib.ScImmutableMap).GetInt
    (;99:0;)     block
    (;100:1;)      local.get 0
    (;101:1;)      i32.load offset=120
    (;102:2;)      local.get 0
    (;103:2;)      i32.load offset=124
    (;104:1;)      call 34  (github.com/iotaledger/wart/wasplib.ScImmutableInt).Value
    (;105:1;)      local.tee 4
    (;106:1;)      i64.eqz
    (;107:1;)      i32.eqz
    (;108:0;)      br_if 0
    (;109:1;)      local.get 2
    (;110:2;)      i32.const 66960
    (;111:3;)      i32.const 12
    (;112:0;)      call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;113:1;)      i32.const 0
    (;114:2;)      local.get 1
    (;115:0;)      i32.store offset=70816
    (;116:1;)      local.get 0
    (;117:2;)      i32.const 304
    (;118:1;)      i32.add
    (;119:0;)      global.set 0
    (;120:0;)      return
    (;121:0;)    end
    (;122:1;)    local.get 0
    (;123:2;)    i32.const 112
    (;124:1;)    i32.add
    (;125:2;)    local.get 3
    (;126:2;)    call 46  (github.com/iotaledger/wart/wasplib.ScRequest).Params
    (;127:3;)    i32.const 66972
    (;128:4;)    i32.const 5
    (;129:0;)    call 35  (github.com/iotaledger/wart/wasplib.ScImmutableMap).GetInt
    (;130:0;)    block
    (;131:1;)      local.get 0
    (;132:1;)      i32.load offset=112
    (;133:2;)      local.get 0
    (;134:2;)      i32.load offset=116
    (;135:1;)      call 34  (github.com/iotaledger/wart/wasplib.ScImmutableInt).Value
    (;136:1;)      local.tee 5
    (;137:2;)      i64.const 0
    (;138:1;)      i64.ne
    (;139:0;)      br_if 0
    (;140:1;)      local.get 2
    (;141:2;)      i32.const 66977
    (;142:3;)      i32.const 11
    (;143:0;)      call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;144:1;)      i32.const 0
    (;145:2;)      local.get 1
    (;146:0;)      i32.store offset=70816
    (;147:1;)      local.get 0
    (;148:2;)      i32.const 304
    (;149:1;)      i32.add
    (;150:0;)      global.set 0
    (;151:0;)      return
    (;152:0;)    end
    (;153:0;)    block
    (;154:0;)      block
    (;155:0;)        block
    (;156:1;)          local.get 5
    (;157:2;)          i64.const -1
    (;158:1;)          i64.add
    (;159:2;)          i64.const 4
    (;160:1;)          i64.gt_u
    (;161:0;)          br_if 0
    (;162:1;)          local.get 0
    (;163:2;)          i64.const 0
    (;164:0;)          i64.store offset=168
    (;165:1;)          local.get 0
    (;166:2;)          i64.const 0
    (;167:0;)          i64.store offset=176
    (;168:1;)          local.get 0
    (;169:2;)          i64.const 0
    (;170:0;)          i64.store offset=184
    (;171:1;)          local.get 0
    (;172:2;)          i64.const 0
    (;173:0;)          i64.store offset=192
    (;174:1;)          local.get 0
    (;175:2;)          i32.const 228
    (;176:1;)          i32.add
    (;177:2;)          local.get 0
    (;178:3;)          i32.const 168
    (;179:2;)          i32.add
    (;180:0;)          i32.store
    (;181:1;)          local.get 0
    (;182:2;)          i32.const 232
    (;183:1;)          i32.add
    (;184:2;)          local.get 0
    (;185:3;)          i32.const 200
    (;186:2;)          i32.add
    (;187:0;)          i32.store
    (;188:1;)          local.get 0
    (;189:2;)          i32.const 0
    (;190:0;)          i32.store offset=200
    (;191:1;)          local.get 0
    (;192:2;)          i32.const 104
    (;193:1;)          i32.add
    (;194:2;)          local.get 3
    (;195:3;)          i32.const 65612
    (;196:4;)          i32.const 4
    (;197:0;)          call 28  (github.com/iotaledger/wart/wasplib.ScImmutableMap).GetString
    (;198:1;)          local.get 0
    (;199:2;)          i32.const 96
    (;200:1;)          i32.add
    (;201:2;)          local.get 0
    (;202:2;)          i32.load offset=104
    (;203:3;)          local.get 0
    (;204:3;)          i32.load offset=108
    (;205:0;)          call 29  (github.com/iotaledger/wart/wasplib.ScImmutableString).Value
    (;206:1;)          local.get 0
    (;207:2;)          i32.const 256
    (;208:1;)          i32.add
    (;209:2;)          local.get 0
    (;210:2;)          i32.load offset=96
    (;211:2;)          local.tee 6
    (;212:0;)          i32.store
    (;213:1;)          local.get 0
    (;214:2;)          i32.const 240
    (;215:1;)          i32.add
    (;216:2;)          local.get 6
    (;217:0;)          i32.store
    (;218:1;)          local.get 0
    (;219:2;)          i32.const 236
    (;220:1;)          i32.add
    (;221:2;)          local.get 6
    (;222:0;)          i32.store
    (;223:1;)          local.get 0
    (;224:1;)          i32.load offset=100
    (;225:0;)          local.set 7
    (;226:1;)          local.get 0
    (;227:2;)          i32.const 88
    (;228:1;)          i32.add
    (;229:2;)          local.get 3
    (;230:0;)          call 45  (github.com/iotaledger/wart/wasplib.ScRequest).Address
    (;231:1;)          local.get 0
    (;232:2;)          i32.const 264
    (;233:1;)          i32.add
    (;234:2;)          local.get 0
    (;235:2;)          i32.load offset=88
    (;236:2;)          local.tee 3
    (;237:0;)          i32.store
    (;238:1;)          local.get 0
    (;239:2;)          i32.const 244
    (;240:1;)          i32.add
    (;241:2;)          local.get 3
    (;242:0;)          i32.store
    (;243:1;)          local.get 0
    (;244:2;)          i32.const 180
    (;245:1;)          i32.add
    (;246:2;)          local.get 0
    (;247:2;)          i32.load offset=92
    (;248:2;)          local.tee 8
    (;249:0;)          i32.store
    (;250:1;)          local.get 0
    (;251:2;)          local.get 4
    (;252:0;)          i64.store offset=192
    (;253:1;)          local.get 0
    (;254:2;)          local.get 5
    (;255:0;)          i64.store offset=184
    (;256:1;)          local.get 0
    (;257:2;)          local.get 7
    (;258:0;)          i32.store offset=172
    (;259:1;)          local.get 0
    (;260:2;)          local.get 6
    (;261:0;)          i32.store offset=168
    (;262:1;)          local.get 0
    (;263:2;)          i32.const 0
    (;264:0;)          i32.store offset=144
    (;265:1;)          local.get 0
    (;266:2;)          i32.const 248
    (;267:1;)          i32.add
    (;268:2;)          local.get 0
    (;269:3;)          i32.const 144
    (;270:2;)          i32.add
    (;271:0;)          i32.store
    (;272:1;)          local.get 0
    (;273:2;)          local.get 3
    (;274:0;)          i32.store offset=176
    (;275:1;)          local.get 2
    (;276:1;)          call 25  (github.com/iotaledger/wart/wasplib.ScContext).State
    (;277:0;)          local.set 2
    (;278:1;)          local.get 0
    (;279:2;)          i32.const 0
    (;280:0;)          i32.store offset=152
    (;281:1;)          local.get 0
    (;282:2;)          local.get 2
    (;283:0;)          i32.store offset=144
    (;284:1;)          local.get 0
    (;285:2;)          i32.const 252
    (;286:1;)          i32.add
    (;287:2;)          local.get 0
    (;288:3;)          i32.const 152
    (;289:2;)          i32.add
    (;290:0;)          i32.store
    (;291:1;)          local.get 0
    (;292:2;)          local.get 2
    (;293:3;)          i32.const 67004
    (;294:4;)          i32.const 4
    (;295:2;)          call 39  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetStringArray
    (;296:2;)          local.tee 9
    (;297:0;)          i32.store offset=152
    (;298:1;)          local.get 9
    (;299:1;)          call 44  (github.com/iotaledger/wart/wasplib.ScMutableStringArray).Length
    (;300:0;)          local.set 10
    (;301:1;)          local.get 0
    (;302:2;)          i32.const 80
    (;303:1;)          i32.add
    (;304:2;)          local.get 6
    (;305:3;)          local.get 7
    (;306:4;)          i32.const 66712
    (;307:5;)          i32.const 1
    (;308:0;)          call 91  runtime.stringConcat
    (;309:1;)          local.get 0
    (;310:2;)          i32.const 260
    (;311:1;)          i32.add
    (;312:2;)          local.get 0
    (;313:2;)          i32.load offset=80
    (;314:2;)          local.tee 6
    (;315:0;)          i32.store
    (;316:1;)          local.get 0
    (;317:2;)          i32.const 72
    (;318:1;)          i32.add
    (;319:2;)          local.get 6
    (;320:3;)          local.get 0
    (;321:3;)          i32.load offset=84
    (;322:4;)          local.get 3
    (;323:5;)          local.get 8
    (;324:0;)          call 91  runtime.stringConcat
    (;325:1;)          local.get 0
    (;326:2;)          i32.const 268
    (;327:1;)          i32.add
    (;328:2;)          local.get 0
    (;329:2;)          i32.load offset=72
    (;330:2;)          local.tee 3
    (;331:0;)          i32.store
    (;332:1;)          local.get 0
    (;333:2;)          i32.const 64
    (;334:1;)          i32.add
    (;335:2;)          local.get 3
    (;336:3;)          local.get 0
    (;337:3;)          i32.load offset=76
    (;338:4;)          i32.const 66712
    (;339:5;)          i32.const 1
    (;340:0;)          call 91  runtime.stringConcat
    (;341:1;)          local.get 0
    (;342:2;)          i32.const 272
    (;343:1;)          i32.add
    (;344:2;)          local.get 0
    (;345:2;)          i32.load offset=64
    (;346:2;)          local.tee 3
    (;347:0;)          i32.store
    (;348:1;)          local.get 0
    (;349:1;)          i32.load offset=68
    (;350:0;)          local.set 6
    (;351:1;)          local.get 0
    (;352:2;)          i32.const 56
    (;353:1;)          i32.add
    (;354:2;)          local.get 5
    (;355:0;)          call 76  strconv.FormatInt
    (;356:1;)          local.get 0
    (;357:2;)          i32.const 276
    (;358:1;)          i32.add
    (;359:2;)          local.get 0
    (;360:2;)          i32.load offset=56
    (;361:2;)          local.tee 7
    (;362:0;)          i32.store
    (;363:1;)          local.get 0
    (;364:2;)          i32.const 48
    (;365:1;)          i32.add
    (;366:2;)          local.get 3
    (;367:3;)          local.get 6
    (;368:4;)          local.get 7
    (;369:5;)          local.get 0
    (;370:5;)          i32.load offset=60
    (;371:0;)          call 91  runtime.stringConcat
    (;372:1;)          local.get 0
    (;373:2;)          i32.const 280
    (;374:1;)          i32.add
    (;375:2;)          local.get 0
    (;376:2;)          i32.load offset=48
    (;377:2;)          local.tee 3
    (;378:0;)          i32.store
    (;379:1;)          local.get 0
    (;380:2;)          i32.const 40
    (;381:1;)          i32.add
    (;382:2;)          local.get 3
    (;383:3;)          local.get 0
    (;384:3;)          i32.load offset=52
    (;385:4;)          i32.const 66712
    (;386:5;)          i32.const 1
    (;387:0;)          call 91  runtime.stringConcat
    (;388:1;)          local.get 0
    (;389:2;)          i32.const 284
    (;390:1;)          i32.add
    (;391:2;)          local.get 0
    (;392:2;)          i32.load offset=40
    (;393:2;)          local.tee 3
    (;394:0;)          i32.store
    (;395:1;)          local.get 0
    (;396:1;)          i32.load offset=44
    (;397:0;)          local.set 6
    (;398:1;)          local.get 0
    (;399:2;)          i32.const 32
    (;400:1;)          i32.add
    (;401:2;)          local.get 4
    (;402:0;)          call 76  strconv.FormatInt
    (;403:1;)          local.get 0
    (;404:2;)          i32.const 288
    (;405:1;)          i32.add
    (;406:2;)          local.get 0
    (;407:2;)          i32.load offset=32
    (;408:2;)          local.tee 7
    (;409:0;)          i32.store
    (;410:1;)          local.get 0
    (;411:2;)          i32.const 24
    (;412:1;)          i32.add
    (;413:2;)          local.get 3
    (;414:3;)          local.get 6
    (;415:4;)          local.get 7
    (;416:5;)          local.get 0
    (;417:5;)          i32.load offset=36
    (;418:0;)          call 91  runtime.stringConcat
    (;419:1;)          local.get 0
    (;420:2;)          i32.const 296
    (;421:1;)          i32.add
    (;422:2;)          local.get 0
    (;423:2;)          i32.load offset=24
    (;424:2;)          local.tee 3
    (;425:0;)          i32.store
    (;426:1;)          local.get 0
    (;427:2;)          i32.const 292
    (;428:1;)          i32.add
    (;429:2;)          local.get 3
    (;430:0;)          i32.store
    (;431:1;)          local.get 0
    (;432:1;)          i32.load offset=28
    (;433:0;)          local.set 6
    (;434:1;)          local.get 0
    (;435:2;)          i32.const 16
    (;436:1;)          i32.add
    (;437:2;)          local.get 9
    (;438:3;)          local.get 10
    (;439:0;)          call 43  (github.com/iotaledger/wart/wasplib.ScMutableStringArray).GetString
    (;440:1;)          local.get 0
    (;441:1;)          i32.load offset=16
    (;442:2;)          local.get 0
    (;443:2;)          i32.load offset=20
    (;444:3;)          local.get 3
    (;445:4;)          local.get 6
    (;446:0;)          call 40  (github.com/iotaledger/wart/wasplib.ScMutableString).SetValue
    (;447:1;)          local.get 10
    (;448:1;)          i32.eqz
    (;449:0;)          br_if 1
    (;450:0;)          br 2
    (;451:0;)        end
    (;452:1;)        local.get 2
    (;453:2;)        i32.const 66988
    (;454:3;)        i32.const 16
    (;455:0;)        call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;456:1;)        i32.const 0
    (;457:2;)        local.get 1
    (;458:0;)        i32.store offset=70816
    (;459:1;)        local.get 0
    (;460:2;)        i32.const 304
    (;461:1;)        i32.add
    (;462:0;)        global.set 0
    (;463:0;)        return
    (;464:0;)      end
    (;465:1;)      local.get 0
    (;466:2;)      i32.const 8
    (;467:1;)      i32.add
    (;468:2;)      local.get 2
    (;469:3;)      i32.const 67078
    (;470:4;)      i32.const 10
    (;471:0;)      call 31  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt
    (;472:1;)      local.get 0
    (;473:1;)      i32.load offset=8
    (;474:2;)      local.get 0
    (;475:2;)      i32.load offset=12
    (;476:1;)      call 38  (github.com/iotaledger/wart/wasplib.ScMutableInt).Value
    (;477:0;)      local.set 5
    (;478:1;)      local.get 0
    (;479:2;)      i32.const 300
    (;480:1;)      i32.add
    (;481:2;)      local.get 0
    (;482:3;)      i32.const 160
    (;483:2;)      i32.add
    (;484:0;)      i32.store
    (;485:1;)      local.get 0
    (;486:2;)      i32.const 0
    (;487:0;)      i32.store offset=160
    (;488:1;)      local.get 0
    (;489:2;)      local.get 0
    (;490:2;)      i32.load offset=128
    (;491:2;)      call 20  (github.com/iotaledger/wart/wasplib.ScContext).Event
    (;492:2;)      local.tee 2
    (;493:0;)      i32.store offset=160
    (;494:1;)      local.get 2
    (;495:2;)      i64.const 6
    (;496:0;)      call 30  (github.com/iotaledger/wart/wasplib.ScEvent).Code
    (;497:1;)      local.get 2
    (;498:2;)      i64.const 120
    (;499:3;)      local.get 5
    (;500:4;)      local.get 5
    (;501:5;)      i64.const 10
    (;502:4;)      i64.lt_s
    (;503:2;)      select
    (;504:0;)      call 33  (github.com/iotaledger/wart/wasplib.ScEvent).Delay
    (;505:0;)    end
    (;506:1;)    i32.const 0
    (;507:2;)    local.get 1
    (;508:0;)    i32.store offset=70816
    (;509:1;)    local.get 0
    (;510:2;)    i32.const 304
    (;511:1;)    i32.add
    (;512:0;)    global.set 0
    (;513:0;)  end
  )

  (func "playPeriod" (;94;) (type 6)
    (local (;0;) i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i64)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 96
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 0
    (;4:0;)      global.set 0
    (;5:1;)      local.get 0
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=84 align=2
    (;8:1;)      local.get 0
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=76 align=2
    (;11:1;)     local.get 0
    (;12:2;)     i32.const 5
    (;13:0;)     i32.store offset=68
    (;14:1;)     local.get 0
    (;15:2;)     i32.const 0
    (;16:0;)     i32.store offset=48
    (;17:1;)     i32.const 0
    (;18:1;)     i32.load offset=70816
    (;19:0;)     local.set 1
    (;20:1;)     i32.const 0
    (;21:2;)     local.get 0
    (;22:3;)     i32.const 64
    (;23:2;)     i32.add
    (;24:0;)     i32.store offset=70816
    (;25:1;)     local.get 0
    (;26:2;)     local.get 1
    (;27:0;)     i32.store offset=64
    (;28:1;)     local.get 0
    (;29:2;)     local.get 0
    (;30:3;)     i32.const 48
    (;31:2;)     i32.add
    (;32:0;)     i32.store offset=72
    (;33:1;)     local.get 0
    (;34:2;)     call 16  github.com/iotaledger/wart/wasplib.NewScContext
    (;35:2;)     local.tee 2
    (;36:0;)     i32.store offset=48
    (;37:1;)     local.get 2
    (;38:2;)     i32.const 67008
    (;39:3;)     i32.const 14
    (;40:0;)     call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;41:1;)     local.get 0
    (;42:2;)     i32.const 40
    (;43:1;)     i32.add
    (;44:2;)     local.get 2
    (;45:2;)     call 24  (github.com/iotaledger/wart/wasplib.ScContext).Request
    (;46:0;)     call 45  (github.com/iotaledger/wart/wasplib.ScRequest).Address
    (;47:1;)     local.get 0
    (;48:2;)     local.get 0
    (;49:2;)     i32.load offset=40
    (;50:2;)     local.tee 3
    (;51:0;)     i32.store offset=76
    (;52:1;)     local.get 0
    (;53:1;)     i32.load offset=44
    (;54:0;)     local.set 4
    (;55:1;)     local.get 2
    (;56:1;)     call 17  (github.com/iotaledger/wart/wasplib.ScContext).Contract
    (;57:0;)     local.set 5
    (;58:1;)     local.get 0
    (;59:2;)     local.get 0
    (;60:3;)     i32.const 56
    (;61:2;)     i32.add
    (;62:0;)     i32.store offset=80
    (;63:1;)     local.get 0
    (;64:2;)     i32.const 0
    (;65:0;)     i32.store offset=56
    (;66:1;)     local.get 0
    (;67:2;)     i32.const 32
    (;68:1;)     i32.add
    (;69:2;)     local.get 5
    (;70:3;)     i32.const 65591
    (;71:4;)     i32.const 5
    (;72:0;)     call 28  (github.com/iotaledger/wart/wasplib.ScImmutableMap).GetString
    (;73:1;)     local.get 0
    (;74:2;)     i32.const 24
    (;75:1;)     i32.add
    (;76:2;)     local.get 0
    (;77:2;)     i32.load offset=32
    (;78:3;)     local.get 0
    (;79:3;)     i32.load offset=36
    (;80:0;)     call 29  (github.com/iotaledger/wart/wasplib.ScImmutableString).Value
    (;81:1;)     local.get 0
    (;82:2;)     local.get 0
    (;83:2;)     i32.load offset=24
    (;84:2;)     local.tee 6
    (;85:0;)     i32.store offset=88
    (;86:1;)     local.get 0
    (;87:2;)     local.get 6
    (;88:0;)     i32.store offset=84
    (;89:0;)     block
    (;90:0;)       block
    (;91:1;)         local.get 4
    (;92:2;)         local.get 0
    (;93:2;)         i32.load offset=28
    (;94:1;)         i32.ne
    (;95:0;)         br_if 0
    (;96:1;)         i32.const 0
    (;97:0;)         local.set 5
    (;98:0;)         loop
    (;99:1;)           local.get 5
    (;100:2;)          local.get 4
    (;101:1;)          i32.ge_s
    (;102:0;)          br_if 2
    (;103:1;)          local.get 6
    (;104:2;)          local.get 5
    (;105:1;)          i32.add
    (;106:0;)          local.set 7
    (;107:1;)          local.get 3
    (;108:2;)          local.get 5
    (;109:1;)          i32.add
    (;110:0;)          local.set 8
    (;111:1;)          local.get 5
    (;112:2;)          i32.const 1
    (;113:1;)          i32.add
    (;114:0;)          local.set 5
    (;115:1;)          local.get 8
    (;116:1;)          i32.load8_u
    (;117:2;)          local.get 7
    (;118:2;)          i32.load8_u
    (;119:1;)          i32.eq
    (;120:0;)          br_if 0
    (;121:0;)        end
    (;122:0;)      end
    (;123:1;)      local.get 2
    (;124:2;)      i32.const 67024
    (;125:3;)      i32.const 22
    (;126:0;)      call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;127:1;)      i32.const 0
    (;128:2;)      local.get 1
    (;129:0;)      i32.store offset=70816
    (;130:1;)      local.get 0
    (;131:2;)      i32.const 96
    (;132:1;)      i32.add
    (;133:0;)      global.set 0
    (;134:0;)      return
    (;135:0;)    end
    (;136:1;)    local.get 0
    (;137:2;)    i32.const 16
    (;138:1;)    i32.add
    (;139:2;)    local.get 2
    (;140:2;)    call 24  (github.com/iotaledger/wart/wasplib.ScContext).Request
    (;141:2;)    call 46  (github.com/iotaledger/wart/wasplib.ScRequest).Params
    (;142:3;)    i32.const 67078
    (;143:4;)    i32.const 10
    (;144:0;)    call 35  (github.com/iotaledger/wart/wasplib.ScImmutableMap).GetInt
    (;145:0;)    block
    (;146:1;)      local.get 0
    (;147:1;)      i32.load offset=16
    (;148:2;)      local.get 0
    (;149:2;)      i32.load offset=20
    (;150:1;)      call 34  (github.com/iotaledger/wart/wasplib.ScImmutableInt).Value
    (;151:1;)      local.tee 9
    (;152:2;)      i64.const 9
    (;153:1;)      i64.gt_s
    (;154:0;)      br_if 0
    (;155:1;)      local.get 2
    (;156:2;)      i32.const 67056
    (;157:3;)      i32.const 22
    (;158:0;)      call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;159:1;)      i32.const 0
    (;160:2;)      local.get 1
    (;161:0;)      i32.store offset=70816
    (;162:1;)      local.get 0
    (;163:2;)      i32.const 96
    (;164:1;)      i32.add
    (;165:0;)      global.set 0
    (;166:0;)      return
    (;167:0;)    end
    (;168:1;)    local.get 0
    (;169:2;)    i32.const 8
    (;170:1;)    i32.add
    (;171:2;)    local.get 2
    (;172:2;)    call 25  (github.com/iotaledger/wart/wasplib.ScContext).State
    (;173:3;)    i32.const 67078
    (;174:4;)    i32.const 10
    (;175:0;)    call 31  (github.com/iotaledger/wart/wasplib.ScMutableMap).GetInt
    (;176:1;)    local.get 0
    (;177:1;)    i32.load offset=8
    (;178:2;)    local.get 0
    (;179:2;)    i32.load offset=12
    (;180:3;)    local.get 9
    (;181:0;)    call 32  (github.com/iotaledger/wart/wasplib.ScMutableInt).SetValue
    (;182:1;)    i32.const 0
    (;183:2;)    local.get 1
    (;184:0;)    i32.store offset=70816
    (;185:1;)    local.get 0
    (;186:2;)    i32.const 96
    (;187:1;)    i32.add
    (;188:0;)    global.set 0
    (;189:0;)  end
  )

  (func "test" (;95;) (type 6)
    (local (;0;) i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 0
    (;4:0;)      global.set 0
    (;5:1;)      local.get 0
    (;6:2;)      i64.const 1
    (;7:0;)      i64.store offset=20 align=2
    (;8:1;)      i32.const 0
    (;9:1;)      i32.load offset=70816
    (;10:0;)     local.set 1
    (;11:1;)     i32.const 0
    (;12:2;)     local.get 0
    (;13:3;)     i32.const 16
    (;14:2;)     i32.add
    (;15:0;)     i32.store offset=70816
    (;16:1;)     local.get 0
    (;17:2;)     local.get 1
    (;18:0;)     i32.store offset=16
    (;19:1;)     i32.const 1
    (;20:2;)     i32.const 67088
    (;21:3;)     i32.const 9
    (;22:2;)     call 2  waspGo::hostGetKeyId
    (;23:2;)     local.tee 2
    (;24:3;)     i64.const 123456789
    (;25:0;)     call 37  github.com/iotaledger/wart/wasplib.SetInt
    (;26:1;)     i32.const 1
    (;27:2;)     local.get 2
    (;28:3;)     i32.const 1
    (;29:4;)     local.get 2
    (;30:3;)     call 11  github.com/iotaledger/wart/wasplib.GetInt
    (;31:0;)     call 37  github.com/iotaledger/wart/wasplib.SetInt
    (;32:1;)     i32.const 1
    (;33:2;)     i32.const 67097
    (;34:3;)     i32.const 6
    (;35:2;)     call 2  waspGo::hostGetKeyId
    (;36:2;)     local.tee 2
    (;37:3;)     i32.const 67103
    (;38:4;)     i32.const 4
    (;39:0;)     call 3  waspGo::hostSetString
    (;40:1;)     local.get 0
    (;41:2;)     i32.const 8
    (;42:1;)     i32.add
    (;43:2;)     i32.const 1
    (;44:3;)     local.get 2
    (;45:0;)     call 12  github.com/iotaledger/wart/wasplib.GetString
    (;46:1;)     local.get 0
    (;47:2;)     local.get 0
    (;48:2;)     i32.load offset=8
    (;49:2;)     local.tee 3
    (;50:0;)     i32.store offset=24
    (;51:1;)     i32.const 1
    (;52:2;)     local.get 2
    (;53:3;)     local.get 3
    (;54:4;)     local.get 0
    (;55:4;)     i32.load offset=12
    (;56:0;)     call 3  waspGo::hostSetString
    (;57:1;)     i32.const 0
    (;58:2;)     local.get 1
    (;59:0;)     i32.store offset=70816
    (;60:1;)     local.get 0
    (;61:2;)     i32.const 32
    (;62:1;)     i32.add
    (;63:0;)     global.set 0
    (;64:0;)   end
  )

  (func "tokenMint" (;96;) (type 6)
    (local (;0;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 0
    (;4:0;)      global.set 0
    (;5:1;)      local.get 0
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=8
    (;8:1;)      call 16  github.com/iotaledger/wart/wasplib.NewScContext
    (;9:2;)      i32.const 67107
    (;10:3;)     i32.const 13
    (;11:0;)     call 23  (github.com/iotaledger/wart/wasplib.ScContext).Log
    (;12:1;)     local.get 0
    (;13:2;)     i32.const 16
    (;14:1;)     i32.add
    (;15:0;)     global.set 0
    (;16:0;)   end
  )

  (func "runtime.printstring" (;97;) (type 11) (param (;0;) i32 (;1;) i32)
    (local (;2;) i32)
    (;0:1;)      i32.const 0
    (;1:0;)      local.set 2
    (;2:0;)      block
    (;3:0;)        loop
    (;4:1;)          local.get 2
    (;5:2;)          local.get 1
    (;6:1;)          i32.ge_s
    (;7:0;)          br_if 1
    (;8:1;)          local.get 0
    (;9:2;)          local.get 2
    (;10:1;)         i32.add
    (;11:1;)         i32.load8_u
    (;12:0;)         call 111  runtime.putchar
    (;13:1;)         local.get 2
    (;14:2;)         i32.const 1
    (;15:1;)         i32.add
    (;16:0;)         local.set 2
    (;17:0;)         br 0
    (;18:0;)       end
    (;19:0;)     end
    (;20:0;)   end
  )

  (func "runtime.printitf" (;98;) (type 11) (param (;0;) i32 (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i64)
    (local (;6;) f32)
    (local (;7;) f32)
    (local (;8;) f64)
    (local (;9;) f64)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 64
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 2
    (;4:0;)      global.set 0
    (;5:1;)      local.get 2
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=52 align=2
    (;8:1;)      local.get 2
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=44 align=2
    (;11:1;)     local.get 2
    (;12:2;)     i64.const 5
    (;13:0;)     i64.store offset=36 align=2
    (;14:1;)     i32.const 0
    (;15:1;)     i32.load offset=70816
    (;16:0;)     local.set 3
    (;17:1;)     i32.const 0
    (;18:2;)     local.get 2
    (;19:3;)     i32.const 32
    (;20:2;)     i32.add
    (;21:0;)     i32.store offset=70816
    (;22:1;)     local.get 2
    (;23:2;)     local.get 3
    (;24:0;)     i32.store offset=32
    (;25:0;)     block
    (;26:0;)       block
    (;27:1;)         local.get 0
    (;28:2;)         i32.const -2
    (;29:1;)         i32.add
    (;30:1;)         local.tee 4
    (;31:2;)         i32.const 32
    (;32:1;)         i32.gt_u
    (;33:0;)         br_if 0
    (;34:0;)         block
    (;35:0;)           block
    (;36:0;)             block
    (;37:0;)               block
    (;38:0;)                 block
    (;39:0;)                   block
    (;40:0;)                     block
    (;41:0;)                       block
    (;42:0;)                         block
    (;43:0;)                           block
    (;44:0;)                             block
    (;45:0;)                               block
    (;46:0;)                                 block
    (;47:0;)                                   block
    (;48:0;)                                     block
    (;49:0;)                                       block
    (;50:1;)                                         local.get 4
    (;51:0;)                                         br_table 0 16 3 16 1 16 2 16 3 16 4 16 5 16 6 16 7 16 8 16 9 16 10 16 11 16 12 16 13 16 14 16 15 0
    (;52:0;)                                       end
    (;53:0;)                                       block
    (;54:1;)                                         local.get 1
    (;55:2;)                                         i32.const 1
    (;56:1;)                                         i32.and
    (;57:1;)                                         i32.eqz
    (;58:0;)                                         br_if 0
    (;59:1;)                                         i32.const 67239
    (;60:2;)                                         i32.const 4
    (;61:0;)                                         call 97  runtime.printstring
    (;62:0;)                                         br 17
    (;63:0;)                                       end
    (;64:1;)                                       i32.const 67243
    (;65:2;)                                       i32.const 5
    (;66:0;)                                       call 97  runtime.printstring
    (;67:0;)                                       br 16
    (;68:0;)                                     end
    (;69:1;)                                     local.get 1
    (;70:2;)                                     i32.const 24
    (;71:1;)                                     i32.shl
    (;72:2;)                                     i32.const 24
    (;73:1;)                                     i32.shr_s
    (;74:0;)                                     call 112  runtime.printint32
    (;75:0;)                                     br 15
    (;76:0;)                                   end
    (;77:1;)                                   local.get 1
    (;78:2;)                                   i32.const 16
    (;79:1;)                                   i32.shl
    (;80:2;)                                   i32.const 16
    (;81:1;)                                   i32.shr_s
    (;82:0;)                                   call 112  runtime.printint32
    (;83:0;)                                   br 14
    (;84:0;)                                 end
    (;85:1;)                                 local.get 1
    (;86:0;)                                 call 112  runtime.printint32
    (;87:0;)                                 br 13
    (;88:0;)                               end
    (;89:0;)                               block
    (;90:1;)                                 local.get 1
    (;91:1;)                                 i64.load
    (;92:1;)                                 local.tee 5
    (;93:2;)                                 i64.const -1
    (;94:1;)                                 i64.gt_s
    (;95:0;)                                 br_if 0
    (;96:1;)                                 i32.const 45
    (;97:0;)                                 call 111  runtime.putchar
    (;98:1;)                                 i64.const 0
    (;99:2;)                                 local.get 5
    (;100:1;)                                i64.sub
    (;101:0;)                                local.set 5
    (;102:0;)                              end
    (;103:1;)                              local.get 5
    (;104:0;)                              call 113  runtime.printuint64
    (;105:0;)                              br 12
    (;106:0;)                            end
    (;107:1;)                            local.get 1
    (;108:1;)                            i64.extend_i32_u
    (;109:0;)                            call 113  runtime.printuint64
    (;110:0;)                            br 11
    (;111:0;)                          end
    (;112:1;)                          local.get 1
    (;113:2;)                          i32.const 255
    (;114:1;)                          i32.and
    (;115:1;)                          i64.extend_i32_u
    (;116:0;)                          call 113  runtime.printuint64
    (;117:0;)                          br 10
    (;118:0;)                        end
    (;119:1;)                        local.get 1
    (;120:2;)                        i32.const 65535
    (;121:1;)                        i32.and
    (;122:1;)                        i64.extend_i32_u
    (;123:0;)                        call 113  runtime.printuint64
    (;124:0;)                        br 9
    (;125:0;)                      end
    (;126:1;)                      local.get 1
    (;127:1;)                      i64.extend_i32_u
    (;128:0;)                      call 113  runtime.printuint64
    (;129:0;)                      br 8
    (;130:0;)                    end
    (;131:1;)                    local.get 1
    (;132:1;)                    i64.load
    (;133:0;)                    call 113  runtime.printuint64
    (;134:0;)                    br 7
    (;135:0;)                  end
    (;136:1;)                  local.get 1
    (;137:0;)                  call 114  runtime.printptr
    (;138:0;)                  br 6
    (;139:0;)                end
    (;140:1;)                local.get 1
    (;141:1;)                f32.reinterpret_i32
    (;142:1;)                f64.promote_f32
    (;143:0;)                call 110  runtime.printfloat64
    (;144:0;)                br 5
    (;145:0;)              end
    (;146:1;)              local.get 1
    (;147:1;)              f64.load
    (;148:0;)              call 110  runtime.printfloat64
    (;149:0;)              br 4
    (;150:0;)            end
    (;151:1;)            local.get 1
    (;152:1;)            f32.load offset=4
    (;153:0;)            local.set 6
    (;154:1;)            local.get 1
    (;155:1;)            f32.load
    (;156:0;)            local.set 7
    (;157:1;)            i32.const 40
    (;158:0;)            call 111  runtime.putchar
    (;159:1;)            local.get 7
    (;160:1;)            f64.promote_f32
    (;161:0;)            call 110  runtime.printfloat64
    (;162:1;)            local.get 6
    (;163:1;)            f64.promote_f32
    (;164:0;)            call 110  runtime.printfloat64
    (;165:1;)            i32.const 67248
    (;166:2;)            i32.const 2
    (;167:0;)            call 97  runtime.printstring
    (;168:0;)            br 3
    (;169:0;)          end
    (;170:1;)          local.get 1
    (;171:1;)          f64.load offset=8
    (;172:0;)          local.set 8
    (;173:1;)          local.get 1
    (;174:1;)          f64.load
    (;175:0;)          local.set 9
    (;176:1;)          i32.const 40
    (;177:0;)          call 111  runtime.putchar
    (;178:1;)          local.get 9
    (;179:0;)          call 110  runtime.printfloat64
    (;180:1;)          local.get 8
    (;181:0;)          call 110  runtime.printfloat64
    (;182:1;)          i32.const 67248
    (;183:2;)          i32.const 2
    (;184:0;)          call 97  runtime.printstring
    (;185:0;)          br 2
    (;186:0;)        end
    (;187:1;)        local.get 1
    (;188:1;)        i32.load
    (;189:2;)        local.get 1
    (;190:2;)        i32.load offset=4
    (;191:0;)        call 97  runtime.printstring
    (;192:0;)        br 1
    (;193:0;)      end
    (;194:0;)      block
    (;195:1;)        local.get 0
    (;196:2;)        i32.const -997
    (;197:1;)        i32.add
    (;198:2;)        i32.const 22
    (;199:1;)        i32.rotl
    (;200:1;)        local.tee 4
    (;201:2;)        i32.const 4
    (;202:1;)        i32.gt_u
    (;203:0;)        br_if 0
    (;204:1;)        local.get 4
    (;205:2;)        i32.const 1
    (;206:1;)        i32.eq
    (;207:0;)        br_if 0
    (;208:1;)        local.get 2
    (;209:2;)        i32.const 8
    (;210:1;)        i32.add
    (;211:2;)        local.get 1
    (;212:3;)        local.get 0
    (;213:0;)        call 115  (error).Error
    (;214:1;)        local.get 2
    (;215:2;)        i32.const 40
    (;216:1;)        i32.add
    (;217:2;)        local.get 2
    (;218:2;)        i32.load offset=8
    (;219:2;)        local.tee 1
    (;220:0;)        i32.store
    (;221:1;)        local.get 1
    (;222:2;)        local.get 2
    (;223:2;)        i32.load offset=12
    (;224:0;)        call 97  runtime.printstring
    (;225:0;)        br 1
    (;226:0;)      end
    (;227:1;)      local.get 2
    (;228:2;)      local.get 1
    (;229:0;)      i32.store offset=28
    (;230:1;)      local.get 2
    (;231:2;)      local.get 0
    (;232:0;)      i32.store offset=24
    (;233:1;)      local.get 2
    (;234:2;)      local.get 0
    (;235:0;)      i32.store offset=16
    (;236:1;)      local.get 2
    (;237:2;)      local.get 1
    (;238:0;)      i32.store offset=20
    (;239:1;)      local.get 2
    (;240:2;)      i32.const 56
    (;241:1;)      i32.add
    (;242:2;)      local.get 2
    (;243:3;)      i32.const 24
    (;244:2;)      i32.add
    (;245:0;)      i32.store
    (;246:1;)      local.get 2
    (;247:2;)      i32.const 52
    (;248:1;)      i32.add
    (;249:2;)      local.get 2
    (;250:3;)      i32.const 24
    (;251:2;)      i32.add
    (;252:0;)      i32.store
    (;253:1;)      local.get 2
    (;254:2;)      i32.const 44
    (;255:1;)      i32.add
    (;256:2;)      local.get 2
    (;257:3;)      i32.const 24
    (;258:2;)      i32.add
    (;259:0;)      i32.store
    (;260:1;)      local.get 2
    (;261:2;)      i32.const 48
    (;262:1;)      i32.add
    (;263:2;)      local.get 2
    (;264:3;)      i32.const 16
    (;265:2;)      i32.add
    (;266:0;)      i32.store
    (;267:1;)      i32.const 40
    (;268:0;)      call 111  runtime.putchar
    (;269:1;)      local.get 0
    (;270:1;)      i64.extend_i32_u
    (;271:0;)      call 113  runtime.printuint64
    (;272:1;)      i32.const 58
    (;273:0;)      call 111  runtime.putchar
    (;274:1;)      local.get 1
    (;275:0;)      call 114  runtime.printptr
    (;276:1;)      i32.const 41
    (;277:0;)      call 111  runtime.putchar
    (;278:0;)    end
    (;279:1;)    i32.const 0
    (;280:2;)    local.get 3
    (;281:0;)    i32.store offset=70816
    (;282:1;)    local.get 2
    (;283:2;)    i32.const 64
    (;284:1;)    i32.add
    (;285:0;)    global.set 0
    (;286:0;)  end
  )

  (func "runtime.printnl" (;99;) (type 6)
    (;0:1;)      i32.const 13
    (;1:0;)      call 111  runtime.putchar
    (;2:1;)      i32.const 10
    (;3:0;)      call 111  runtime.putchar
    (;4:0;)    end
  )

  (func "_start" (;100;) (type 6)
    (local (;0;) i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (;0:1;)      i32.const 0
    (;1:2;)      memory.size 0
    (;2:3;)      i32.const 16
    (;3:2;)      i32.shl
    (;4:2;)      local.tee 0
    (;5:0;)      i32.store offset=70792
    (;6:1;)      i32.const 0
    (;7:2;)      local.get 0
    (;8:3;)      i32.const 70821
    (;9:2;)      i32.sub
    (;10:3;)     i32.const 6
    (;11:2;)     i32.shr_u
    (;12:2;)     local.tee 1
    (;13:3;)     i32.const 70836
    (;14:2;)     i32.add
    (;15:3;)     i32.const -16
    (;16:2;)     i32.and
    (;17:2;)     local.tee 2
    (;18:0;)     i32.store offset=70808
    (;19:1;)     i32.const 0
    (;20:2;)     local.get 0
    (;21:3;)     local.get 2
    (;22:2;)     i32.sub
    (;23:3;)     i32.const 4
    (;24:2;)     i32.shr_u
    (;25:0;)     i32.store offset=70804
    (;26:1;)     i32.const 70821
    (;27:2;)     i32.const 0
    (;28:3;)     local.get 1
    (;29:1;)     call 9  memset
    (;30:0;)     drop
    (;31:1;)     i32.const 1637
    (;32:1;)     call 53  (reflect.Type).Elem
    (;33:0;)     drop
    (;34:1;)     memory.size 0
    (;35:0;)     local.set 0
    (;36:1;)     i32.const 0
    (;37:2;)     i32.const 1
    (;38:0;)     i32.store8 offset=70820
    (;39:1;)     i32.const 0
    (;40:2;)     local.get 0
    (;41:3;)     i32.const 16
    (;42:2;)     i32.shl
    (;43:0;)     i32.store offset=70792
    (;44:0;)     call 101  runtime.scheduler
    (;45:0;)   end
  )

  (func "runtime.scheduler" (;101;) (type 6)
    (local (;0;) i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 0
    (;4:0;)      global.set 0
    (;5:1;)      local.get 0
    (;6:2;)      i32.const 0
    (;7:0;)      i32.store offset=28
    (;8:1;)      local.get 0
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=20 align=2
    (;11:1;)     local.get 0
    (;12:2;)     i64.const 4
    (;13:0;)     i64.store offset=12 align=2
    (;14:1;)     i32.const 0
    (;15:1;)     i32.load offset=70816
    (;16:0;)     local.set 1
    (;17:1;)     i32.const 0
    (;18:2;)     local.get 0
    (;19:3;)     i32.const 8
    (;20:2;)     i32.add
    (;21:0;)     i32.store offset=70816
    (;22:1;)     local.get 0
    (;23:2;)     local.get 1
    (;24:0;)     i32.store offset=8
    (;25:1;)     local.get 0
    (;26:2;)     i32.const 24
    (;27:1;)     i32.add
    (;28:0;)     local.set 2
    (;29:1;)     local.get 0
    (;30:2;)     i32.const 16
    (;31:1;)     i32.add
    (;32:0;)     local.set 3
    (;33:1;)     local.get 0
    (;34:2;)     i32.const 20
    (;35:1;)     i32.add
    (;36:0;)     local.set 4
    (;37:1;)     local.get 0
    (;38:2;)     i32.const 28
    (;39:1;)     i32.add
    (;40:0;)     local.set 5
    (;41:0;)     block
    (;42:0;)       loop
    (;43:1;)         i32.const 0
    (;44:1;)         i32.load8_u offset=70820
    (;45:0;)         br_if 1
    (;46:1;)         local.get 2
    (;47:2;)         i32.const 0
    (;48:2;)         i32.load offset=70776
    (;49:2;)         local.tee 6
    (;50:0;)         i32.store
    (;51:1;)         local.get 3
    (;52:2;)         local.get 6
    (;53:0;)         i32.store
    (;54:1;)         local.get 6
    (;55:1;)         i32.eqz
    (;56:0;)         br_if 1
    (;57:1;)         i32.const 0
    (;58:2;)         local.get 6
    (;59:2;)         i32.load
    (;60:2;)         local.tee 7
    (;61:0;)         i32.store offset=70776
    (;62:1;)         local.get 4
    (;63:2;)         local.get 7
    (;64:0;)         i32.store
    (;65:1;)         local.get 6
    (;66:2;)         i32.const 0
    (;67:0;)         i32.store
    (;68:1;)         local.get 5
    (;69:2;)         local.get 6
    (;70:2;)         i32.load offset=12
    (;71:2;)         local.tee 6
    (;72:0;)         i32.store
    (;73:1;)         local.get 6
    (;74:2;)         local.get 6
    (;75:2;)         i32.load
    (;76:0;)         call_indirect (type 0)
    (;77:0;)         br 0
    (;78:0;)       end
    (;79:0;)     end
    (;80:1;)     i32.const 0
    (;81:2;)     local.get 1
    (;82:0;)     i32.store offset=70816
    (;83:1;)     local.get 0
    (;84:2;)     i32.const 32
    (;85:1;)     i32.add
    (;86:0;)     global.set 0
    (;87:0;)   end
  )

  (func "runtime.markRoot" (;102;) (type 0) (param (;0;) i32)
    (local (;1;) i32)
    (;0:0;)      block
    (;1:1;)        i32.const 0
    (;2:1;)        i32.load offset=70808
    (;3:1;)        local.tee 1
    (;4:2;)        local.get 0
    (;5:1;)        i32.gt_u
    (;6:0;)        br_if 0
    (;7:1;)        i32.const 0
    (;8:1;)        i32.load offset=70792
    (;9:2;)        local.get 0
    (;10:1;)       i32.le_u
    (;11:0;)       br_if 0
    (;12:1;)       local.get 0
    (;13:2;)       local.get 1
    (;14:1;)       i32.sub
    (;15:2;)       i32.const 4
    (;16:1;)       i32.shr_u
    (;17:1;)       local.tee 0
    (;18:1;)       call 103  (runtime.gcBlock).state
    (;19:2;)       i32.const 255
    (;20:1;)       i32.and
    (;21:1;)       i32.eqz
    (;22:0;)       br_if 0
    (;23:1;)       local.get 0
    (;24:1;)       call 108  (runtime.gcBlock).findHead
    (;25:1;)       local.tee 0
    (;26:1;)       call 103  (runtime.gcBlock).state
    (;27:2;)       i32.const 255
    (;28:1;)       i32.and
    (;29:2;)       i32.const 3
    (;30:1;)       i32.eq
    (;31:0;)       br_if 0
    (;32:1;)       local.get 0
    (;33:0;)       call 105  runtime.startMark
    (;34:0;)     end
    (;35:0;)   end
  )

  (func "(runtime.gcBlock).state" (;103;) (type 10) (param (;0;) i32) (result i32)
    (;0:1;)      local.get 0
    (;1:2;)      i32.const 2
    (;2:1;)      i32.shr_u
    (;3:2;)      i32.const 70821
    (;4:1;)      i32.add
    (;5:1;)      i32.load8_u
    (;6:2;)      local.get 0
    (;7:3;)      i32.const 1
    (;8:2;)      i32.shl
    (;9:3;)      i32.const 6
    (;10:2;)     i32.and
    (;11:1;)     i32.shr_u
    (;12:2;)     i32.const 3
    (;13:1;)     i32.and
    (;14:0;)   end
  )

  (func "(runtime.gcBlock).markFree" (;104;) (type 0) (param (;0;) i32)
    (local (;1;) i32)
    (;0:1;)      local.get 0
    (;1:2;)      i32.const 2
    (;2:1;)      i32.shr_u
    (;3:2;)      i32.const 70821
    (;4:1;)      i32.add
    (;5:1;)      local.tee 1
    (;6:2;)      local.get 1
    (;7:2;)      i32.load8_u
    (;8:3;)      i32.const 3
    (;9:4;)      local.get 0
    (;10:5;)     i32.const 1
    (;11:4;)     i32.shl
    (;12:5;)     i32.const 6
    (;13:4;)     i32.and
    (;14:3;)     i32.shl
    (;15:4;)     i32.const -1
    (;16:3;)     i32.xor
    (;17:2;)     i32.and
    (;18:0;)     i32.store8
    (;19:0;)   end
  )

  (func "runtime.startMark" (;105;) (type 0) (param (;0;) i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 64
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 0
    (;7:3;)      i32.const 64
    (;8:1;)      call 9  memset
    (;9:1;)      local.tee 2
    (;10:2;)     local.get 0
    (;11:0;)     i32.store
    (;12:1;)     local.get 0
    (;13:2;)     i32.const 3
    (;14:0;)     call 107  (runtime.gcBlock).setState
    (;15:1;)     i32.const 1
    (;16:0;)     local.set 3
    (;17:0;)     block
    (;18:0;)       loop
    (;19:0;)         block
    (;20:0;)           block
    (;21:1;)             local.get 3
    (;22:2;)             i32.const 1
    (;23:1;)             i32.lt_s
    (;24:0;)             br_if 0
    (;25:1;)             local.get 3
    (;26:2;)             i32.const -1
    (;27:1;)             i32.add
    (;28:1;)             local.tee 3
    (;29:2;)             i32.const 15
    (;30:1;)             i32.le_u
    (;31:0;)             br_if 1
    (;32:0;)             br 3
    (;33:0;)           end
    (;34:1;)           local.get 2
    (;35:2;)           i32.const 64
    (;36:1;)           i32.add
    (;37:0;)           global.set 0
    (;38:0;)           return
    (;39:0;)         end
    (;40:1;)         local.get 2
    (;41:2;)         local.get 3
    (;42:3;)         i32.const 2
    (;43:2;)         i32.shl
    (;44:1;)         i32.add
    (;45:1;)         i32.load
    (;46:1;)         local.tee 1
    (;47:2;)         i32.const 4
    (;48:1;)         i32.shl
    (;49:0;)         local.set 0
    (;50:1;)         i32.const 0
    (;51:1;)         i32.load offset=70808
    (;52:0;)         local.set 4
    (;53:0;)         block
    (;54:0;)           block
    (;55:1;)             local.get 1
    (;56:1;)             call 103  (runtime.gcBlock).state
    (;57:2;)             i32.const 255
    (;58:1;)             i32.and
    (;59:2;)             i32.const 1
    (;60:1;)             i32.eq
    (;61:0;)             br_if 0
    (;62:1;)             local.get 1
    (;63:1;)             call 103  (runtime.gcBlock).state
    (;64:2;)             i32.const 255
    (;65:1;)             i32.and
    (;66:2;)             i32.const 3
    (;67:1;)             i32.ne
    (;68:0;)             br_if 1
    (;69:0;)           end
    (;70:1;)           local.get 1
    (;71:2;)           i32.const 1
    (;72:1;)           i32.add
    (;73:0;)           local.set 1
    (;74:0;)         end
    (;75:1;)         local.get 4
    (;76:2;)         local.get 0
    (;77:1;)         i32.add
    (;78:0;)         local.set 0
    (;79:1;)         i32.const 16
    (;80:2;)         local.get 1
    (;81:3;)         i32.const 4
    (;82:2;)         i32.shl
    (;83:2;)         local.tee 4
    (;84:1;)         i32.sub
    (;85:0;)         local.set 5
    (;86:0;)         loop
    (;87:1;)           local.get 4
    (;88:1;)           local.tee 6
    (;89:2;)           i32.const 16
    (;90:1;)           i32.add
    (;91:0;)           local.set 4
    (;92:1;)           local.get 5
    (;93:2;)           i32.const -16
    (;94:1;)           i32.add
    (;95:0;)           local.set 5
    (;96:1;)           local.get 1
    (;97:1;)           call 103  (runtime.gcBlock).state
    (;98:0;)           local.set 7
    (;99:1;)           local.get 1
    (;100:2;)          i32.const 1
    (;101:1;)          i32.add
    (;102:0;)          local.set 1
    (;103:1;)          local.get 7
    (;104:2;)          i32.const 255
    (;105:1;)          i32.and
    (;106:2;)          i32.const 2
    (;107:1;)          i32.eq
    (;108:0;)          br_if 0
    (;109:0;)        end
    (;110:1;)        i32.const 0
    (;111:1;)        i32.load offset=70808
    (;112:2;)        local.get 6
    (;113:1;)        i32.add
    (;114:0;)        local.set 5
    (;115:0;)        loop
    (;116:1;)          local.get 5
    (;117:2;)          local.get 0
    (;118:1;)          i32.eq
    (;119:0;)          br_if 1
    (;120:0;)          block
    (;121:1;)            local.get 0
    (;122:1;)            i32.load
    (;123:1;)            local.tee 1
    (;124:2;)            i32.const 0
    (;125:2;)            i32.load offset=70808
    (;126:2;)            local.tee 4
    (;127:1;)            i32.lt_u
    (;128:0;)            br_if 0
    (;129:1;)            i32.const 0
    (;130:1;)            i32.load offset=70792
    (;131:2;)            local.get 1
    (;132:1;)            i32.le_u
    (;133:0;)            br_if 0
    (;134:1;)            local.get 1
    (;135:2;)            local.get 4
    (;136:1;)            i32.sub
    (;137:2;)            i32.const 4
    (;138:1;)            i32.shr_u
    (;139:1;)            local.tee 1
    (;140:1;)            call 103  (runtime.gcBlock).state
    (;141:2;)            i32.const 255
    (;142:1;)            i32.and
    (;143:1;)            i32.eqz
    (;144:0;)            br_if 0
    (;145:1;)            local.get 1
    (;146:1;)            call 108  (runtime.gcBlock).findHead
    (;147:1;)            local.tee 1
    (;148:1;)            call 103  (runtime.gcBlock).state
    (;149:2;)            i32.const 255
    (;150:1;)            i32.and
    (;151:2;)            i32.const 3
    (;152:1;)            i32.eq
    (;153:0;)            br_if 0
    (;154:1;)            local.get 1
    (;155:2;)            i32.const 3
    (;156:0;)            call 107  (runtime.gcBlock).setState
    (;157:0;)            block
    (;158:1;)              local.get 3
    (;159:2;)              i32.const 16
    (;160:1;)              i32.ne
    (;161:0;)              br_if 0
    (;162:1;)              i32.const 0
    (;163:2;)              i32.const 1
    (;164:0;)              i32.store8 offset=70812
    (;165:1;)              i32.const 16
    (;166:0;)              local.set 3
    (;167:0;)              br 1
    (;168:0;)            end
    (;169:1;)            local.get 3
    (;170:2;)            i32.const 16
    (;171:1;)            i32.ge_u
    (;172:0;)            br_if 3
    (;173:1;)            local.get 2
    (;174:2;)            local.get 3
    (;175:3;)            i32.const 2
    (;176:2;)            i32.shl
    (;177:1;)            i32.add
    (;178:2;)            local.get 1
    (;179:0;)            i32.store
    (;180:1;)            local.get 3
    (;181:2;)            i32.const 1
    (;182:1;)            i32.add
    (;183:0;)            local.set 3
    (;184:0;)          end
    (;185:1;)          local.get 0
    (;186:2;)          i32.const 4
    (;187:1;)          i32.add
    (;188:0;)          local.set 0
    (;189:0;)          br 0
    (;190:0;)        end
    (;191:0;)      end
    (;192:0;)    end
    (;193:0;)    call 77  runtime.lookupPanic
    (;194:0;)    unreachable
    (;195:0;)  end
  )

  (func "runtime.runtimePanic" (;106;) (type 11) (param (;0;) i32 (;1;) i32)
    (;0:1;)      i32.const 67296
    (;1:2;)      i32.const 22
    (;2:0;)      call 97  runtime.printstring
    (;3:1;)      local.get 0
    (;4:2;)      local.get 1
    (;5:0;)      call 97  runtime.printstring
    (;6:0;)      call 99  runtime.printnl
    (;7:0;)      unreachable
    (;8:0;)      unreachable
    (;9:0;)    end
  )

  (func "(runtime.gcBlock).setState" (;107;) (type 11) (param (;0;) i32 (;1;) i32)
    (local (;2;) i32)
    (;0:1;)      local.get 0
    (;1:2;)      i32.const 2
    (;2:1;)      i32.shr_u
    (;3:2;)      i32.const 70821
    (;4:1;)      i32.add
    (;5:1;)      local.tee 2
    (;6:2;)      local.get 2
    (;7:2;)      i32.load8_u
    (;8:3;)      local.get 1
    (;9:4;)      local.get 0
    (;10:5;)     i32.const 1
    (;11:4;)     i32.shl
    (;12:5;)     i32.const 6
    (;13:4;)     i32.and
    (;14:3;)     i32.shl
    (;15:2;)     i32.or
    (;16:0;)     i32.store8
    (;17:0;)   end
  )

  (func "(runtime.gcBlock).findHead" (;108;) (type 10) (param (;0;) i32) (result i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (;0:0;)      loop
    (;1:1;)        local.get 0
    (;2:1;)        call 103  (runtime.gcBlock).state
    (;3:0;)        local.set 1
    (;4:1;)        local.get 0
    (;5:2;)        i32.const -1
    (;6:1;)        i32.add
    (;7:1;)        local.tee 2
    (;8:0;)        local.set 0
    (;9:1;)        local.get 1
    (;10:2;)       i32.const 255
    (;11:1;)       i32.and
    (;12:2;)       i32.const 2
    (;13:1;)       i32.eq
    (;14:0;)       br_if 0
    (;15:0;)     end
    (;16:1;)     local.get 2
    (;17:2;)     i32.const 1
    (;18:1;)     i32.add
    (;19:0;)   end
  )

  (func "go_scheduler" (;109;) (type 6)
    (;0:0;)      call 101  runtime.scheduler
    (;1:0;)    end
  )

  (func "runtime.printfloat64" (;110;) (type 18) (param (;0;) f64)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) f64)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i32)
    (local (;10;) i32)
    (local (;11;) i32)
    (local (;12;) i32)
    (local (;13;) i32)
    (local (;14;) i32)
    (local (;15;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:0;)      block
    (;6:0;)        block
    (;7:0;)          block
    (;8:1;)            local.get 0
    (;9:2;)            local.get 0
    (;10:1;)           f64.eq
    (;11:1;)           local.tee 2
    (;12:1;)           i32.eqz
    (;13:0;)           br_if 0
    (;14:1;)           local.get 0
    (;15:2;)           local.get 0
    (;16:1;)           f64.add
    (;17:0;)           local.set 3
    (;18:0;)           block
    (;19:0;)             block
    (;20:1;)               local.get 0
    (;21:2;)               f64.const 0
    (;22:1;)               f64.le
    (;23:0;)               br_if 0
    (;24:1;)               local.get 3
    (;25:2;)               local.get 0
    (;26:1;)               f64.ne
    (;27:2;)               local.get 3
    (;28:3;)               local.get 3
    (;29:2;)               f64.eq
    (;30:3;)               local.get 2
    (;31:2;)               i32.and
    (;32:1;)               i32.and
    (;33:1;)               i32.eqz
    (;34:0;)               br_if 1
    (;35:0;)             end
    (;36:0;)             block
    (;37:0;)               block
    (;38:1;)                 local.get 0
    (;39:2;)                 f64.const 0
    (;40:1;)                 f64.ge
    (;41:0;)                 br_if 0
    (;42:1;)                 local.get 3
    (;43:2;)                 local.get 0
    (;44:1;)                 f64.ne
    (;45:2;)                 local.get 3
    (;46:3;)                 local.get 3
    (;47:2;)                 f64.eq
    (;48:3;)                 local.get 2
    (;49:2;)                 i32.and
    (;50:1;)                 i32.and
    (;51:1;)                 i32.eqz
    (;52:0;)                 br_if 1
    (;53:0;)               end
    (;54:1;)               local.get 1
    (;55:2;)               i64.const 0
    (;56:0;)               i64.store
    (;57:1;)               local.get 1
    (;58:2;)               i64.const 0
    (;59:0;)               i64.store offset=6 align=1
    (;60:1;)               i32.const 43
    (;61:0;)               local.set 4
    (;62:1;)               local.get 1
    (;63:2;)               i32.const 43
    (;64:0;)               i32.store8
    (;65:0;)               block
    (;66:1;)                 local.get 0
    (;67:2;)                 f64.const 0
    (;68:1;)                 f64.ne
    (;69:2;)                 local.get 2
    (;70:1;)                 i32.and
    (;71:0;)                 br_if 0
    (;72:1;)                 i32.const 0
    (;73:0;)                 local.set 5
    (;74:1;)                 i32.const 43
    (;75:0;)                 local.set 4
    (;76:1;)                 f64.const 1
    (;77:2;)                 local.get 0
    (;78:1;)                 f64.div
    (;79:2;)                 f64.const 0
    (;80:1;)                 f64.ge
    (;81:2;)                 i32.const 1
    (;82:1;)                 i32.xor
    (;83:0;)                 br_if 4
    (;84:0;)                 br 5
    (;85:0;)               end
    (;86:0;)               block
    (;87:1;)                 local.get 0
    (;88:2;)                 f64.const 0
    (;89:1;)                 f64.ge
    (;90:0;)                 br_if 0
    (;91:1;)                 i32.const 45
    (;92:0;)                 local.set 4
    (;93:1;)                 local.get 1
    (;94:2;)                 i32.const 45
    (;95:0;)                 i32.store8
    (;96:1;)                 f64.const 0
    (;97:2;)                 local.get 0
    (;98:1;)                 f64.sub
    (;99:0;)                 local.set 0
    (;100:0;)              end
    (;101:1;)              i32.const 0
    (;102:0;)              local.set 5
    (;103:0;)              loop
    (;104:0;)                block
    (;105:1;)                  local.get 0
    (;106:2;)                  f64.const 10
    (;107:1;)                  f64.lt
    (;108:2;)                  i32.const 1
    (;109:1;)                  i32.xor
    (;110:0;)                  br_if 0
    (;111:0;)                  block
    (;112:0;)                    loop
    (;113:1;)                      local.get 0
    (;114:2;)                      f64.const 1
    (;115:1;)                      f64.ge
    (;116:0;)                      br_if 1
    (;117:1;)                      local.get 0
    (;118:2;)                      f64.const 10
    (;119:1;)                      f64.mul
    (;120:0;)                      local.set 0
    (;121:1;)                      local.get 5
    (;122:2;)                      i32.const -1
    (;123:1;)                      i32.add
    (;124:0;)                      local.set 5
    (;125:0;)                      br 0
    (;126:0;)                    end
    (;127:0;)                  end
    (;128:1;)                  local.get 0
    (;129:2;)                  f64.const 5.000000000000001e-07
    (;130:1;)                  f64.add
    (;131:1;)                  local.tee 0
    (;132:2;)                  f64.const 10
    (;133:1;)                  f64.lt
    (;134:0;)                  br_if 6
    (;135:1;)                  local.get 0
    (;136:2;)                  f64.const 10
    (;137:1;)                  f64.div
    (;138:0;)                  local.set 0
    (;139:1;)                  local.get 5
    (;140:2;)                  i32.const 1
    (;141:1;)                  i32.add
    (;142:0;)                  local.set 5
    (;143:0;)                  br 6
    (;144:0;)                end
    (;145:1;)                local.get 0
    (;146:2;)                f64.const 10
    (;147:1;)                f64.div
    (;148:0;)                local.set 0
    (;149:1;)                local.get 5
    (;150:2;)                i32.const 1
    (;151:1;)                i32.add
    (;152:0;)                local.set 5
    (;153:0;)                br 0
    (;154:0;)              end
    (;155:0;)            end
    (;156:1;)            i32.const 67257
    (;157:2;)            i32.const 4
    (;158:0;)            call 97  runtime.printstring
    (;159:1;)            local.get 1
    (;160:2;)            i32.const 32
    (;161:1;)            i32.add
    (;162:0;)            global.set 0
    (;163:0;)            return
    (;164:0;)          end
    (;165:1;)          i32.const 67253
    (;166:2;)          i32.const 4
    (;167:0;)          call 97  runtime.printstring
    (;168:1;)          local.get 1
    (;169:2;)          i32.const 32
    (;170:1;)          i32.add
    (;171:0;)          global.set 0
    (;172:0;)          return
    (;173:0;)        end
    (;174:1;)        i32.const 67250
    (;175:2;)        i32.const 3
    (;176:0;)        call 97  runtime.printstring
    (;177:1;)        local.get 1
    (;178:2;)        i32.const 32
    (;179:1;)        i32.add
    (;180:0;)        global.set 0
    (;181:0;)        return
    (;182:0;)      end
    (;183:1;)      i32.const 45
    (;184:0;)      local.set 4
    (;185:1;)      local.get 1
    (;186:2;)      i32.const 45
    (;187:0;)      i32.store8
    (;188:0;)    end
    (;189:1;)    local.get 1
    (;190:2;)    i32.const 2
    (;191:1;)    i32.or
    (;192:0;)    local.set 6
    (;193:1;)    i32.const 0
    (;194:0;)    local.set 2
    (;195:0;)    block
    (;196:0;)      loop
    (;197:1;)        local.get 2
    (;198:2;)        i32.const 7
    (;199:1;)        i32.eq
    (;200:0;)        br_if 1
    (;201:1;)        local.get 6
    (;202:2;)        local.get 2
    (;203:1;)        i32.add
    (;204:0;)        local.set 7
    (;205:0;)        block
    (;206:0;)          block
    (;207:1;)            local.get 0
    (;208:1;)            f64.abs
    (;209:2;)            f64.const 2.147483648e+09
    (;210:1;)            f64.lt
    (;211:1;)            i32.eqz
    (;212:0;)            br_if 0
    (;213:1;)            local.get 0
    (;214:1;)            i32.trunc_f64_s
    (;215:0;)            local.set 8
    (;216:0;)            br 1
    (;217:0;)          end
    (;218:1;)          i32.const -2147483648
    (;219:0;)          local.set 8
    (;220:0;)        end
    (;221:1;)        local.get 7
    (;222:2;)        local.get 8
    (;223:3;)        i32.const 48
    (;224:2;)        i32.add
    (;225:0;)        i32.store8
    (;226:1;)        local.get 2
    (;227:2;)        i32.const 1
    (;228:1;)        i32.add
    (;229:0;)        local.set 2
    (;230:1;)        local.get 0
    (;231:2;)        local.get 8
    (;232:2;)        f64.convert_i32_s
    (;233:1;)        f64.sub
    (;234:2;)        f64.const 10
    (;235:1;)        f64.mul
    (;236:0;)        local.set 0
    (;237:0;)        br 0
    (;238:0;)      end
    (;239:0;)    end
    (;240:1;)    local.get 1
    (;241:2;)    i32.const 101
    (;242:0;)    i32.store8 offset=9
    (;243:1;)    local.get 1
    (;244:1;)    i32.load8_u offset=2
    (;245:0;)    local.set 8
    (;246:1;)    local.get 1
    (;247:2;)    i32.const 46
    (;248:0;)    i32.store8 offset=2
    (;249:1;)    local.get 1
    (;250:2;)    local.get 8
    (;251:0;)    i32.store8 offset=1
    (;252:1;)    i32.const 0
    (;253:0;)    local.set 2
    (;254:1;)    local.get 1
    (;255:2;)    i32.const 45
    (;256:3;)    i32.const 43
    (;257:4;)    local.get 5
    (;258:5;)    i32.const 0
    (;259:4;)    i32.lt_s
    (;260:2;)    select
    (;261:2;)    local.tee 7
    (;262:0;)    i32.store8 offset=10
    (;263:1;)    local.get 1
    (;264:2;)    local.get 5
    (;265:3;)    local.get 5
    (;266:4;)    i32.const 31
    (;267:3;)    i32.shr_s
    (;268:3;)    local.tee 6
    (;269:2;)    i32.add
    (;270:3;)    local.get 6
    (;271:2;)    i32.xor
    (;272:2;)    local.tee 6
    (;273:3;)    i32.const 100
    (;274:2;)    i32.div_s
    (;275:3;)    i32.const 48
    (;276:2;)    i32.add
    (;277:2;)    local.tee 5
    (;278:0;)    i32.store8 offset=11
    (;279:1;)    local.get 1
    (;280:2;)    local.get 6
    (;281:3;)    local.get 6
    (;282:4;)    i32.const 10
    (;283:3;)    i32.div_s
    (;284:3;)    local.tee 9
    (;285:4;)    i32.const 10
    (;286:3;)    i32.mul
    (;287:2;)    i32.sub
    (;288:3;)    i32.const 48
    (;289:2;)    i32.add
    (;290:2;)    local.tee 6
    (;291:0;)    i32.store8 offset=13
    (;292:1;)    local.get 1
    (;293:2;)    local.get 9
    (;294:3;)    i32.const 255
    (;295:2;)    i32.and
    (;296:3;)    i32.const 10
    (;297:2;)    i32.rem_u
    (;298:3;)    i32.const 48
    (;299:2;)    i32.or
    (;300:2;)    local.tee 9
    (;301:0;)    i32.store8 offset=12
    (;302:1;)    local.get 1
    (;303:1;)    i32.load8_u offset=8
    (;304:0;)    local.set 10
    (;305:1;)    local.get 1
    (;306:1;)    i32.load8_u offset=7
    (;307:0;)    local.set 11
    (;308:1;)    local.get 1
    (;309:1;)    i32.load8_u offset=6
    (;310:0;)    local.set 12
    (;311:1;)    local.get 1
    (;312:1;)    i32.load8_u offset=5
    (;313:0;)    local.set 13
    (;314:1;)    local.get 1
    (;315:1;)    i32.load8_u offset=4
    (;316:0;)    local.set 14
    (;317:1;)    local.get 1
    (;318:1;)    i32.load8_u offset=3
    (;319:0;)    local.set 15
    (;320:0;)    loop
    (;321:0;)      block
    (;322:1;)        local.get 2
    (;323:2;)        i32.const 14
    (;324:1;)        i32.ne
    (;325:0;)        br_if 0
    (;326:1;)        local.get 1
    (;327:2;)        i32.const 32
    (;328:1;)        i32.add
    (;329:0;)        global.set 0
    (;330:0;)        return
    (;331:0;)      end
    (;332:1;)      local.get 1
    (;333:2;)      local.get 6
    (;334:0;)      i32.store8 offset=31
    (;335:1;)      local.get 1
    (;336:2;)      local.get 9
    (;337:0;)      i32.store8 offset=30
    (;338:1;)      local.get 1
    (;339:2;)      local.get 5
    (;340:0;)      i32.store8 offset=29
    (;341:1;)      local.get 1
    (;342:2;)      local.get 7
    (;343:0;)      i32.store8 offset=28
    (;344:1;)      local.get 1
    (;345:2;)      i32.const 101
    (;346:0;)      i32.store8 offset=27
    (;347:1;)      local.get 1
    (;348:2;)      local.get 10
    (;349:0;)      i32.store8 offset=26
    (;350:1;)      local.get 1
    (;351:2;)      local.get 11
    (;352:0;)      i32.store8 offset=25
    (;353:1;)      local.get 1
    (;354:2;)      local.get 12
    (;355:0;)      i32.store8 offset=24
    (;356:1;)      local.get 1
    (;357:2;)      local.get 13
    (;358:0;)      i32.store8 offset=23
    (;359:1;)      local.get 1
    (;360:2;)      local.get 14
    (;361:0;)      i32.store8 offset=22
    (;362:1;)      local.get 1
    (;363:2;)      local.get 15
    (;364:0;)      i32.store8 offset=21
    (;365:1;)      local.get 1
    (;366:2;)      i32.const 46
    (;367:0;)      i32.store8 offset=20
    (;368:1;)      local.get 1
    (;369:2;)      local.get 8
    (;370:0;)      i32.store8 offset=19
    (;371:1;)      local.get 1
    (;372:2;)      local.get 4
    (;373:0;)      i32.store8 offset=18
    (;374:1;)      local.get 1
    (;375:2;)      i32.const 18
    (;376:1;)      i32.add
    (;377:2;)      local.get 2
    (;378:1;)      i32.add
    (;379:1;)      i32.load8_u
    (;380:0;)      call 111  runtime.putchar
    (;381:1;)      local.get 2
    (;382:2;)      i32.const 1
    (;383:1;)      i32.add
    (;384:0;)      local.set 2
    (;385:0;)      br 0
    (;386:0;)    end
    (;387:0;)  end
  )

  (func "runtime.putchar" (;111;) (type 0) (param (;0;) i32)
    (local (;1;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 16
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      i32.const 0
    (;6:2;)      local.get 0
    (;7:0;)      i32.store8 offset=70813
    (;8:1;)      local.get 1
    (;9:2;)      i32.const 0
    (;10:0;)     i32.store offset=12
    (;11:1;)     i32.const 1
    (;12:2;)     i32.const 70752
    (;13:3;)     i32.const 1
    (;14:4;)     local.get 1
    (;15:5;)     i32.const 12
    (;16:4;)     i32.add
    (;17:1;)     call 6  wasi_unstable::fd_write
    (;18:0;)     drop
    (;19:1;)     local.get 1
    (;20:2;)     i32.const 16
    (;21:1;)     i32.add
    (;22:0;)     global.set 0
    (;23:0;)   end
  )

  (func "runtime.printint32" (;112;) (type 0) (param (;0;) i32)
    (;0:0;)      block
    (;1:1;)        local.get 0
    (;2:2;)        i32.const -1
    (;3:1;)        i32.gt_s
    (;4:0;)        br_if 0
    (;5:1;)        i32.const 45
    (;6:0;)        call 111  runtime.putchar
    (;7:1;)        i32.const 0
    (;8:2;)        local.get 0
    (;9:1;)        i32.sub
    (;10:0;)       local.set 0
    (;11:0;)     end
    (;12:1;)     local.get 0
    (;13:1;)     i64.extend_i32_u
    (;14:0;)     call 113  runtime.printuint64
    (;15:0;)   end
  )

  (func "runtime.printuint64" (;113;) (type 19) (param (;0;) i64)
    (local (;1;) i32)
    (local (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i64)
    (local (;5;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 32
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 1
    (;4:0;)      global.set 0
    (;5:1;)      local.get 1
    (;6:2;)      i32.const 24
    (;7:1;)      i32.add
    (;8:2;)      i32.const 0
    (;9:0;)      i32.store
    (;10:1;)     local.get 1
    (;11:2;)     i32.const 16
    (;12:1;)     i32.add
    (;13:2;)     i64.const 0
    (;14:0;)     i64.store
    (;15:1;)     local.get 1
    (;16:2;)     i64.const 0
    (;17:0;)     i64.store offset=8
    (;18:1;)     i32.const 19
    (;19:0;)     local.set 2
    (;20:1;)     i32.const 19
    (;21:0;)     local.set 3
    (;22:0;)     block
    (;23:0;)       loop
    (;24:0;)         block
    (;25:1;)           local.get 3
    (;26:2;)           i32.const -1
    (;27:1;)           i32.gt_s
    (;28:0;)           br_if 0
    (;29:0;)           loop
    (;30:1;)             local.get 2
    (;31:2;)             i32.const 20
    (;32:1;)             i32.ge_s
    (;33:0;)             br_if 3
    (;34:1;)             local.get 1
    (;35:2;)             i32.const 8
    (;36:1;)             i32.add
    (;37:2;)             local.get 2
    (;38:1;)             i32.add
    (;39:1;)             i32.load8_u
    (;40:0;)             call 111  runtime.putchar
    (;41:1;)             local.get 2
    (;42:2;)             i32.const 1
    (;43:1;)             i32.add
    (;44:0;)             local.set 2
    (;45:0;)             br 0
    (;46:0;)           end
    (;47:0;)         end
    (;48:1;)         local.get 1
    (;49:2;)         i32.const 8
    (;50:1;)         i32.add
    (;51:2;)         local.get 3
    (;52:1;)         i32.add
    (;53:2;)         local.get 0
    (;54:3;)         local.get 0
    (;55:4;)         i64.const 10
    (;56:3;)         i64.div_u
    (;57:3;)         local.tee 4
    (;58:4;)         i64.const 10
    (;59:3;)         i64.mul
    (;60:2;)         i64.sub
    (;61:2;)         i32.wrap_i64
    (;62:3;)         i32.const 48
    (;63:2;)         i32.or
    (;64:2;)         local.tee 5
    (;65:0;)         i32.store8
    (;66:1;)         local.get 2
    (;67:2;)         local.get 3
    (;68:3;)         local.get 5
    (;69:4;)         i32.const 255
    (;70:3;)         i32.and
    (;71:4;)         i32.const 48
    (;72:3;)         i32.eq
    (;73:1;)         select
    (;74:0;)         local.set 2
    (;75:1;)         local.get 3
    (;76:2;)         i32.const -1
    (;77:1;)         i32.add
    (;78:0;)         local.set 3
    (;79:1;)         local.get 4
    (;80:0;)         local.set 0
    (;81:0;)         br 0
    (;82:0;)       end
    (;83:0;)     end
    (;84:1;)     local.get 1
    (;85:2;)     i32.const 32
    (;86:1;)     i32.add
    (;87:0;)     global.set 0
    (;88:0;)   end
  )

  (func "runtime.printptr" (;114;) (type 0) (param (;0;) i32)
    (local (;1;) i32)
    (local (;2;) i32)
    (;0:0;)      block
    (;1:1;)        local.get 0
    (;2:1;)        i32.eqz
    (;3:0;)        br_if 0
    (;4:1;)        i32.const 48
    (;5:0;)        call 111  runtime.putchar
    (;6:1;)        i32.const 120
    (;7:0;)        call 111  runtime.putchar
    (;8:1;)        i32.const 8
    (;9:0;)        local.set 1
    (;10:0;)       block
    (;11:0;)         loop
    (;12:1;)           local.get 1
    (;13:1;)           i32.eqz
    (;14:0;)           br_if 1
    (;15:1;)           local.get 0
    (;16:2;)           i32.const 28
    (;17:1;)           i32.shr_u
    (;18:1;)           local.tee 2
    (;19:2;)           i32.const 48
    (;20:1;)           i32.or
    (;21:2;)           local.get 2
    (;22:3;)           i32.const 87
    (;23:2;)           i32.add
    (;24:3;)           local.get 2
    (;25:4;)           i32.const 10
    (;26:3;)           i32.lt_u
    (;27:1;)           select
    (;28:0;)           call 111  runtime.putchar
    (;29:1;)           local.get 1
    (;30:2;)           i32.const -1
    (;31:1;)           i32.add
    (;32:0;)           local.set 1
    (;33:1;)           local.get 0
    (;34:2;)           i32.const 4
    (;35:1;)           i32.shl
    (;36:0;)           local.set 0
    (;37:0;)           br 0
    (;38:0;)         end
    (;39:0;)       end
    (;40:0;)       return
    (;41:0;)     end
    (;42:1;)     i32.const 67261
    (;43:2;)     i32.const 3
    (;44:0;)     call 97  runtime.printstring
    (;45:0;)   end
  )

  (func "(error).Error" (;115;) (type 1) (param (;0;) i32 (;1;) i32 (;2;) i32)
    (local (;3;) i32)
    (local (;4;) i32)
    (local (;5;) i32)
    (local (;6;) i32)
    (local (;7;) i32)
    (local (;8;) i32)
    (local (;9;) i32)
    (local (;10;) i32)
    (local (;11;) i32)
    (local (;12;) i32)
    (local (;13;) i32)
    (local (;14;) i32)
    (local (;15;) i32)
    (local (;16;) i32)
    (local (;17;) i32)
    (local (;18;) i32)
    (local (;19;) i32)
    (local (;20;) i32)
    (local (;21;) i32)
    (local (;22;) i32)
    (local (;23;) i32)
    (local (;24;) i32)
    (local (;25;) i32)
    (local (;26;) i32)
    (local (;27;) i32)
    (local (;28;) i32)
    (local (;29;) i32)
    (local (;30;) i32)
    (local (;31;) i32)
    (local (;32;) i32)
    (local (;33;) i32)
    (local (;34;) i32)
    (local (;35;) i32)
    (local (;36;) i32)
    (local (;37;) i32)
    (local (;38;) i32)
    (local (;39;) i32)
    (local (;40;) i32)
    (local (;41;) i32)
    (local (;42;) i32)
    (local (;43;) i32)
    (local (;44;) i32)
    (;0:1;)      global.get 0
    (;1:2;)      i32.const 768
    (;2:1;)      i32.sub
    (;3:1;)      local.tee 3
    (;4:0;)      global.set 0
    (;5:1;)      local.get 3
    (;6:2;)      i64.const 0
    (;7:0;)      i64.store offset=744
    (;8:1;)      local.get 3
    (;9:2;)      i64.const 0
    (;10:0;)     i64.store offset=736
    (;11:1;)     local.get 3
    (;12:2;)     i64.const 0
    (;13:0;)     i64.store offset=728
    (;14:1;)     local.get 3
    (;15:2;)     i64.const 0
    (;16:0;)     i64.store offset=720
    (;17:1;)     local.get 3
    (;18:2;)     i64.const 0
    (;19:0;)     i64.store offset=712
    (;20:1;)     local.get 3
    (;21:2;)     i64.const 0
    (;22:0;)     i64.store offset=704
    (;23:1;)     local.get 3
    (;24:2;)     i64.const 0
    (;25:0;)     i64.store offset=696
    (;26:1;)     local.get 3
    (;27:2;)     i64.const 0
    (;28:0;)     i64.store offset=688
    (;29:1;)     local.get 3
    (;30:2;)     i64.const 0
    (;31:0;)     i64.store offset=680
    (;32:1;)     local.get 3
    (;33:2;)     i64.const 0
    (;34:0;)     i64.store offset=672
    (;35:1;)     local.get 3
    (;36:2;)     i64.const 0
    (;37:0;)     i64.store offset=664
    (;38:1;)     local.get 3
    (;39:2;)     i64.const 0
    (;40:0;)     i64.store offset=656
    (;41:1;)     local.get 3
    (;42:2;)     i64.const 0
    (;43:0;)     i64.store offset=648
    (;44:1;)     local.get 3
    (;45:2;)     i64.const 0
    (;46:0;)     i64.store offset=640
    (;47:1;)     local.get 3
    (;48:2;)     i64.const 0
    (;49:0;)     i64.store offset=632
    (;50:1;)     local.get 3
    (;51:2;)     i64.const 0
    (;52:0;)     i64.store offset=624
    (;53:1;)     local.get 3
    (;54:2;)     i64.const 0
    (;55:0;)     i64.store offset=616
    (;56:1;)     local.get 3
    (;57:2;)     i64.const 0
    (;58:0;)     i64.store offset=608
    (;59:1;)     local.get 3
    (;60:2;)     i64.const 0
    (;61:0;)     i64.store offset=600
    (;62:1;)     local.get 3
    (;63:2;)     i64.const 0
    (;64:0;)     i64.store offset=592
    (;65:1;)     local.get 3
    (;66:2;)     i64.const 0
    (;67:0;)     i64.store offset=584
    (;68:1;)     local.get 3
    (;69:2;)     i64.const 0
    (;70:0;)     i64.store offset=576
    (;71:1;)     local.get 3
    (;72:2;)     i64.const 0
    (;73:0;)     i64.store offset=568
    (;74:1;)     local.get 3
    (;75:2;)     i64.const 0
    (;76:0;)     i64.store offset=560
    (;77:1;)     local.get 3
    (;78:2;)     i64.const 0
    (;79:0;)     i64.store offset=552
    (;80:1;)     local.get 3
    (;81:2;)     i64.const 0
    (;82:0;)     i64.store offset=544
    (;83:1;)     local.get 3
    (;84:2;)     i64.const 0
    (;85:0;)     i64.store offset=536
    (;86:1;)     local.get 3
    (;87:2;)     i64.const 0
    (;88:0;)     i64.store offset=528
    (;89:1;)     local.get 3
    (;90:2;)     i64.const 0
    (;91:0;)     i64.store offset=520
    (;92:1;)     local.get 3
    (;93:2;)     i64.const 0
    (;94:0;)     i64.store offset=512
    (;95:1;)     local.get 3
    (;96:2;)     i64.const 0
    (;97:0;)     i64.store offset=504
    (;98:1;)     local.get 3
    (;99:2;)     i64.const 283467841536
    (;100:0;)    i64.store offset=496
    (;101:1;)    local.get 3
    (;102:2;)    i64.const 0
    (;103:0;)    i64.store offset=760
    (;104:1;)    local.get 3
    (;105:2;)    i64.const 0
    (;106:0;)    i64.store offset=752
    (;107:1;)    i32.const 0
    (;108:1;)    i32.load offset=70816
    (;109:0;)    local.set 4
    (;110:1;)    i32.const 0
    (;111:2;)    local.get 3
    (;112:3;)    i32.const 496
    (;113:2;)    i32.add
    (;114:0;)    i32.store offset=70816
    (;115:1;)    local.get 3
    (;116:2;)    local.get 4
    (;117:0;)    i32.store offset=496
    (;118:0;)    block
    (;119:0;)      block
    (;120:1;)        local.get 2
    (;121:2;)        i32.const -997
    (;122:1;)        i32.add
    (;123:2;)        i32.const 22
    (;124:1;)        i32.rotl
    (;125:1;)        local.tee 2
    (;126:2;)        i32.const 4
    (;127:1;)        i32.gt_u
    (;128:0;)        br_if 0
    (;129:0;)        block
    (;130:0;)          block
    (;131:0;)            block
    (;132:0;)              block
    (;133:1;)                local.get 2
    (;134:0;)                br_table 3 4 2 1 0 3
    (;135:0;)              end
    (;136:1;)              local.get 1
    (;137:1;)              i32.eqz
    (;138:0;)              br_if 3
    (;139:1;)              local.get 3
    (;140:2;)              i32.const 504
    (;141:1;)              i32.add
    (;142:2;)              local.get 1
    (;143:2;)              i32.load
    (;144:2;)              local.tee 2
    (;145:0;)              i32.store
    (;146:1;)              i32.const 0
    (;147:2;)              local.get 4
    (;148:0;)              i32.store offset=70816
    (;149:1;)              local.get 0
    (;150:2;)              local.get 1
    (;151:2;)              i32.load offset=4
    (;152:0;)              i32.store offset=4
    (;153:1;)              local.get 0
    (;154:2;)              local.get 2
    (;155:0;)              i32.store
    (;156:1;)              local.get 3
    (;157:2;)              i32.const 768
    (;158:1;)              i32.add
    (;159:0;)              global.set 0
    (;160:0;)              return
    (;161:0;)            end
    (;162:1;)            local.get 1
    (;163:1;)            i32.eqz
    (;164:0;)            br_if 2
    (;165:1;)            local.get 3
    (;166:2;)            i32.const 508
    (;167:1;)            i32.add
    (;168:2;)            local.get 1
    (;169:2;)            i32.load
    (;170:2;)            local.tee 2
    (;171:0;)            i32.store
    (;172:1;)            local.get 3
    (;173:2;)            i32.const 8
    (;174:1;)            i32.add
    (;175:2;)            i32.const 67360
    (;176:3;)            i32.const 30
    (;177:4;)            local.get 2
    (;178:5;)            local.get 1
    (;179:5;)            i32.load offset=4
    (;180:0;)            call 91  runtime.stringConcat
    (;181:1;)            local.get 3
    (;182:2;)            i32.const 496
    (;183:1;)            i32.add
    (;184:2;)            i32.const 16
    (;185:1;)            i32.add
    (;186:2;)            local.get 3
    (;187:2;)            i32.load offset=8
    (;188:2;)            local.tee 2
    (;189:0;)            i32.store
    (;190:1;)            local.get 3
    (;191:2;)            local.get 2
    (;192:3;)            local.get 3
    (;193:3;)            i32.load offset=12
    (;194:4;)            i32.const 67423
    (;195:5;)            i32.const 16
    (;196:0;)            call 91  runtime.stringConcat
    (;197:1;)            i32.const 0
    (;198:2;)            local.get 4
    (;199:0;)            i32.store offset=70816
    (;200:1;)            local.get 3
    (;201:2;)            i32.const 516
    (;202:1;)            i32.add
    (;203:2;)            local.get 3
    (;204:2;)            i32.load
    (;205:2;)            local.tee 2
    (;206:0;)            i32.store
    (;207:1;)            local.get 0
    (;208:2;)            local.get 3
    (;209:2;)            i32.load offset=4
    (;210:0;)            i32.store offset=4
    (;211:1;)            local.get 0
    (;212:2;)            local.get 2
    (;213:0;)            i32.store
    (;214:1;)            local.get 3
    (;215:2;)            i32.const 768
    (;216:1;)            i32.add
    (;217:0;)            global.set 0
    (;218:0;)            return
    (;219:0;)          end
    (;220:1;)          local.get 1
    (;221:1;)          i32.eqz
    (;222:0;)          br_if 1
    (;223:1;)          local.get 3
    (;224:2;)          i32.const 520
    (;225:1;)          i32.add
    (;226:2;)          local.get 1
    (;227:2;)          i32.load
    (;228:2;)          local.tee 2
    (;229:0;)          i32.store
    (;230:1;)          local.get 3
    (;231:2;)          i32.const 24
    (;232:1;)          i32.add
    (;233:2;)          i32.const 67392
    (;234:3;)          i32.const 31
    (;235:4;)          local.get 2
    (;236:5;)          local.get 1
    (;237:5;)          i32.load offset=4
    (;238:0;)          call 91  runtime.stringConcat
    (;239:1;)          local.get 3
    (;240:2;)          i32.const 524
    (;241:1;)          i32.add
    (;242:2;)          local.get 3
    (;243:2;)          i32.load offset=24
    (;244:2;)          local.tee 2
    (;245:0;)          i32.store
    (;246:1;)          local.get 3
    (;247:2;)          i32.const 16
    (;248:1;)          i32.add
    (;249:2;)          local.get 2
    (;250:3;)          local.get 3
    (;251:3;)          i32.load offset=28
    (;252:4;)          i32.const 67423
    (;253:5;)          i32.const 16
    (;254:0;)          call 91  runtime.stringConcat
    (;255:1;)          i32.const 0
    (;256:2;)          local.get 4
    (;257:0;)          i32.store offset=70816
    (;258:1;)          local.get 3
    (;259:2;)          i32.const 528
    (;260:1;)          i32.add
    (;261:2;)          local.get 3
    (;262:2;)          i32.load offset=16
    (;263:2;)          local.tee 2
    (;264:0;)          i32.store
    (;265:1;)          local.get 0
    (;266:2;)          local.get 3
    (;267:2;)          i32.load offset=20
    (;268:0;)          i32.store offset=4
    (;269:1;)          local.get 0
    (;270:2;)          local.get 2
    (;271:0;)          i32.store
    (;272:1;)          local.get 3
    (;273:2;)          i32.const 768
    (;274:1;)          i32.add
    (;275:0;)          global.set 0
    (;276:0;)          return
    (;277:0;)        end
    (;278:1;)        local.get 1
    (;279:1;)        i32.eqz
    (;280:0;)        br_if 0
    (;281:1;)        local.get 3
    (;282:2;)        i32.const 532
    (;283:1;)        i32.add
    (;284:2;)        local.get 1
    (;285:2;)        i32.load
    (;286:2;)        local.tee 2
    (;287:0;)        i32.store
    (;288:1;)        local.get 3
    (;289:2;)        i32.const 440
    (;290:1;)        i32.add
    (;291:2;)        i32.const 67439
    (;292:3;)        i32.const 8
    (;293:4;)        local.get 2
    (;294:5;)        local.get 1
    (;295:5;)        i32.load offset=4
    (;296:0;)        call 91  runtime.stringConcat
    (;297:1;)        local.get 3
    (;298:2;)        i32.const 536
    (;299:1;)        i32.add
    (;300:2;)        local.get 3
    (;301:2;)        i32.load offset=440
    (;302:2;)        local.tee 2
    (;303:0;)        i32.store
    (;304:1;)        local.get 3
    (;305:2;)        i32.const 432
    (;306:1;)        i32.add
    (;307:2;)        local.get 2
    (;308:3;)        local.get 3
    (;309:3;)        i32.load offset=444
    (;310:4;)        i32.const 67455
    (;311:5;)        i32.const 2
    (;312:0;)        call 91  runtime.stringConcat
    (;313:1;)        local.get 3
    (;314:2;)        i32.const 540
    (;315:1;)        i32.add
    (;316:2;)        local.get 3
    (;317:2;)        i32.load offset=432
    (;318:2;)        local.tee 2
    (;319:0;)        i32.store
    (;320:1;)        local.get 3
    (;321:2;)        i32.const 424
    (;322:1;)        i32.add
    (;323:2;)        local.get 2
    (;324:3;)        local.get 3
    (;325:3;)        i32.load offset=436
    (;326:4;)        i32.const 67447
    (;327:5;)        i32.const 8
    (;328:0;)        call 91  runtime.stringConcat
    (;329:1;)        local.get 3
    (;330:2;)        i32.const 544
    (;331:1;)        i32.add
    (;332:2;)        local.get 3
    (;333:2;)        i32.load offset=424
    (;334:2;)        local.tee 5
    (;335:0;)        i32.store
    (;336:1;)        local.get 3
    (;337:2;)        i32.const 548
    (;338:1;)        i32.add
    (;339:2;)        local.get 1
    (;340:2;)        i32.load offset=8
    (;341:2;)        local.tee 6
    (;342:0;)        i32.store
    (;343:1;)        local.get 1
    (;344:1;)        i32.load offset=12
    (;345:1;)        local.tee 7
    (;346:2;)        i32.const 3
    (;347:1;)        i32.mul
    (;348:1;)        local.tee 8
    (;349:2;)        i32.const 2
    (;350:1;)        i32.div_s
    (;351:0;)        local.set 2
    (;352:0;)        block
    (;353:1;)          local.get 8
    (;354:2;)          i32.const -2
    (;355:1;)          i32.le_s
    (;356:0;)          br_if 0
    (;357:1;)          local.get 3
    (;358:1;)          i32.load offset=428
    (;359:0;)          local.set 9
    (;360:1;)          local.get 3
    (;361:2;)          i32.const 552
    (;362:1;)          i32.add
    (;363:2;)          local.get 2
    (;364:2;)          call 59  runtime.alloc
    (;365:2;)          local.tee 8
    (;366:0;)          i32.store
    (;367:1;)          local.get 3
    (;368:2;)          i32.const 560
    (;369:1;)          i32.add
    (;370:2;)          local.get 3
    (;371:3;)          i32.const 460
    (;372:2;)          i32.add
    (;373:0;)          i32.store
    (;374:1;)          local.get 3
    (;375:2;)          i32.const 584
    (;376:1;)          i32.add
    (;377:2;)          local.get 3
    (;378:3;)          i32.const 456
    (;379:2;)          i32.add
    (;380:0;)          i32.store
    (;381:1;)          local.get 3
    (;382:2;)          i32.const 592
    (;383:1;)          i32.add
    (;384:2;)          local.get 3
    (;385:3;)          i32.const 452
    (;386:2;)          i32.add
    (;387:0;)          i32.store
    (;388:1;)          local.get 3
    (;389:2;)          i32.const 724
    (;390:1;)          i32.add
    (;391:2;)          local.get 3
    (;392:3;)          i32.const 448
    (;393:2;)          i32.add
    (;394:0;)          i32.store
    (;395:1;)          i32.const 0
    (;396:0;)          local.set 10
    (;397:0;)          block
    (;398:1;)            local.get 2
    (;399:2;)            local.get 7
    (;400:1;)            i32.ge_s
    (;401:0;)            br_if 0
    (;402:1;)            i32.const 0
    (;403:0;)            local.set 10
    (;404:1;)            local.get 7
    (;405:2;)            i32.const 2
    (;406:1;)            i32.add
    (;407:1;)            local.tee 2
    (;408:2;)            i32.const 0
    (;409:1;)            i32.lt_s
    (;410:0;)            br_if 1
    (;411:1;)            local.get 3
    (;412:2;)            i32.const 720
    (;413:1;)            i32.add
    (;414:2;)            local.get 2
    (;415:2;)            call 59  runtime.alloc
    (;416:2;)            local.tee 8
    (;417:0;)            i32.store
    (;418:0;)          end
    (;419:1;)          local.get 3
    (;420:2;)          i32.const 556
    (;421:1;)          i32.add
    (;422:2;)          local.get 8
    (;423:0;)          i32.store
    (;424:1;)          local.get 3
    (;425:2;)          i32.const 0
    (;426:0;)          i32.store offset=460
    (;427:1;)          local.get 3
    (;428:2;)          i32.const 34
    (;429:0;)          i32.store8 offset=460
    (;430:1;)          local.get 3
    (;431:2;)          i32.const 408
    (;432:1;)          i32.add
    (;433:2;)          local.get 8
    (;434:3;)          local.get 3
    (;435:4;)          i32.const 460
    (;436:3;)          i32.add
    (;437:4;)          local.get 10
    (;438:5;)          local.get 2
    (;439:6;)          i32.const 1
    (;440:7;)          i32.const 1
    (;441:0;)          call 13  runtime.sliceAppend
    (;442:1;)          local.get 3
    (;443:2;)          i32.const 564
    (;444:1;)          i32.add
    (;445:2;)          local.get 3
    (;446:2;)          i32.load offset=408
    (;447:2;)          local.tee 11
    (;448:0;)          i32.store
    (;449:1;)          local.get 3
    (;450:2;)          i32.const 708
    (;451:1;)          i32.add
    (;452:2;)          local.get 3
    (;453:3;)          i32.const 464
    (;454:2;)          i32.add
    (;455:0;)          i32.store
    (;456:1;)          local.get 3
    (;457:2;)          i32.const 692
    (;458:1;)          i32.add
    (;459:2;)          local.get 3
    (;460:3;)          i32.const 468
    (;461:2;)          i32.add
    (;462:0;)          i32.store
    (;463:1;)          local.get 3
    (;464:2;)          i32.const 676
    (;465:1;)          i32.add
    (;466:2;)          local.get 3
    (;467:3;)          i32.const 472
    (;468:2;)          i32.add
    (;469:0;)          i32.store
    (;470:1;)          local.get 3
    (;471:2;)          i32.const 668
    (;472:1;)          i32.add
    (;473:2;)          local.get 3
    (;474:3;)          i32.const 476
    (;475:2;)          i32.add
    (;476:0;)          i32.store
    (;477:1;)          local.get 3
    (;478:2;)          i32.const 496
    (;479:1;)          i32.add
    (;480:2;)          i32.const 128
    (;481:1;)          i32.add
    (;482:2;)          local.get 3
    (;483:3;)          i32.const 480
    (;484:2;)          i32.add
    (;485:0;)          i32.store
    (;486:1;)          local.get 3
    (;487:2;)          i32.const 616
    (;488:1;)          i32.add
    (;489:2;)          local.get 3
    (;490:3;)          i32.const 484
    (;491:2;)          i32.add
    (;492:0;)          i32.store
    (;493:1;)          local.get 3
    (;494:2;)          i32.const 612
    (;495:1;)          i32.add
    (;496:2;)          local.get 3
    (;497:3;)          i32.const 488
    (;498:2;)          i32.add
    (;499:0;)          i32.store
    (;500:1;)          local.get 3
    (;501:2;)          i32.const 576
    (;502:1;)          i32.add
    (;503:2;)          local.get 3
    (;504:3;)          i32.const 488
    (;505:2;)          i32.add
    (;506:0;)          i32.store
    (;507:1;)          local.get 3
    (;508:1;)          i32.load offset=416
    (;509:0;)          local.set 12
    (;510:1;)          local.get 3
    (;511:1;)          i32.load offset=412
    (;512:0;)          local.set 13
    (;513:1;)          local.get 3
    (;514:2;)          i32.const 572
    (;515:1;)          i32.add
    (;516:0;)          local.set 14
    (;517:1;)          local.get 3
    (;518:2;)          i32.const 568
    (;519:1;)          i32.add
    (;520:0;)          local.set 15
    (;521:1;)          local.get 3
    (;522:2;)          i32.const 580
    (;523:1;)          i32.add
    (;524:0;)          local.set 16
    (;525:1;)          local.get 3
    (;526:2;)          i32.const 496
    (;527:1;)          i32.add
    (;528:2;)          i32.const 92
    (;529:1;)          i32.add
    (;530:0;)          local.set 17
    (;531:1;)          local.get 3
    (;532:2;)          i32.const 600
    (;533:1;)          i32.add
    (;534:0;)          local.set 18
    (;535:1;)          local.get 3
    (;536:2;)          i32.const 596
    (;537:1;)          i32.add
    (;538:0;)          local.set 19
    (;539:1;)          local.get 3
    (;540:2;)          i32.const 620
    (;541:1;)          i32.add
    (;542:0;)          local.set 20
    (;543:1;)          local.get 3
    (;544:2;)          i32.const 496
    (;545:1;)          i32.add
    (;546:2;)          i32.const 132
    (;547:1;)          i32.add
    (;548:0;)          local.set 21
    (;549:1;)          local.get 3
    (;550:2;)          i32.const 604
    (;551:1;)          i32.add
    (;552:0;)          local.set 22
    (;553:1;)          local.get 3
    (;554:2;)          i32.const 608
    (;555:1;)          i32.add
    (;556:0;)          local.set 23
    (;557:1;)          local.get 3
    (;558:2;)          i32.const 716
    (;559:1;)          i32.add
    (;560:0;)          local.set 24
    (;561:1;)          local.get 3
    (;562:2;)          i32.const 684
    (;563:1;)          i32.add
    (;564:0;)          local.set 25
    (;565:1;)          local.get 3
    (;566:2;)          i32.const 496
    (;567:1;)          i32.add
    (;568:2;)          i32.const 192
    (;569:1;)          i32.add
    (;570:0;)          local.set 26
    (;571:1;)          local.get 3
    (;572:2;)          i32.const 696
    (;573:1;)          i32.add
    (;574:0;)          local.set 27
    (;575:1;)          local.get 3
    (;576:2;)          i32.const 636
    (;577:1;)          i32.add
    (;578:0;)          local.set 28
    (;579:1;)          local.get 3
    (;580:2;)          i32.const 664
    (;581:1;)          i32.add
    (;582:0;)          local.set 29
    (;583:1;)          local.get 3
    (;584:2;)          i32.const 672
    (;585:1;)          i32.add
    (;586:0;)          local.set 30
    (;587:1;)          local.get 3
    (;588:2;)          i32.const 680
    (;589:1;)          i32.add
    (;590:0;)          local.set 31
    (;591:1;)          local.get 3
    (;592:2;)          i32.const 700
    (;593:1;)          i32.add
    (;594:0;)          local.set 32
    (;595:1;)          local.get 3
    (;596:2;)          i32.const 704
    (;597:1;)          i32.add
    (;598:0;)          local.set 33
    (;599:1;)          local.get 3
    (;600:2;)          i32.const 712
    (;601:1;)          i32.add
    (;602:0;)          local.set 34
    (;603:1;)          local.get 3
    (;604:2;)          i32.const 632
    (;605:1;)          i32.add
    (;606:0;)          local.set 35
    (;607:1;)          local.get 3
    (;608:2;)          i32.const 640
    (;609:1;)          i32.add
    (;610:0;)          local.set 36
    (;611:1;)          local.get 3
    (;612:2;)          i32.const 656
    (;613:1;)          i32.add
    (;614:0;)          local.set 37
    (;615:1;)          local.get 3
    (;616:2;)          i32.const 648
    (;617:1;)          i32.add
    (;618:0;)          local.set 38
    (;619:1;)          local.get 3
    (;620:2;)          i32.const 660
    (;621:1;)          i32.add
    (;622:0;)          local.set 39
    (;623:1;)          local.get 3
    (;624:2;)          i32.const 644
    (;625:1;)          i32.add
    (;626:0;)          local.set 40
    (;627:1;)          local.get 3
    (;628:2;)          i32.const 652
    (;629:1;)          i32.add
    (;630:0;)          local.set 41
    (;631:0;)          loop
    (;632:1;)            local.get 14
    (;633:2;)            local.get 11
    (;634:0;)            i32.store
    (;635:1;)            local.get 15
    (;636:2;)            local.get 6
    (;637:0;)            i32.store
    (;638:0;)            block
    (;639:1;)              local.get 7
    (;640:2;)              i32.const 0
    (;641:1;)              i32.gt_s
    (;642:0;)              br_if 0
    (;643:1;)              local.get 3
    (;644:2;)              i32.const 0
    (;645:0;)              i32.store offset=448
    (;646:1;)              local.get 3
    (;647:2;)              i32.const 34
    (;648:0;)              i32.store8 offset=448
    (;649:1;)              local.get 3
    (;650:2;)              i32.const 392
    (;651:1;)              i32.add
    (;652:2;)              local.get 11
    (;653:3;)              local.get 3
    (;654:4;)              i32.const 448
    (;655:3;)              i32.add
    (;656:4;)              local.get 13
    (;657:5;)              local.get 12
    (;658:6;)              i32.const 1
    (;659:7;)              i32.const 1
    (;660:0;)              call 13  runtime.sliceAppend
    (;661:1;)              local.get 3
    (;662:2;)              i32.const 732
    (;663:1;)              i32.add
    (;664:2;)              local.get 3
    (;665:2;)              i32.load offset=392
    (;666:2;)              local.tee 2
    (;667:0;)              i32.store
    (;668:1;)              local.get 3
    (;669:2;)              i32.const 728
    (;670:1;)              i32.add
    (;671:2;)              local.get 2
    (;672:0;)              i32.store
    (;673:1;)              local.get 3
    (;674:2;)              i32.const 384
    (;675:1;)              i32.add
    (;676:2;)              local.get 2
    (;677:3;)              local.get 3
    (;678:3;)              i32.load offset=396
    (;679:4;)              local.get 3
    (;680:4;)              i32.load offset=400
    (;681:0;)              call 14  runtime.stringFromBytes
    (;682:1;)              local.get 3
    (;683:2;)              i32.const 744
    (;684:1;)              i32.add
    (;685:2;)              local.get 3
    (;686:2;)              i32.load offset=384
    (;687:2;)              local.tee 2
    (;688:0;)              i32.store
    (;689:1;)              local.get 3
    (;690:2;)              i32.const 740
    (;691:1;)              i32.add
    (;692:2;)              local.get 2
    (;693:0;)              i32.store
    (;694:1;)              local.get 3
    (;695:2;)              i32.const 736
    (;696:1;)              i32.add
    (;697:2;)              local.get 2
    (;698:0;)              i32.store
    (;699:1;)              local.get 3
    (;700:2;)              i32.const 376
    (;701:1;)              i32.add
    (;702:2;)              local.get 5
    (;703:3;)              local.get 9
    (;704:4;)              local.get 2
    (;705:5;)              local.get 3
    (;706:5;)              i32.load offset=388
    (;707:0;)              call 91  runtime.stringConcat
    (;708:1;)              local.get 3
    (;709:2;)              i32.const 748
    (;710:1;)              i32.add
    (;711:2;)              local.get 3
    (;712:2;)              i32.load offset=376
    (;713:2;)              local.tee 2
    (;714:0;)              i32.store
    (;715:1;)              local.get 3
    (;716:2;)              i32.const 368
    (;717:1;)              i32.add
    (;718:2;)              local.get 2
    (;719:3;)              local.get 3
    (;720:3;)              i32.load offset=380
    (;721:4;)              i32.const 67455
    (;722:5;)              i32.const 2
    (;723:0;)              call 91  runtime.stringConcat
    (;724:1;)              local.get 3
    (;725:2;)              i32.const 752
    (;726:1;)              i32.add
    (;727:2;)              local.get 3
    (;728:2;)              i32.load offset=368
    (;729:2;)              local.tee 2
    (;730:0;)              i32.store
    (;731:1;)              local.get 3
    (;732:2;)              i32.const 756
    (;733:1;)              i32.add
    (;734:2;)              local.get 1
    (;735:2;)              i32.load offset=20
    (;736:2;)              local.tee 8
    (;737:0;)              i32.store
    (;738:1;)              local.get 3
    (;739:1;)              i32.load offset=372
    (;740:0;)              local.set 10
    (;741:1;)              local.get 3
    (;742:2;)              i32.const 360
    (;743:1;)              i32.add
    (;744:2;)              local.get 8
    (;745:3;)              local.get 1
    (;746:3;)              i32.load offset=16
    (;747:0;)              call 115  (error).Error
    (;748:1;)              local.get 3
    (;749:2;)              i32.const 760
    (;750:1;)              i32.add
    (;751:2;)              local.get 3
    (;752:2;)              i32.load offset=360
    (;753:2;)              local.tee 8
    (;754:0;)              i32.store
    (;755:1;)              local.get 3
    (;756:2;)              i32.const 352
    (;757:1;)              i32.add
    (;758:2;)              local.get 2
    (;759:3;)              local.get 10
    (;760:4;)              local.get 8
    (;761:5;)              local.get 3
    (;762:5;)              i32.load offset=364
    (;763:0;)              call 91  runtime.stringConcat
    (;764:1;)              i32.const 0
    (;765:2;)              local.get 4
    (;766:0;)              i32.store offset=70816
    (;767:1;)              local.get 3
    (;768:2;)              i32.const 764
    (;769:1;)              i32.add
    (;770:2;)              local.get 3
    (;771:2;)              i32.load offset=352
    (;772:2;)              local.tee 2
    (;773:0;)              i32.store
    (;774:1;)              local.get 0
    (;775:2;)              local.get 3
    (;776:2;)              i32.load offset=356
    (;777:0;)              i32.store offset=4
    (;778:1;)              local.get 0
    (;779:2;)              local.get 2
    (;780:0;)              i32.store
    (;781:1;)              local.get 3
    (;782:2;)              i32.const 768
    (;783:1;)              i32.add
    (;784:0;)              global.set 0
    (;785:0;)              return
    (;786:0;)            end
    (;787:0;)            block
    (;788:0;)              block
    (;789:0;)                block
    (;790:1;)                  local.get 6
    (;791:1;)                  i32.load8_u
    (;792:1;)                  local.tee 42
    (;793:2;)                  i32.const 24
    (;794:1;)                  i32.shl
    (;795:2;)                  i32.const 24
    (;796:1;)                  i32.shr_s
    (;797:1;)                  local.tee 2
    (;798:2;)                  i32.const 0
    (;799:1;)                  i32.lt_s
    (;800:0;)                  br_if 0
    (;801:1;)                  i32.const 1
    (;802:0;)                  local.set 43
    (;803:0;)                  br 1
    (;804:0;)                end
    (;805:1;)                local.get 42
    (;806:2;)                i32.const 65648
    (;807:1;)                i32.add
    (;808:1;)                i32.load8_u
    (;809:0;)                local.set 8
    (;810:0;)                block
    (;811:0;)                  block
    (;812:1;)                    local.get 42
    (;813:2;)                    i32.const -194
    (;814:1;)                    i32.add
    (;815:2;)                    i32.const 50
    (;816:1;)                    i32.le_u
    (;817:0;)                    br_if 0
    (;818:1;)                    i32.const 1
    (;819:0;)                    local.set 43
    (;820:1;)                    i32.const 65533
    (;821:2;)                    local.get 42
    (;822:3;)                    local.get 8
    (;823:4;)                    i32.const 1
    (;824:3;)                    i32.and
    (;825:1;)                    select
    (;826:0;)                    local.set 42
    (;827:0;)                    br 1
    (;828:0;)                  end
    (;829:1;)                  local.get 3
    (;830:2;)                  local.get 8
    (;831:3;)                  i32.const 3
    (;832:2;)                  i32.shr_u
    (;833:3;)                  i32.const 30
    (;834:2;)                  i32.and
    (;835:2;)                  local.tee 10
    (;836:3;)                  i32.const 65905
    (;837:2;)                  i32.add
    (;838:2;)                  i32.load8_u
    (;839:2;)                  local.tee 43
    (;840:0;)                  i32.store8 offset=489
    (;841:1;)                  local.get 3
    (;842:2;)                  local.get 10
    (;843:3;)                  i32.const 65904
    (;844:2;)                  i32.add
    (;845:2;)                  i32.load8_u
    (;846:2;)                  local.tee 10
    (;847:0;)                  i32.store8 offset=488
    (;848:0;)                  block
    (;849:1;)                    local.get 7
    (;850:2;)                    local.get 8
    (;851:3;)                    i32.const 7
    (;852:2;)                    i32.and
    (;853:1;)                    i32.lt_s
    (;854:0;)                    br_if 0
    (;855:1;)                    local.get 7
    (;856:2;)                    i32.const 2
    (;857:1;)                    i32.lt_u
    (;858:0;)                    br_if 7
    (;859:1;)                    local.get 6
    (;860:1;)                    i32.load8_u offset=1
    (;861:1;)                    local.tee 8
    (;862:2;)                    local.get 10
    (;863:3;)                    i32.const 255
    (;864:2;)                    i32.and
    (;865:1;)                    i32.lt_u
    (;866:0;)                    br_if 0
    (;867:1;)                    local.get 43
    (;868:2;)                    i32.const 255
    (;869:1;)                    i32.and
    (;870:2;)                    local.get 8
    (;871:1;)                    i32.lt_u
    (;872:0;)                    br_if 0
    (;873:0;)                    block
    (;874:1;)                      local.get 42
    (;875:2;)                      i32.const -224
    (;876:1;)                      i32.add
    (;877:2;)                      i32.const 21
    (;878:1;)                      i32.lt_u
    (;879:0;)                      br_if 0
    (;880:1;)                      local.get 2
    (;881:2;)                      i32.const 31
    (;882:1;)                      i32.and
    (;883:2;)                      i32.const 6
    (;884:1;)                      i32.shl
    (;885:2;)                      local.get 8
    (;886:3;)                      i32.const 63
    (;887:2;)                      i32.and
    (;888:1;)                      i32.or
    (;889:0;)                      local.set 42
    (;890:1;)                      i32.const 2
    (;891:0;)                      local.set 43
    (;892:0;)                      br 2
    (;893:0;)                    end
    (;894:1;)                    local.get 7
    (;895:2;)                    i32.const 3
    (;896:1;)                    i32.lt_u
    (;897:0;)                    br_if 7
    (;898:1;)                    local.get 6
    (;899:1;)                    i32.load8_s offset=2
    (;900:1;)                    local.tee 10
    (;901:2;)                    i32.const -1
    (;902:1;)                    i32.gt_s
    (;903:0;)                    br_if 0
    (;904:1;)                    local.get 10
    (;905:2;)                    i32.const 255
    (;906:1;)                    i32.and
    (;907:2;)                    i32.const 191
    (;908:1;)                    i32.gt_u
    (;909:0;)                    br_if 0
    (;910:0;)                    block
    (;911:1;)                      local.get 42
    (;912:2;)                      i32.const -240
    (;913:1;)                      i32.add
    (;914:2;)                      i32.const 5
    (;915:1;)                      i32.lt_u
    (;916:0;)                      br_if 0
    (;917:1;)                      local.get 8
    (;918:2;)                      i32.const 63
    (;919:1;)                      i32.and
    (;920:2;)                      i32.const 6
    (;921:1;)                      i32.shl
    (;922:2;)                      local.get 2
    (;923:3;)                      i32.const 15
    (;924:2;)                      i32.and
    (;925:3;)                      i32.const 12
    (;926:2;)                      i32.shl
    (;927:1;)                      i32.or
    (;928:2;)                      local.get 10
    (;929:3;)                      i32.const 63
    (;930:2;)                      i32.and
    (;931:1;)                      i32.or
    (;932:0;)                      local.set 42
    (;933:1;)                      i32.const 3
    (;934:0;)                      local.set 43
    (;935:0;)                      br 2
    (;936:0;)                    end
    (;937:1;)                    local.get 7
    (;938:2;)                    i32.const 4
    (;939:1;)                    i32.lt_u
    (;940:0;)                    br_if 7
    (;941:1;)                    local.get 6
    (;942:1;)                    i32.load8_s offset=3
    (;943:1;)                    local.tee 42
    (;944:2;)                    i32.const -1
    (;945:1;)                    i32.gt_s
    (;946:0;)                    br_if 0
    (;947:1;)                    local.get 42
    (;948:2;)                    i32.const 255
    (;949:1;)                    i32.and
    (;950:2;)                    i32.const 191
    (;951:1;)                    i32.gt_u
    (;952:0;)                    br_if 0
    (;953:1;)                    local.get 8
    (;954:2;)                    i32.const 63
    (;955:1;)                    i32.and
    (;956:2;)                    i32.const 12
    (;957:1;)                    i32.shl
    (;958:2;)                    local.get 2
    (;959:3;)                    i32.const 7
    (;960:2;)                    i32.and
    (;961:3;)                    i32.const 18
    (;962:2;)                    i32.shl
    (;963:1;)                    i32.or
    (;964:2;)                    local.get 10
    (;965:3;)                    i32.const 63
    (;966:2;)                    i32.and
    (;967:3;)                    i32.const 6
    (;968:2;)                    i32.shl
    (;969:1;)                    i32.or
    (;970:2;)                    local.get 42
    (;971:3;)                    i32.const 63
    (;972:2;)                    i32.and
    (;973:1;)                    i32.or
    (;974:0;)                    local.set 42
    (;975:1;)                    i32.const 4
    (;976:0;)                    local.set 43
    (;977:0;)                    br 1
    (;978:0;)                  end
    (;979:1;)                  i32.const 1
    (;980:0;)                  local.set 43
    (;981:1;)                  i32.const 65533
    (;982:0;)                  local.set 42
    (;983:0;)                end
    (;984:1;)                local.get 43
    (;985:2;)                i32.const 1
    (;986:1;)                i32.ne
    (;987:0;)                br_if 0
    (;988:1;)                local.get 42
    (;989:2;)                i32.const 65533
    (;990:1;)                i32.ne
    (;991:0;)                br_if 0
    (;992:1;)                i32.const 1
    (;993:0;)                local.set 43
    (;994:1;)                local.get 3
    (;995:2;)                i32.const 64
    (;996:1;)                i32.add
    (;997:2;)                local.get 11
    (;998:3;)                i32.const 66401
    (;999:4;)                local.get 13
    (;1000:5;)                local.get 12
    (;1001:6;)                i32.const 2
    (;1002:7;)                i32.const 1
    (;1003:0;)                call 13  runtime.sliceAppend
    (;1004:1;)                local.get 16
    (;1005:2;)                local.get 3
    (;1006:2;)                i32.load offset=64
    (;1007:2;)                local.tee 2
    (;1008:0;)                i32.store
    (;1009:1;)                local.get 6
    (;1010:1;)                i32.load8_u
    (;1011:0;)                local.set 8
    (;1012:1;)                local.get 3
    (;1013:2;)                i32.const 0
    (;1014:0;)                i32.store offset=456
    (;1015:1;)                local.get 3
    (;1016:2;)                local.get 8
    (;1017:3;)                i32.const 4
    (;1018:2;)                i32.shr_u
    (;1019:3;)                i32.const 66403
    (;1020:2;)                i32.add
    (;1021:2;)                i32.load8_u
    (;1022:0;)                i32.store8 offset=456
    (;1023:1;)                local.get 3
    (;1024:2;)                i32.const 48
    (;1025:1;)                i32.add
    (;1026:2;)                local.get 2
    (;1027:3;)                local.get 3
    (;1028:4;)                i32.const 456
    (;1029:3;)                i32.add
    (;1030:4;)                local.get 3
    (;1031:4;)                i32.load offset=68
    (;1032:5;)                local.get 3
    (;1033:5;)                i32.load offset=72
    (;1034:6;)                i32.const 1
    (;1035:7;)                i32.const 1
    (;1036:0;)                call 13  runtime.sliceAppend
    (;1037:1;)                local.get 17
    (;1038:2;)                local.get 3
    (;1039:2;)                i32.load offset=48
    (;1040:2;)                local.tee 2
    (;1041:0;)                i32.store
    (;1042:1;)                local.get 6
    (;1043:1;)                i32.load8_u
    (;1044:0;)                local.set 8
    (;1045:1;)                local.get 3
    (;1046:2;)                i32.const 0
    (;1047:0;)                i32.store offset=452
    (;1048:1;)                local.get 3
    (;1049:2;)                local.get 8
    (;1050:3;)                i32.const 15
    (;1051:2;)                i32.and
    (;1052:3;)                i32.const 66403
    (;1053:2;)                i32.add
    (;1054:2;)                i32.load8_u
    (;1055:0;)                i32.store8 offset=452
    (;1056:1;)                local.get 3
    (;1057:2;)                i32.const 32
    (;1058:1;)                i32.add
    (;1059:2;)                local.get 2
    (;1060:3;)                local.get 3
    (;1061:4;)                i32.const 452
    (;1062:3;)                i32.add
    (;1063:4;)                local.get 3
    (;1064:4;)                i32.load offset=52
    (;1065:5;)                local.get 3
    (;1066:5;)                i32.load offset=56
    (;1067:6;)                i32.const 1
    (;1068:7;)                i32.const 1
    (;1069:0;)                call 13  runtime.sliceAppend
    (;1070:1;)                local.get 18
    (;1071:2;)                local.get 3
    (;1072:2;)                i32.load offset=32
    (;1073:2;)                local.tee 11
    (;1074:0;)                i32.store
    (;1075:1;)                local.get 19
    (;1076:2;)                local.get 11
    (;1077:0;)                i32.store
    (;1078:1;)                local.get 3
    (;1079:1;)                i32.load offset=40
    (;1080:0;)                local.set 12
    (;1081:1;)                local.get 3
    (;1082:1;)                i32.load offset=36
    (;1083:0;)                local.set 13
    (;1084:0;)                br 1
    (;1085:0;)              end
    (;1086:1;)              local.get 3
    (;1087:2;)              i32.const 0
    (;1088:0;)              i32.store offset=488
    (;1089:0;)              block
    (;1090:0;)                block
    (;1091:0;)                  block
    (;1092:1;)                    local.get 42
    (;1093:2;)                    i32.const 92
    (;1094:1;)                    i32.eq
    (;1095:0;)                    br_if 0
    (;1096:1;)                    local.get 42
    (;1097:2;)                    i32.const 34
    (;1098:1;)                    i32.ne
    (;1099:0;)                    br_if 1
    (;1100:0;)                  end
    (;1101:1;)                  local.get 3
    (;1102:2;)                  i32.const 0
    (;1103:0;)                  i32.store offset=484
    (;1104:1;)                  local.get 3
    (;1105:2;)                  i32.const 92
    (;1106:0;)                  i32.store8 offset=484
    (;1107:1;)                  local.get 3
    (;1108:2;)                  i32.const 336
    (;1109:1;)                  i32.add
    (;1110:2;)                  local.get 11
    (;1111:3;)                  local.get 3
    (;1112:4;)                  i32.const 484
    (;1113:3;)                  i32.add
    (;1114:4;)                  local.get 13
    (;1115:5;)                  local.get 12
    (;1116:6;)                  i32.const 1
    (;1117:7;)                  i32.const 1
    (;1118:0;)                  call 13  runtime.sliceAppend
    (;1119:1;)                  local.get 20
    (;1120:2;)                  local.get 3
    (;1121:2;)                  i32.load offset=336
    (;1122:2;)                  local.tee 2
    (;1123:0;)                  i32.store
    (;1124:1;)                  local.get 3
    (;1125:2;)                  i32.const 0
    (;1126:0;)                  i32.store offset=480
    (;1127:1;)                  local.get 3
    (;1128:2;)                  local.get 42
    (;1129:0;)                  i32.store8 offset=480
    (;1130:1;)                  local.get 3
    (;1131:2;)                  i32.const 320
    (;1132:1;)                  i32.add
    (;1133:2;)                  local.get 2
    (;1134:3;)                  local.get 3
    (;1135:4;)                  i32.const 480
    (;1136:3;)                  i32.add
    (;1137:4;)                  local.get 3
    (;1138:4;)                  i32.load offset=340
    (;1139:5;)                  local.get 3
    (;1140:5;)                  i32.load offset=344
    (;1141:6;)                  i32.const 1
    (;1142:7;)                  i32.const 1
    (;1143:0;)                  call 13  runtime.sliceAppend
    (;1144:1;)                  local.get 21
    (;1145:2;)                  local.get 3
    (;1146:2;)                  i32.load offset=320
    (;1147:2;)                  local.tee 11
    (;1148:0;)                  i32.store
    (;1149:1;)                  local.get 3
    (;1150:1;)                  i32.load offset=328
    (;1151:0;)                  local.set 12
    (;1152:1;)                  local.get 3
    (;1153:1;)                  i32.load offset=324
    (;1154:0;)                  local.set 13
    (;1155:0;)                  br 1
    (;1156:0;)                end
    (;1157:0;)                block
    (;1158:0;)                  block
    (;1159:0;)                    block
    (;1160:0;)                      block
    (;1161:0;)                        block
    (;1162:0;)                          block
    (;1163:0;)                            block
    (;1164:0;)                              block
    (;1165:0;)                                block
    (;1166:0;)                                  block
    (;1167:0;)                                    block
    (;1168:0;)                                      block
    (;1169:0;)                                        block
    (;1170:0;)                                          block
    (;1171:0;)                                            block
    (;1172:0;)                                              block
    (;1173:1;)                                                local.get 42
    (;1174:2;)                                                i32.const 255
    (;1175:1;)                                                i32.gt_s
    (;1176:0;)                                                br_if 0
    (;1177:1;)                                                local.get 42
    (;1178:2;)                                                i32.const -32
    (;1179:1;)                                                i32.add
    (;1180:2;)                                                i32.const 95
    (;1181:1;)                                                i32.lt_u
    (;1182:0;)                                                br_if 1
    (;1183:1;)                                                local.get 42
    (;1184:2;)                                                i32.const 161
    (;1185:1;)                                                i32.lt_s
    (;1186:0;)                                                br_if 3
    (;1187:1;)                                                i32.const 173
    (;1188:0;)                                                local.set 8
    (;1189:1;)                                                local.get 42
    (;1190:2;)                                                i32.const 173
    (;1191:1;)                                                i32.eq
    (;1192:0;)                                                br_if 7
    (;1193:0;)                                                br 4
    (;1194:0;)                                              end
    (;1195:0;)                                              block
    (;1196:0;)                                                block
    (;1197:0;)                                                  block
    (;1198:1;)                                                    local.get 42
    (;1199:2;)                                                    i32.const 65535
    (;1200:1;)                                                    i32.gt_s
    (;1201:0;)                                                    br_if 0
    (;1202:1;)                                                    i32.const 67584
    (;1203:2;)                                                    i32.const 442
    (;1204:3;)                                                    local.get 42
    (;1205:1;)                                                    call 83  strconv.bsearch16
    (;1206:1;)                                                    local.tee 2
    (;1207:2;)                                                    i32.const 441
    (;1208:1;)                                                    i32.gt_s
    (;1209:0;)                                                    br_if 5
    (;1210:1;)                                                    local.get 2
    (;1211:2;)                                                    i32.const -2
    (;1212:1;)                                                    i32.and
    (;1213:1;)                                                    local.tee 8
    (;1214:2;)                                                    i32.const 441
    (;1215:1;)                                                    i32.gt_u
    (;1216:0;)                                                    br_if 23
    (;1217:1;)                                                    local.get 8
    (;1218:2;)                                                    i32.const 1
    (;1219:1;)                                                    i32.shl
    (;1220:2;)                                                    i32.const 67584
    (;1221:1;)                                                    i32.add
    (;1222:1;)                                                    i32.load16_u
    (;1223:2;)                                                    local.get 42
    (;1224:3;)                                                    i32.const 65535
    (;1225:2;)                                                    i32.and
    (;1226:2;)                                                    local.tee 8
    (;1227:1;)                                                    i32.gt_u
    (;1228:0;)                                                    br_if 5
    (;1229:1;)                                                    local.get 2
    (;1230:2;)                                                    i32.const 1
    (;1231:1;)                                                    i32.or
    (;1232:1;)                                                    local.tee 2
    (;1233:2;)                                                    i32.const 441
    (;1234:1;)                                                    i32.gt_u
    (;1235:0;)                                                    br_if 23
    (;1236:1;)                                                    local.get 2
    (;1237:2;)                                                    i32.const 1
    (;1238:1;)                                                    i32.shl
    (;1239:2;)                                                    i32.const 67584
    (;1240:1;)                                                    i32.add
    (;1241:1;)                                                    i32.load16_u
    (;1242:2;)                                                    local.get 8
    (;1243:1;)                                                    i32.lt_u
    (;1244:0;)                                                    br_if 5
    (;1245:1;)                                                    i32.const 68480
    (;1246:2;)                                                    i32.const 132
    (;1247:3;)                                                    local.get 42
    (;1248:1;)                                                    call 83  strconv.bsearch16
    (;1249:1;)                                                    local.tee 2
    (;1250:2;)                                                    i32.const 131
    (;1251:1;)                                                    i32.gt_s
    (;1252:0;)                                                    br_if 1
    (;1253:1;)                                                    local.get 2
    (;1254:2;)                                                    i32.const 131
    (;1255:1;)                                                    i32.gt_u
    (;1256:0;)                                                    br_if 23
    (;1257:1;)                                                    local.get 2
    (;1258:2;)                                                    i32.const 1
    (;1259:1;)                                                    i32.shl
    (;1260:2;)                                                    i32.const 68480
    (;1261:1;)                                                    i32.add
    (;1262:1;)                                                    i32.load16_u
    (;1263:2;)                                                    local.get 8
    (;1264:1;)                                                    i32.ne
    (;1265:0;)                                                    br_if 1
    (;1266:0;)                                                    br 5
    (;1267:0;)                                                  end
    (;1268:1;)                                                  i32.const 450
    (;1269:0;)                                                  local.set 8
    (;1270:1;)                                                  i32.const 0
    (;1271:0;)                                                  local.set 2
    (;1272:0;)                                                  block
    (;1273:0;)                                                    loop
    (;1274:1;)                                                      local.get 8
    (;1275:2;)                                                      local.get 2
    (;1276:1;)                                                      i32.le_s
    (;1277:0;)                                                      br_if 1
    (;1278:1;)                                                      local.get 8
    (;1279:2;)                                                      local.get 2
    (;1280:1;)                                                      i32.sub
    (;1281:2;)                                                      i32.const 2
    (;1282:1;)                                                      i32.div_s
    (;1283:2;)                                                      local.get 2
    (;1284:1;)                                                      i32.add
    (;1285:1;)                                                      local.tee 10
    (;1286:2;)                                                      i32.const 450
    (;1287:1;)                                                      i32.ge_u
    (;1288:0;)                                                      br_if 24
    (;1289:1;)                                                      local.get 10
    (;1290:2;)                                                      i32.const 1
    (;1291:1;)                                                      i32.add
    (;1292:2;)                                                      local.get 2
    (;1293:3;)                                                      local.get 10
    (;1294:4;)                                                      i32.const 2
    (;1295:3;)                                                      i32.shl
    (;1296:4;)                                                      i32.const 68752
    (;1297:3;)                                                      i32.add
    (;1298:3;)                                                      i32.load
    (;1299:4;)                                                      local.get 42
    (;1300:3;)                                                      i32.lt_u
    (;1301:3;)                                                      local.tee 44
    (;1302:1;)                                                      select
    (;1303:0;)                                                      local.set 2
    (;1304:1;)                                                      local.get 8
    (;1305:2;)                                                      local.get 10
    (;1306:3;)                                                      local.get 44
    (;1307:1;)                                                      select
    (;1308:0;)                                                      local.set 8
    (;1309:0;)                                                      br 0
    (;1310:0;)                                                    end
    (;1311:0;)                                                  end
    (;1312:1;)                                                  local.get 2
    (;1313:2;)                                                  i32.const 449
    (;1314:1;)                                                  i32.gt_s
    (;1315:0;)                                                  br_if 4
    (;1316:1;)                                                  local.get 2
    (;1317:2;)                                                  i32.const -2
    (;1318:1;)                                                  i32.and
    (;1319:1;)                                                  local.tee 8
    (;1320:2;)                                                  i32.const 449
    (;1321:1;)                                                  i32.gt_u
    (;1322:0;)                                                  br_if 22
    (;1323:1;)                                                  local.get 8
    (;1324:2;)                                                  i32.const 2
    (;1325:1;)                                                  i32.shl
    (;1326:2;)                                                  i32.const 68752
    (;1327:1;)                                                  i32.add
    (;1328:1;)                                                  i32.load
    (;1329:2;)                                                  local.get 42
    (;1330:1;)                                                  i32.gt_u
    (;1331:0;)                                                  br_if 4
    (;1332:1;)                                                  local.get 2
    (;1333:2;)                                                  i32.const 1
    (;1334:1;)                                                  i32.or
    (;1335:1;)                                                  local.tee 2
    (;1336:2;)                                                  i32.const 449
    (;1337:1;)                                                  i32.gt_u
    (;1338:0;)                                                  br_if 22
    (;1339:1;)                                                  local.get 2
    (;1340:2;)                                                  i32.const 2
    (;1341:1;)                                                  i32.shl
    (;1342:2;)                                                  i32.const 68752
    (;1343:1;)                                                  i32.add
    (;1344:1;)                                                  i32.load
    (;1345:2;)                                                  local.get 42
    (;1346:1;)                                                  i32.lt_u
    (;1347:0;)                                                  br_if 4
    (;1348:1;)                                                  local.get 42
    (;1349:2;)                                                  i32.const 131071
    (;1350:1;)                                                  i32.gt_s
    (;1351:0;)                                                  br_if 1
    (;1352:0;)                                                  block
    (;1353:1;)                                                    i32.const 70560
    (;1354:2;)                                                    i32.const 90
    (;1355:3;)                                                    local.get 42
    (;1356:1;)                                                    call 83  strconv.bsearch16
    (;1357:1;)                                                    local.tee 2
    (;1358:2;)                                                    i32.const 89
    (;1359:1;)                                                    i32.gt_s
    (;1360:0;)                                                    br_if 0
    (;1361:1;)                                                    local.get 2
    (;1362:2;)                                                    i32.const 89
    (;1363:1;)                                                    i32.gt_u
    (;1364:0;)                                                    br_if 23
    (;1365:1;)                                                    local.get 2
    (;1366:2;)                                                    i32.const 1
    (;1367:1;)                                                    i32.shl
    (;1368:2;)                                                    i32.const 70560
    (;1369:1;)                                                    i32.add
    (;1370:1;)                                                    i32.load16_u
    (;1371:2;)                                                    local.get 42
    (;1372:3;)                                                    i32.const 65535
    (;1373:2;)                                                    i32.and
    (;1374:1;)                                                    i32.eq
    (;1375:0;)                                                    br_if 5
    (;1376:0;)                                                  end
    (;1377:1;)                                                  local.get 42
    (;1378:2;)                                                  i32.const 128
    (;1379:1;)                                                  i32.lt_u
    (;1380:0;)                                                  br_if 2
    (;1381:0;)                                                end
    (;1382:1;)                                                local.get 42
    (;1383:2;)                                                i32.const 2048
    (;1384:1;)                                                i32.lt_u
    (;1385:0;)                                                br_if 4
    (;1386:0;)                                              end
    (;1387:1;)                                              i32.const 65533
    (;1388:0;)                                              local.set 2
    (;1389:0;)                                              block
    (;1390:1;)                                                local.get 42
    (;1391:2;)                                                i32.const 1114111
    (;1392:1;)                                                i32.gt_u
    (;1393:0;)                                                br_if 0
    (;1394:1;)                                                local.get 42
    (;1395:2;)                                                i32.const -2048
    (;1396:1;)                                                i32.and
    (;1397:2;)                                                i32.const 55296
    (;1398:1;)                                                i32.eq
    (;1399:0;)                                                br_if 0
    (;1400:1;)                                                local.get 42
    (;1401:2;)                                                i32.const 65536
    (;1402:1;)                                                i32.ge_u
    (;1403:0;)                                                br_if 2
    (;1404:1;)                                                local.get 42
    (;1405:0;)                                                local.set 2
    (;1406:0;)                                              end
    (;1407:1;)                                              local.get 3
    (;1408:2;)                                              local.get 2
    (;1409:3;)                                              i32.const 63
    (;1410:2;)                                              i32.and
    (;1411:3;)                                              i32.const 128
    (;1412:2;)                                              i32.or
    (;1413:0;)                                              i32.store8 offset=490
    (;1414:1;)                                              local.get 3
    (;1415:2;)                                              local.get 2
    (;1416:3;)                                              i32.const 12
    (;1417:2;)                                              i32.shr_u
    (;1418:3;)                                              i32.const 224
    (;1419:2;)                                              i32.or
    (;1420:0;)                                              i32.store8 offset=488
    (;1421:1;)                                              local.get 3
    (;1422:2;)                                              local.get 2
    (;1423:3;)                                              i32.const 6
    (;1424:2;)                                              i32.shr_u
    (;1425:3;)                                              i32.const 63
    (;1426:2;)                                              i32.and
    (;1427:3;)                                              i32.const 128
    (;1428:2;)                                              i32.or
    (;1429:0;)                                              i32.store8 offset=489
    (;1430:1;)                                              i32.const 3
    (;1431:0;)                                              local.set 2
    (;1432:0;)                                              br 4
    (;1433:0;)                                            end
    (;1434:1;)                                            local.get 3
    (;1435:2;)                                            local.get 42
    (;1436:0;)                                            i32.store8 offset=488
    (;1437:1;)                                            i32.const 1
    (;1438:0;)                                            local.set 2
    (;1439:0;)                                            br 3
    (;1440:0;)                                          end
    (;1441:1;)                                          local.get 3
    (;1442:2;)                                          local.get 42
    (;1443:3;)                                          i32.const 63
    (;1444:2;)                                          i32.and
    (;1445:3;)                                          i32.const 128
    (;1446:2;)                                          i32.or
    (;1447:0;)                                          i32.store8 offset=491
    (;1448:1;)                                          local.get 3
    (;1449:2;)                                          local.get 42
    (;1450:3;)                                          i32.const 18
    (;1451:2;)                                          i32.shr_u
    (;1452:3;)                                          i32.const 240
    (;1453:2;)                                          i32.or
    (;1454:0;)                                          i32.store8 offset=488
    (;1455:1;)                                          local.get 3
    (;1456:2;)                                          local.get 42
    (;1457:3;)                                          i32.const 6
    (;1458:2;)                                          i32.shr_u
    (;1459:3;)                                          i32.const 63
    (;1460:2;)                                          i32.and
    (;1461:3;)                                          i32.const 128
    (;1462:2;)                                          i32.or
    (;1463:0;)                                          i32.store8 offset=490
    (;1464:1;)                                          local.get 3
    (;1465:2;)                                          local.get 42
    (;1466:3;)                                          i32.const 12
    (;1467:2;)                                          i32.shr_u
    (;1468:3;)                                          i32.const 63
    (;1469:2;)                                          i32.and
    (;1470:3;)                                          i32.const 128
    (;1471:2;)                                          i32.or
    (;1472:0;)                                          i32.store8 offset=489
    (;1473:1;)                                          i32.const 4
    (;1474:0;)                                          local.set 2
    (;1475:0;)                                          br 2
    (;1476:0;)                                        end
    (;1477:1;)                                        local.get 42
    (;1478:2;)                                        i32.const -7
    (;1479:1;)                                        i32.add
    (;1480:1;)                                        local.tee 2
    (;1481:2;)                                        i32.const 6
    (;1482:1;)                                        i32.gt_u
    (;1483:0;)                                        br_if 2
    (;1484:1;)                                        local.get 2
    (;1485:0;)                                        br_table 10 9 5 7 4 8 6 10
    (;1486:0;)                                      end
    (;1487:1;)                                      local.get 3
    (;1488:2;)                                      local.get 42
    (;1489:3;)                                      i32.const 63
    (;1490:2;)                                      i32.and
    (;1491:3;)                                      i32.const 128
    (;1492:2;)                                      i32.or
    (;1493:0;)                                      i32.store8 offset=489
    (;1494:1;)                                      local.get 3
    (;1495:2;)                                      local.get 42
    (;1496:3;)                                      i32.const 6
    (;1497:2;)                                      i32.shr_u
    (;1498:3;)                                      i32.const 192
    (;1499:2;)                                      i32.or
    (;1500:0;)                                      i32.store8 offset=488
    (;1501:1;)                                      i32.const 2
    (;1502:0;)                                      local.set 2
    (;1503:0;)                                    end
    (;1504:1;)                                    local.get 3
    (;1505:2;)                                    i32.const 80
    (;1506:1;)                                    i32.add
    (;1507:2;)                                    local.get 11
    (;1508:3;)                                    local.get 3
    (;1509:4;)                                    i32.const 488
    (;1510:3;)                                    i32.add
    (;1511:4;)                                    local.get 13
    (;1512:5;)                                    local.get 12
    (;1513:6;)                                    local.get 2
    (;1514:7;)                                    i32.const 1
    (;1515:0;)                                    call 13  runtime.sliceAppend
    (;1516:1;)                                    local.get 24
    (;1517:2;)                                    local.get 3
    (;1518:2;)                                    i32.load offset=80
    (;1519:2;)                                    local.tee 11
    (;1520:0;)                                    i32.store
    (;1521:1;)                                    local.get 3
    (;1522:1;)                                    i32.load offset=88
    (;1523:0;)                                    local.set 12
    (;1524:1;)                                    local.get 3
    (;1525:1;)                                    i32.load offset=84
    (;1526:0;)                                    local.set 13
    (;1527:0;)                                    br 10
    (;1528:0;)                                  end
    (;1529:0;)                                  block
    (;1530:1;)                                    local.get 42
    (;1531:2;)                                    i32.const 31
    (;1532:1;)                                    i32.gt_s
    (;1533:0;)                                    br_if 0
    (;1534:1;)                                    local.get 3
    (;1535:2;)                                    i32.const 160
    (;1536:1;)                                    i32.add
    (;1537:2;)                                    local.get 11
    (;1538:3;)                                    i32.const 66401
    (;1539:4;)                                    local.get 13
    (;1540:5;)                                    local.get 12
    (;1541:6;)                                    i32.const 2
    (;1542:7;)                                    i32.const 1
    (;1543:0;)                                    call 13  runtime.sliceAppend
    (;1544:1;)                                    local.get 29
    (;1545:2;)                                    local.get 3
    (;1546:2;)                                    i32.load offset=160
    (;1547:2;)                                    local.tee 2
    (;1548:0;)                                    i32.store
    (;1549:1;)                                    local.get 3
    (;1550:2;)                                    i32.const 0
    (;1551:0;)                                    i32.store offset=476
    (;1552:1;)                                    local.get 3
    (;1553:2;)                                    local.get 42
    (;1554:3;)                                    i32.const 4
    (;1555:2;)                                    i32.shr_u
    (;1556:3;)                                    i32.const 15
    (;1557:2;)                                    i32.and
    (;1558:3;)                                    i32.const 66403
    (;1559:2;)                                    i32.add
    (;1560:2;)                                    i32.load8_u
    (;1561:0;)                                    i32.store8 offset=476
    (;1562:1;)                                    local.get 3
    (;1563:2;)                                    i32.const 144
    (;1564:1;)                                    i32.add
    (;1565:2;)                                    local.get 2
    (;1566:3;)                                    local.get 3
    (;1567:4;)                                    i32.const 476
    (;1568:3;)                                    i32.add
    (;1569:4;)                                    local.get 3
    (;1570:4;)                                    i32.load offset=164
    (;1571:5;)                                    local.get 3
    (;1572:5;)                                    i32.load offset=168
    (;1573:6;)                                    i32.const 1
    (;1574:7;)                                    i32.const 1
    (;1575:0;)                                    call 13  runtime.sliceAppend
    (;1576:1;)                                    local.get 30
    (;1577:2;)                                    local.get 3
    (;1578:2;)                                    i32.load offset=144
    (;1579:2;)                                    local.tee 2
    (;1580:0;)                                    i32.store
    (;1581:1;)                                    local.get 3
    (;1582:2;)                                    i32.const 0
    (;1583:0;)                                    i32.store offset=472
    (;1584:1;)                                    local.get 3
    (;1585:2;)                                    local.get 42
    (;1586:3;)                                    i32.const 15
    (;1587:2;)                                    i32.and
    (;1588:3;)                                    i32.const 66403
    (;1589:2;)                                    i32.add
    (;1590:2;)                                    i32.load8_u
    (;1591:0;)                                    i32.store8 offset=472
    (;1592:1;)                                    local.get 3
    (;1593:2;)                                    i32.const 128
    (;1594:1;)                                    i32.add
    (;1595:2;)                                    local.get 2
    (;1596:3;)                                    local.get 3
    (;1597:4;)                                    i32.const 472
    (;1598:3;)                                    i32.add
    (;1599:4;)                                    local.get 3
    (;1600:4;)                                    i32.load offset=148
    (;1601:5;)                                    local.get 3
    (;1602:5;)                                    i32.load offset=152
    (;1603:6;)                                    i32.const 1
    (;1604:7;)                                    i32.const 1
    (;1605:0;)                                    call 13  runtime.sliceAppend
    (;1606:1;)                                    local.get 31
    (;1607:2;)                                    local.get 3
    (;1608:2;)                                    i32.load offset=128
    (;1609:2;)                                    local.tee 11
    (;1610:0;)                                    i32.store
    (;1611:1;)                                    local.get 3
    (;1612:1;)                                    i32.load offset=136
    (;1613:0;)                                    local.set 12
    (;1614:1;)                                    local.get 3
    (;1615:1;)                                    i32.load offset=132
    (;1616:0;)                                    local.set 13
    (;1617:0;)                                    br 9
    (;1618:0;)                                  end
    (;1619:1;)                                  i32.const 65533
    (;1620:0;)                                  local.set 8
    (;1621:1;)                                  local.get 42
    (;1622:2;)                                  i32.const 1114112
    (;1623:1;)                                  i32.ge_s
    (;1624:0;)                                  br_if 0
    (;1625:0;)                                  block
    (;1626:1;)                                    local.get 42
    (;1627:2;)                                    i32.const 65536
    (;1628:1;)                                    i32.ge_s
    (;1629:0;)                                    br_if 0
    (;1630:1;)                                    local.get 42
    (;1631:0;)                                    local.set 8
    (;1632:0;)                                    br 1
    (;1633:0;)                                  end
    (;1634:1;)                                  local.get 3
    (;1635:2;)                                  i32.const 192
    (;1636:1;)                                  i32.add
    (;1637:2;)                                  local.get 11
    (;1638:3;)                                  i32.const 66399
    (;1639:4;)                                  local.get 13
    (;1640:5;)                                  local.get 12
    (;1641:6;)                                  i32.const 2
    (;1642:7;)                                  i32.const 1
    (;1643:0;)                                  call 13  runtime.sliceAppend
    (;1644:1;)                                  local.get 32
    (;1645:2;)                                  local.get 3
    (;1646:2;)                                  i32.load offset=192
    (;1647:2;)                                  local.tee 11
    (;1648:0;)                                  i32.store
    (;1649:1;)                                  i32.const 28
    (;1650:0;)                                  local.set 2
    (;1651:1;)                                  local.get 3
    (;1652:1;)                                  i32.load offset=200
    (;1653:0;)                                  local.set 12
    (;1654:1;)                                  local.get 3
    (;1655:1;)                                  i32.load offset=196
    (;1656:0;)                                  local.set 13
    (;1657:0;)                                  loop
    (;1658:1;)                                    local.get 33
    (;1659:2;)                                    local.get 11
    (;1660:0;)                                    i32.store
    (;1661:1;)                                    local.get 2
    (;1662:2;)                                    i32.const 0
    (;1663:1;)                                    i32.lt_s
    (;1664:0;)                                    br_if 9
    (;1665:1;)                                    local.get 3
    (;1666:2;)                                    i32.const 0
    (;1667:0;)                                    i32.store offset=464
    (;1668:1;)                                    local.get 3
    (;1669:2;)                                    local.get 42
    (;1670:3;)                                    local.get 2
    (;1671:4;)                                    i32.const 31
    (;1672:5;)                                    local.get 2
    (;1673:6;)                                    i32.const 31
    (;1674:5;)                                    i32.lt_u
    (;1675:3;)                                    select
    (;1676:2;)                                    i32.shr_s
    (;1677:3;)                                    i32.const 15
    (;1678:2;)                                    i32.and
    (;1679:3;)                                    i32.const 66403
    (;1680:2;)                                    i32.add
    (;1681:2;)                                    i32.load8_u
    (;1682:0;)                                    i32.store8 offset=464
    (;1683:1;)                                    local.get 3
    (;1684:2;)                                    i32.const 176
    (;1685:1;)                                    i32.add
    (;1686:2;)                                    local.get 11
    (;1687:3;)                                    local.get 3
    (;1688:4;)                                    i32.const 464
    (;1689:3;)                                    i32.add
    (;1690:4;)                                    local.get 13
    (;1691:5;)                                    local.get 12
    (;1692:6;)                                    i32.const 1
    (;1693:7;)                                    i32.const 1
    (;1694:0;)                                    call 13  runtime.sliceAppend
    (;1695:1;)                                    local.get 34
    (;1696:2;)                                    local.get 3
    (;1697:2;)                                    i32.load offset=176
    (;1698:2;)                                    local.tee 11
    (;1699:0;)                                    i32.store
    (;1700:1;)                                    local.get 2
    (;1701:2;)                                    i32.const -4
    (;1702:1;)                                    i32.add
    (;1703:0;)                                    local.set 2
    (;1704:1;)                                    local.get 3
    (;1705:1;)                                    i32.load offset=184
    (;1706:0;)                                    local.set 12
    (;1707:1;)                                    local.get 3
    (;1708:1;)                                    i32.load offset=180
    (;1709:0;)                                    local.set 13
    (;1710:0;)                                    br 0
    (;1711:0;)                                  end
    (;1712:0;)                                end
    (;1713:1;)                                local.get 3
    (;1714:2;)                                i32.const 112
    (;1715:1;)                                i32.add
    (;1716:2;)                                local.get 11
    (;1717:3;)                                i32.const 66397
    (;1718:4;)                                local.get 13
    (;1719:5;)                                local.get 12
    (;1720:6;)                                i32.const 2
    (;1721:7;)                                i32.const 1
    (;1722:0;)                                call 13  runtime.sliceAppend
    (;1723:1;)                                local.get 25
    (;1724:2;)                                local.get 3
    (;1725:2;)                                i32.load offset=112
    (;1726:2;)                                local.tee 11
    (;1727:0;)                                i32.store
    (;1728:1;)                                i32.const 12
    (;1729:0;)                                local.set 2
    (;1730:1;)                                local.get 3
    (;1731:1;)                                i32.load offset=120
    (;1732:0;)                                local.set 12
    (;1733:1;)                                local.get 3
    (;1734:1;)                                i32.load offset=116
    (;1735:0;)                                local.set 13
    (;1736:0;)                                loop
    (;1737:1;)                                  local.get 26
    (;1738:2;)                                  local.get 11
    (;1739:0;)                                  i32.store
    (;1740:1;)                                  local.get 2
    (;1741:2;)                                  i32.const 0
    (;1742:1;)                                  i32.lt_s
    (;1743:0;)                                  br_if 8
    (;1744:1;)                                  local.get 3
    (;1745:2;)                                  i32.const 0
    (;1746:0;)                                  i32.store offset=468
    (;1747:1;)                                  local.get 3
    (;1748:2;)                                  local.get 8
    (;1749:3;)                                  local.get 2
    (;1750:4;)                                  i32.const 31
    (;1751:5;)                                  local.get 2
    (;1752:6;)                                  i32.const 31
    (;1753:5;)                                  i32.lt_u
    (;1754:3;)                                  select
    (;1755:2;)                                  i32.shr_s
    (;1756:3;)                                  i32.const 15
    (;1757:2;)                                  i32.and
    (;1758:3;)                                  i32.const 66403
    (;1759:2;)                                  i32.add
    (;1760:2;)                                  i32.load8_u
    (;1761:0;)                                  i32.store8 offset=468
    (;1762:1;)                                  local.get 3
    (;1763:2;)                                  i32.const 96
    (;1764:1;)                                  i32.add
    (;1765:2;)                                  local.get 11
    (;1766:3;)                                  local.get 3
    (;1767:4;)                                  i32.const 468
    (;1768:3;)                                  i32.add
    (;1769:4;)                                  local.get 13
    (;1770:5;)                                  local.get 12
    (;1771:6;)                                  i32.const 1
    (;1772:7;)                                  i32.const 1
    (;1773:0;)                                  call 13  runtime.sliceAppend
    (;1774:1;)                                  local.get 27
    (;1775:2;)                                  local.get 3
    (;1776:2;)                                  i32.load offset=96
    (;1777:2;)                                  local.tee 11
    (;1778:0;)                                  i32.store
    (;1779:1;)                                  local.get 2
    (;1780:2;)                                  i32.const -4
    (;1781:1;)                                  i32.add
    (;1782:0;)                                  local.set 2
    (;1783:1;)                                  local.get 3
    (;1784:1;)                                  i32.load offset=104
    (;1785:0;)                                  local.set 12
    (;1786:1;)                                  local.get 3
    (;1787:1;)                                  i32.load offset=100
    (;1788:0;)                                  local.set 13
    (;1789:0;)                                  br 0
    (;1790:0;)                                end
    (;1791:0;)                              end
    (;1792:1;)                              local.get 3
    (;1793:2;)                              i32.const 304
    (;1794:1;)                              i32.add
    (;1795:2;)                              local.get 11
    (;1796:3;)                              i32.const 66395
    (;1797:4;)                              local.get 13
    (;1798:5;)                              local.get 12
    (;1799:6;)                              i32.const 2
    (;1800:7;)                              i32.const 1
    (;1801:0;)                              call 13  runtime.sliceAppend
    (;1802:1;)                              local.get 39
    (;1803:2;)                              local.get 3
    (;1804:2;)                              i32.load offset=304
    (;1805:2;)                              local.tee 11
    (;1806:0;)                              i32.store
    (;1807:1;)                              local.get 3
    (;1808:1;)                              i32.load offset=312
    (;1809:0;)                              local.set 12
    (;1810:1;)                              local.get 3
    (;1811:1;)                              i32.load offset=308
    (;1812:0;)                              local.set 13
    (;1813:0;)                              br 6
    (;1814:0;)                            end
    (;1815:1;)                            local.get 3
    (;1816:2;)                            i32.const 288
    (;1817:1;)                            i32.add
    (;1818:2;)                            local.get 11
    (;1819:3;)                            i32.const 66393
    (;1820:4;)                            local.get 13
    (;1821:5;)                            local.get 12
    (;1822:6;)                            i32.const 2
    (;1823:7;)                            i32.const 1
    (;1824:0;)                            call 13  runtime.sliceAppend
    (;1825:1;)                            local.get 37
    (;1826:2;)                            local.get 3
    (;1827:2;)                            i32.load offset=288
    (;1828:2;)                            local.tee 11
    (;1829:0;)                            i32.store
    (;1830:1;)                            local.get 3
    (;1831:1;)                            i32.load offset=296
    (;1832:0;)                            local.set 12
    (;1833:1;)                            local.get 3
    (;1834:1;)                            i32.load offset=292
    (;1835:0;)                            local.set 13
    (;1836:0;)                            br 5
    (;1837:0;)                          end
    (;1838:1;)                          local.get 3
    (;1839:2;)                          i32.const 272
    (;1840:1;)                          i32.add
    (;1841:2;)                          local.get 11
    (;1842:3;)                          i32.const 66391
    (;1843:4;)                          local.get 13
    (;1844:5;)                          local.get 12
    (;1845:6;)                          i32.const 2
    (;1846:7;)                          i32.const 1
    (;1847:0;)                          call 13  runtime.sliceAppend
    (;1848:1;)                          local.get 41
    (;1849:2;)                          local.get 3
    (;1850:2;)                          i32.load offset=272
    (;1851:2;)                          local.tee 11
    (;1852:0;)                          i32.store
    (;1853:1;)                          local.get 3
    (;1854:1;)                          i32.load offset=280
    (;1855:0;)                          local.set 12
    (;1856:1;)                          local.get 3
    (;1857:1;)                          i32.load offset=276
    (;1858:0;)                          local.set 13
    (;1859:0;)                          br 4
    (;1860:0;)                        end
    (;1861:1;)                        local.get 3
    (;1862:2;)                        i32.const 256
    (;1863:1;)                        i32.add
    (;1864:2;)                        local.get 11
    (;1865:3;)                        i32.const 66389
    (;1866:4;)                        local.get 13
    (;1867:5;)                        local.get 12
    (;1868:6;)                        i32.const 2
    (;1869:7;)                        i32.const 1
    (;1870:0;)                        call 13  runtime.sliceAppend
    (;1871:1;)                        local.get 38
    (;1872:2;)                        local.get 3
    (;1873:2;)                        i32.load offset=256
    (;1874:2;)                        local.tee 11
    (;1875:0;)                        i32.store
    (;1876:1;)                        local.get 3
    (;1877:1;)                        i32.load offset=264
    (;1878:0;)                        local.set 12
    (;1879:1;)                        local.get 3
    (;1880:1;)                        i32.load offset=260
    (;1881:0;)                        local.set 13
    (;1882:0;)                        br 3
    (;1883:0;)                      end
    (;1884:1;)                      local.get 3
    (;1885:2;)                      i32.const 240
    (;1886:1;)                      i32.add
    (;1887:2;)                      local.get 11
    (;1888:3;)                      i32.const 66387
    (;1889:4;)                      local.get 13
    (;1890:5;)                      local.get 12
    (;1891:6;)                      i32.const 2
    (;1892:7;)                      i32.const 1
    (;1893:0;)                      call 13  runtime.sliceAppend
    (;1894:1;)                      local.get 40
    (;1895:2;)                      local.get 3
    (;1896:2;)                      i32.load offset=240
    (;1897:2;)                      local.tee 11
    (;1898:0;)                      i32.store
    (;1899:1;)                      local.get 3
    (;1900:1;)                      i32.load offset=248
    (;1901:0;)                      local.set 12
    (;1902:1;)                      local.get 3
    (;1903:1;)                      i32.load offset=244
    (;1904:0;)                      local.set 13
    (;1905:0;)                      br 2
    (;1906:0;)                    end
    (;1907:1;)                    local.get 3
    (;1908:2;)                    i32.const 224
    (;1909:1;)                    i32.add
    (;1910:2;)                    local.get 11
    (;1911:3;)                    i32.const 66385
    (;1912:4;)                    local.get 13
    (;1913:5;)                    local.get 12
    (;1914:6;)                    i32.const 2
    (;1915:7;)                    i32.const 1
    (;1916:0;)                    call 13  runtime.sliceAppend
    (;1917:1;)                    local.get 36
    (;1918:2;)                    local.get 3
    (;1919:2;)                    i32.load offset=224
    (;1920:2;)                    local.tee 11
    (;1921:0;)                    i32.store
    (;1922:1;)                    local.get 3
    (;1923:1;)                    i32.load offset=232
    (;1924:0;)                    local.set 12
    (;1925:1;)                    local.get 3
    (;1926:1;)                    i32.load offset=228
    (;1927:0;)                    local.set 13
    (;1928:0;)                    br 1
    (;1929:0;)                  end
    (;1930:1;)                  local.get 3
    (;1931:2;)                  i32.const 208
    (;1932:1;)                  i32.add
    (;1933:2;)                  local.get 11
    (;1934:3;)                  i32.const 66383
    (;1935:4;)                  local.get 13
    (;1936:5;)                  local.get 12
    (;1937:6;)                  i32.const 2
    (;1938:7;)                  i32.const 1
    (;1939:0;)                  call 13  runtime.sliceAppend
    (;1940:1;)                  local.get 35
    (;1941:2;)                  local.get 3
    (;1942:2;)                  i32.load offset=208
    (;1943:2;)                  local.tee 11
    (;1944:0;)                  i32.store
    (;1945:1;)                  local.get 3
    (;1946:1;)                  i32.load offset=216
    (;1947:0;)                  local.set 12
    (;1948:1;)                  local.get 3
    (;1949:1;)                  i32.load offset=212
    (;1950:0;)                  local.set 13
    (;1951:0;)                end
    (;1952:1;)                local.get 28
    (;1953:2;)                local.get 11
    (;1954:0;)                i32.store
    (;1955:0;)              end
    (;1956:1;)              local.get 22
    (;1957:2;)              local.get 11
    (;1958:0;)              i32.store
    (;1959:1;)              local.get 23
    (;1960:2;)              local.get 11
    (;1961:0;)              i32.store
    (;1962:1;)              local.get 7
    (;1963:2;)              local.get 43
    (;1964:1;)              i32.lt_u
    (;1965:0;)              br_if 2
    (;1966:0;)            end
    (;1967:1;)            local.get 7
    (;1968:2;)            local.get 43
    (;1969:1;)            i32.sub
    (;1970:0;)            local.set 7
    (;1971:1;)            local.get 6
    (;1972:2;)            local.get 43
    (;1973:1;)            i32.add
    (;1974:0;)            local.set 6
    (;1975:0;)            br 0
    (;1976:0;)          end
    (;1977:0;)        end
    (;1978:0;)        call 92  runtime.slicePanic
    (;1979:0;)        unreachable
    (;1980:0;)      end
    (;1981:0;)      call 72  runtime.nilPanic
    (;1982:0;)      unreachable
    (;1983:0;)    end
    (;1984:0;)    call 77  runtime.lookupPanic
    (;1985:0;)    unreachable
    (;1986:0;)  end
  )

  (func "resume" (;116;) (type 6)
    (;0:0;)      call 117  runtime.resume$1
    (;1:0;)      unreachable
    (;2:0;)    end
  )

  (func "runtime.resume$1" (;117;) (type 6)
    (;0:0;)      call 72  runtime.nilPanic
    (;1:0;)      unreachable
    (;2:0;)    end
  )

  (data 0 (offset (i32.const 65536)) "dummylengthlogcontracteventsrandomrequeststatetransfersownercodedelaybalancehashparamsaddressamount\00\00\00\00\00\00\00\00\00\00\00\00\00\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f0\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\13\03\03\03\03\03\03\03\03\03\03\03\03#\03\034\04\04\04D\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\f1\80\bf\a0\bf\80\9f\90\bf\80\8f\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00unimplemented: alignment of type\90\01\01\00 \00\00\00\00\00\00\00\00\00\00\00unimplemented: (reflect.Type).Elem()\00\00\00\00\c0\01\01\00$\00\00\00Field\00\00\00\00\00\00\00\00\00\00\00reflect: field index out of range\00\00\00\00\00\00\00\00\02\01\00!\00\00\00<unimplemented>NumField\00\00\00\00\00\00\00\00\00unimplemented: size of type\00\00\00\00\00P\02\01\00\1b\00\00\00BoolComplexFloat\00\00\00\00\00\00\00\00reflect: slice index out of range\00\00\00\00\00\00\00\90\02\01\00!\00\00\00reflect: string index out of range\00\00\00\00\00\00\c0\02\01\00"\00\00\00IndexIntLen\00\00\00\00\00unimplemented: (reflect.Value).Pointer()\00\03\01\00(\00\00\00Pointer<T>UintParseIntParseUint\a\b\f\n\r\t\v\u\U\x0123456789abcdef\00\00\00\00\00\00\00\00\00\00\00\00\00value out of rangeinvalid syntax0123456789abcdefghijklmnopqrstuvwxyz\00\00\00\00\00\00\00\00\00\00\00\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899|Increment...\00\00\00\00\00\00\00\00\00\00\00incrementRepeat1...\00\00\00\00\00\00\00\00\00\00\00\00\00incrementRepeatMany...counternumrepeatsLock bets...\00\00\00\00\00\00\00\00\00\00\00\00\00Doing nothing as requested. Oh, wait...Pay winners...lastWinningColorlockedBetsNobody wins!Pay  to Remainder is Place bet...iotaEmpty bet...colorNo color...Invalid color...betsPlay period...\00\00Cancel spoofed request\00\00\00\00\00\00\00\00\00\00Invalid play period...playPeriodtimestamperror2TestToken mint...panic: out of memory\00\00\00\00\00\00\00\00\00\00\00\00type assert failed\00\00\00\00\00\00\00\00\00\00\00\00\00\00index out of range\00\00\00\00\00\00\00\00\00\00\00\00\00\00nil pointer dereferencetruefalsei)NaN+Inf-Infnilcomparing un-comparable type\00\00\00\00panic: runtime error: \00\00\00\00\00\00\00\00\00\00slice out of range\00\00\00\00\00\00\00\00\00\00\00\00\00\00reflect: call of reflect.Type.\00\00reflect: call of reflect.Value. on invalid typestrconv.parsing : \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0a\00\00\00\0a\00\00\00\0e\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03\04"\00\04"\05\043\09\01\04"\0d\01\00"\14\00\00\00\00\00\00\00\00\00\00\00\00\00\00\04Func\03Num\03Err\06Method\01s")
  (data 0 (offset (i32.const 67568)) "\07\00\00\00`\14\01\00\00\00\00\00\00\00\00\00 \00~\00\a1\00w\03z\03\7f\03\84\03V\05Y\05\8a\05\8d\05\c7\05\d0\05\ea\05\ef\05\f4\05\06\06\1b\06\1e\06\0d\07\10\07J\07M\07\b1\07\c0\07\fa\07\fd\07-\080\08[\08^\08j\08\a0\08\bd\08\d3\08\8c\09\8f\09\90\09\93\09\b2\09\b6\09\b9\09\bc\09\c4\09\c7\09\c8\09\cb\09\ce\09\d7\09\d7\09\dc\09\e3\09\e6\09\fe\09\01\0a\0a\0a\0f\0a\10\0a\13\0a9\0a<\0aB\0aG\0aH\0aK\0aM\0aQ\0aQ\0aY\0a^\0af\0av\0a\81\0a\b9\0a\bc\0a\cd\0a\d0\0a\d0\0a\e0\0a\e3\0a\e6\0a\f1\0a\f9\0a\0c\0b\0f\0b\10\0b\13\0b9\0b<\0bD\0bG\0bH\0bK\0bM\0bV\0bW\0b\\0bc\0bf\0bw\0b\82\0b\8a\0b\8e\0b\95\0b\99\0b\9f\0b\a3\0b\a4\0b\a8\0b\aa\0b\ae\0b\b9\0b\be\0b\c2\0b\c6\0b\cd\0b\d0\0b\d0\0b\d7\0b\d7\0b\e6\0b\fa\0b\00\0c9\0c=\0cM\0cU\0cZ\0c`\0cc\0cf\0co\0cw\0c\b9\0c\bc\0c\cd\0c\d5\0c\d6\0c\de\0c\e3\0c\e6\0c\f2\0c\00\0dO\0dT\0dc\0df\0d\7f\0d\82\0d\96\0d\9a\0d\bd\0d\c0\0d\c6\0d\ca\0d\ca\0d\cf\0d\df\0d\e6\0d\ef\0d\f2\0d\f4\0d\01\0e:\0e?\0e[\0e\81\0e\bd\0e\c0\0e\cd\0e\d0\0e\d9\0e\dc\0e\df\0e\00\0fl\0fq\0f\da\0f\00\10\c7\10\cd\10\cd\10\d0\10M\12P\12]\12`\12\8d\12\90\12\b5\12\b8\12\c5\12\c8\12\15\13\18\13Z\13]\13|\13\80\13\99\13\a0\13\f5\13\f8\13\fd\13\00\14\9c\16\a0\16\f8\16\00\17\14\17 \176\17@\17S\17`\17s\17\80\17\dd\17\e0\17\e9\17\f0\17\f9\17\00\18\0d\18\10\18\19\18 \18x\18\80\18\aa\18\b0\18\f5\18\00\19+\190\19;\19@\19@\19D\19m\19p\19t\19\80\19\ab\19\b0\19\c9\19\d0\19\da\19\de\19\1b\1a\1e\1a|\1a\7f\1a\89\1a\90\1a\99\1a\a0\1a\ad\1a\b0\1a\be\1a\00\1bK\1bP\1b|\1b\80\1b\f3\1b\fc\1b7\1c;\1cI\1cM\1c\88\1c\90\1c\ba\1c\bd\1c\c7\1c\d0\1c\fa\1c\00\1d\15\1f\18\1f\1d\1f \1fE\1fH\1fM\1fP\1f}\1f\80\1f\d3\1f\d6\1f\ef\1f\f2\1f\fe\1f\10 ' 0 ^ p q t \9c \a0 \bf \d0 \f0 \00!\8b!\90!&$@$J$`$s+v+\95+\98+\f3,\f9,'-----0-g-o-p-\7f-\96-\a0-O.\80.\f3.\00/\d5/\f0/\fb/\010\960\990\ff0\051\ba1\c01\e31\f01\b5M\c0M\ef\9f\00\a0\8c\a4\90\a4\c6\a4\d0\a4+\a6@\a6\f7\a6\00\a7\bf\a7\c2\a7\c6\a7\f7\a7+\a80\a89\a8@\a8w\a8\80\a8\c5\a8\ce\a8\d9\a8\e0\a8S\a9_\a9|\a9\80\a9\d9\a9\de\a96\aa@\aaM\aaP\aaY\aa\\aa\c2\aa\db\aa\f6\aa\01\ab\06\ab\09\ab\0e\ab\11\ab\16\ab \abg\abp\ab\ed\ab\f0\ab\f9\ab\00\ac\a3\d7\b0\d7\c6\d7\cb\d7\fb\d7\00\f9m\fap\fa\d9\fa\00\fb\06\fb\13\fb\17\fb\1d\fb\c1\fb\d3\fb?\fdP\fd\8f\fd\92\fd\c7\fd\f0\fd\fd\fd\00\fe\19\fe \fek\fep\fe\fc\fe\01\ff\be\ff\c2\ff\c7\ff\ca\ff\cf\ff\d2\ff\d7\ff\da\ff\dc\ff\e0\ff\ee\ff\fc\ff\fd\ff\00\00\00\00\00\00\00\00\00\00\00\00\ad\00\8b\03\8d\03\a2\030\05\90\05\dd\06?\08_\08\b5\08\e2\08\84\09\a9\09\b1\09\de\09\04\0a)\0a1\0a4\0a7\0a=\0a]\0a\84\0a\8e\0a\92\0a\a9\0a\b1\0a\b4\0a\c6\0a\ca\0a\00\0b\04\0b)\0b1\0b4\0b^\0b\84\0b\91\0b\9b\0b\9d\0b\c9\0b\0d\0c\11\0c)\0cE\0cI\0cW\0c\8d\0c\91\0c\a9\0c\b4\0c\c5\0c\c9\0c\df\0c\f0\0c\04\0d\0d\0d\11\0dE\0dI\0d\84\0d\b2\0d\bc\0d\d5\0d\d7\0d\83\0e\85\0e\8b\0e\a4\0e\a6\0e\c5\0e\c7\0eH\0f\98\0f\bd\0f\cd\0f\c6\10I\12W\12Y\12\89\12\b1\12\bf\12\c1\12\d7\12\11\13\80\16\0d\17m\17q\17\1f\19_\1a\fa\1dX\1fZ\1f\\1f^\1f\b5\1f\c5\1f\dc\1f\f5\1f\8f /,_,&-\a7-\af-\b7-\bf-\c7-\cf-\d7-\df-\9a.@001\8f1\1f2\ff2\ce\a9\ff\a9'\ab/\ab7\fb=\fb?\fbB\fbE\fbS\feg\feu\fe\e7\ff\00\00\00\00\00\00\00\00\00\00\01\00M\00\01\00P\00\01\00]\00\01\00\80\00\01\00\fa\00\01\00\00\01\01\00\02\01\01\00\07\01\01\003\01\01\007\01\01\00\9b\01\01\00\a0\01\01\00\a0\01\01\00\d0\01\01\00\fd\01\01\00\80\02\01\00\9c\02\01\00\a0\02\01\00\d0\02\01\00\e0\02\01\00\fb\02\01\00\00\03\01\00#\03\01\00-\03\01\00J\03\01\00P\03\01\00z\03\01\00\80\03\01\00\c3\03\01\00\c8\03\01\00\d5\03\01\00\00\04\01\00\9d\04\01\00\a0\04\01\00\a9\04\01\00\b0\04\01\00\d3\04\01\00\d8\04\01\00\fb\04\01\00\00\05\01\00'\05\01\000\05\01\00c\05\01\00o\05\01\00o\05\01\00\00\06\01\006\07\01\00@\07\01\00U\07\01\00`\07\01\00g\07\01\00\00\08\01\00\05\08\01\00\08\08\01\008\08\01\00<\08\01\00<\08\01\00?\08\01\00\9e\08\01\00\a7\08\01\00\af\08\01\00\e0\08\01\00\f5\08\01\00\fb\08\01\00\1b\09\01\00\1f\09\01\009\09\01\00?\09\01\00?\09\01\00\80\09\01\00\b7\09\01\00\bc\09\01\00\cf\09\01\00\d2\09\01\00\06\0a\01\00\0c\0a\01\005\0a\01\008\0a\01\00:\0a\01\00?\0a\01\00H\0a\01\00P\0a\01\00X\0a\01\00`\0a\01\00\9f\0a\01\00\c0\0a\01\00\e6\0a\01\00\eb\0a\01\00\f6\0a\01\00\00\0b\01\005\0b\01\009\0b\01\00U\0b\01\00X\0b\01\00r\0b\01\00x\0b\01\00\91\0b\01\00\99\0b\01\00\9c\0b\01\00\a9\0b\01\00\af\0b\01\00\00\0c\01\00H\0c\01\00\80\0c\01\00\b2\0c\01\00\c0\0c\01\00\f2\0c\01\00\fa\0c\01\00'\0d\01\000\0d\01\009\0d\01\00`\0e\01\00~\0e\01\00\00\0f\01\00'\0f\01\000\0f\01\00Y\0f\01\00\e0\0f\01\00\f6\0f\01\00\00\10\01\00M\10\01\00R\10\01\00o\10\01\00\7f\10\01\00\c1\10\01\00\d0\10\01\00\e8\10\01\00\f0\10\01\00\f9\10\01\00\00\11\01\00F\11\01\00P\11\01\00v\11\01\00\80\11\01\00\cd\11\01\00\d0\11\01\00\f4\11\01\00\00\12\01\00>\12\01\00\80\12\01\00\a9\12\01\00\b0\12\01\00\ea\12\01\00\f0\12\01\00\f9\12\01\00\00\13\01\00\0c\13\01\00\0f\13\01\00\10\13\01\00\13\13\01\00D\13\01\00G\13\01\00H\13\01\00K\13\01\00M\13\01\00P\13\01\00P\13\01\00W\13\01\00W\13\01\00]\13\01\00c\13\01\00f\13\01\00l\13\01\00p\13\01\00t\13\01\00\00\14\01\00_\14\01\00\80\14\01\00\c7\14\01\00\d0\14\01\00\d9\14\01\00\80\15\01\00\b5\15\01\00\b8\15\01\00\dd\15\01\00\00\16\01\00D\16\01\00P\16\01\00Y\16\01\00`\16\01\00l\16\01\00\80\16\01\00\b8\16\01\00\c0\16\01\00\c9\16\01\00\00\17\01\00\1a\17\01\00\1d\17\01\00+\17\01\000\17\01\00?\17\01\00\00\18\01\00;\18\01\00\a0\18\01\00\f2\18\01\00\ff\18\01\00\ff\18\01\00\a0\19\01\00\a7\19\01\00\aa\19\01\00\d7\19\01\00\da\19\01\00\e4\19\01\00\00\1a\01\00G\1a\01\00P\1a\01\00\a2\1a\01\00\c0\1a\01\00\f8\1a\01\00\00\1c\01\00E\1c\01\00P\1c\01\00l\1c\01\00p\1c\01\00\8f\1c\01\00\92\1c\01\00\b6\1c\01\00\00\1d\01\006\1d\01\00:\1d\01\00G\1d\01\00P\1d\01\00Y\1d\01\00`\1d\01\00\98\1d\01\00\a0\1d\01\00\a9\1d\01\00\e0\1e\01\00\f8\1e\01\00\c0\1f\01\00\f1\1f\01\00\ff\1f\01\00\99#\01\00\00$\01\00t$\01\00\80$\01\00C%\01\00\000\01\00.4\01\00\00D\01\00FF\01\00\00h\01\008j\01\00@j\01\00ij\01\00nj\01\00oj\01\00\d0j\01\00\edj\01\00\f0j\01\00\f5j\01\00\00k\01\00Ek\01\00Pk\01\00wk\01\00}k\01\00\8fk\01\00@n\01\00\9an\01\00\00o\01\00Jo\01\00Oo\01\00\87o\01\00\8fo\01\00\9fo\01\00\e0o\01\00\e3o\01\00\00p\01\00\f7\87\01\00\00\88\01\00\f2\8a\01\00\00\b0\01\00\1e\b1\01\00P\b1\01\00R\b1\01\00d\b1\01\00g\b1\01\00p\b1\01\00\fb\b2\01\00\00\bc\01\00j\bc\01\00p\bc\01\00|\bc\01\00\80\bc\01\00\88\bc\01\00\90\bc\01\00\99\bc\01\00\9c\bc\01\00\9f\bc\01\00\00\d0\01\00\f5\d0\01\00\00\d1\01\00&\d1\01\00)\d1\01\00r\d1\01\00{\d1\01\00\e8\d1\01\00\00\d2\01\00E\d2\01\00\e0\d2\01\00\f3\d2\01\00\00\d3\01\00V\d3\01\00`\d3\01\00x\d3\01\00\00\d4\01\00\9f\d4\01\00\a2\d4\01\00\a2\d4\01\00\a5\d4\01\00\a6\d4\01\00\a9\d4\01\00\0a\d5\01\00\0d\d5\01\00F\d5\01\00J\d5\01\00\a5\d6\01\00\a8\d6\01\00\cb\d7\01\00\ce\d7\01\00\8b\da\01\00\9b\da\01\00\af\da\01\00\00\e0\01\00\18\e0\01\00\1b\e0\01\00*\e0\01\00\00\e1\01\00,\e1\01\000\e1\01\00=\e1\01\00@\e1\01\00I\e1\01\00N\e1\01\00O\e1\01\00\c0\e2\01\00\f9\e2\01\00\ff\e2\01\00\ff\e2\01\00\00\e8\01\00\c4\e8\01\00\c7\e8\01\00\d6\e8\01\00\00\e9\01\00K\e9\01\00P\e9\01\00Y\e9\01\00^\e9\01\00_\e9\01\00q\ec\01\00\b4\ec\01\00\01\ed\01\00=\ed\01\00\00\ee\01\00$\ee\01\00'\ee\01\00;\ee\01\00B\ee\01\00B\ee\01\00G\ee\01\00T\ee\01\00W\ee\01\00d\ee\01\00g\ee\01\00\9b\ee\01\00\a1\ee\01\00\bb\ee\01\00\f0\ee\01\00\f1\ee\01\00\00\f0\01\00+\f0\01\000\f0\01\00\93\f0\01\00\a0\f0\01\00\ae\f0\01\00\b1\f0\01\00\f5\f0\01\00\00\f1\01\00\0c\f1\01\00\10\f1\01\00l\f1\01\00p\f1\01\00\ac\f1\01\00\e6\f1\01\00\02\f2\01\00\10\f2\01\00;\f2\01\00@\f2\01\00H\f2\01\00P\f2\01\00Q\f2\01\00`\f2\01\00e\f2\01\00\00\f3\01\00\d5\f6\01\00\e0\f6\01\00\ec\f6\01\00\f0\f6\01\00\fa\f6\01\00\00\f7\01\00s\f7\01\00\80\f7\01\00\d8\f7\01\00\e0\f7\01\00\eb\f7\01\00\00\f8\01\00\0b\f8\01\00\10\f8\01\00G\f8\01\00P\f8\01\00Y\f8\01\00`\f8\01\00\87\f8\01\00\90\f8\01\00\ad\f8\01\00\00\f9\01\00v\f9\01\00z\f9\01\00\a2\f9\01\00\a5\f9\01\00\aa\f9\01\00\ae\f9\01\00\ca\f9\01\00\cd\f9\01\00S\fa\01\00`\fa\01\00m\fa\01\00p\fa\01\00s\fa\01\00x\fa\01\00z\fa\01\00\80\fa\01\00\82\fa\01\00\90\fa\01\00\95\fa\01\00\00\00\02\00\d6\a6\02\00\00\a7\02\004\b7\02\00@\b7\02\00\1d\b8\02\00 \b8\02\00\a1\ce\02\00\b0\ce\02\00\e0\eb\02\00\00\f8\02\00\1d\fa\02\00\00\01\0e\00\ef\01\0e\00\00\00\00\00\00\00\00\00\0c\00'\00;\00>\00\8f\01\9e\03\09\086\08V\08\f3\08\04\0a\14\0a\18\0a\bd\105\11\e0\11\12\12\87\12\89\12\8e\12\9e\12\04\13)\131\134\13:\13Z\14\\14\09\1c7\1c\a8\1c\07\1d\0a\1d;\1d>\1df\1di\1d\8f\1d\92\1do$_jZkbkU\d4\9d\d4\ad\d4\ba\d4\bc\d4\c4\d4\06\d5\15\d5\1d\d5:\d5?\d5E\d5Q\d5\a0\da\07\e0"\e0%\e0\04\ee \ee#\ee(\ee3\ee8\ee:\eeH\eeJ\eeL\eeP\eeS\eeX\eeZ\ee\\ee^\ee`\eec\eek\ees\eex\ee}\ee\7f\ee\8a\ee\a4\ee\aa\ee\c0\f0\d0\f0\0c\f9r\f9\00\00\00\00\00\00\00\00\00\00\00\00\9d\14\01\00\01\00\00\00\80\03\01\00\12\00\00\00\92\03\01\00\0e\00\00\00\00\00\00\00U")

  (custom (;0;) 11 (size 28340))
  (custom (;1;) 11 (size 2087))
  (custom (;2;) 11 (size 9592))
  (custom (;3;) 11 (size 2128))
  (custom (;4;) 11 (size 653))
  (custom (;5;) 11 (size 14723))
  (custom (;6;) 11 (size 18906))
  (custom (;7;) 11 (size 18340))
  (custom (;8;) 11 (size 3604))
  (custom (;9;) 11 (size 123))
)
