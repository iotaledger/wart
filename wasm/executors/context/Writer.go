package context

import (
	"encoding/binary"
	"github.com/iotaledger/wart/wasm/consts/value"
	"math"
)

type Writer struct {
	data []byte
}

func NewWriter() *Writer {
	return &Writer{}
}

func (w *Writer) Data() []byte {
	return w.data
}

func (w *Writer) leb128EncodeI64(val int64) {
	for {
		b := byte(val)
		s := b & 0x40
		val >>= 7
		if (val == 0 && s == 0) || (val == -1 && s != 0) {
			w.PutByte(b & 0x7f)
			return
		}
		w.PutByte(b | 0x80)
	}
}

func (w *Writer) leb128EncodeU64(val uint64) {
	for {
		b := byte(val)
		val >>= 7
		if val == 0 {
			w.PutByte(b)
			return
		}
		w.PutByte(b | 0x80)
	}
}

func (w *Writer) PutByte(val byte) {
	w.data = append(w.data, val)
}

func (w *Writer) PutBytes(data []byte) {
	w.data = append(w.data, data...)
}

func (w *Writer) PutDataType(dataType value.DataType) {
	w.PutByte(byte(dataType))
}

func (w *Writer) PutDataTypes(dataTypes []value.DataType) {
	w.PutU32(uint32(len(dataTypes)))
	for _, dataType := range dataTypes {
		w.PutDataType(dataType)
	}
}

func (w *Writer) PutF32(val float32) {
	data := make([]byte, 4)
	binary.LittleEndian.PutUint32(data, math.Float32bits(val))
	w.PutBytes(data)
}

func (w *Writer) PutF64(val float64) {
	data := make([]byte, 8)
	binary.LittleEndian.PutUint64(data, math.Float64bits(val))
	w.PutBytes(data)
}

func (w *Writer) PutI32(val int32) {
	w.leb128EncodeI64(int64(val))
}

func (w *Writer) PutI64(val int64) {
	w.leb128EncodeI64(val)
}

func (w *Writer) PutLimits(min uint32, max uint32) {
	var flag byte
	if max != value.UNDEFINED {
		flag = 0x01
	}
	w.PutByte(flag)
	w.PutU32(min)
	if flag == 0x01 {
		w.PutU32(max)
	}
}

func (w *Writer) PutString(val string) {
	strData := []byte(val)
	w.PutU32(uint32(len(strData)))
	w.PutBytes(strData)
}

func (w *Writer) PutU32(val uint32) {
	w.leb128EncodeU64(uint64(val))
}

func (w *Writer) PutU64(val uint64) {
	w.leb128EncodeU64(val)
}

// returns size of written part
func (w *Writer) Size() uint32 {
	return uint32(len(w.data))
}
