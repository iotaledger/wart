package context

import (
	"github.com/iotaledger/wart/utils"
	"github.com/iotaledger/wart/wasm/consts/value"
	"github.com/iotaledger/wart/wasm/sections"
	"math"
	"unicode/utf8"
)

type Reader struct {
	data   []byte
	Flag   byte
	Error  error
	Max    uint32
	Min    uint32
	Module *sections.Module
	Opcode byte
	pos    int
	IP     int
}

func NewReader(m *sections.Module, data []byte) *Reader {
	return &Reader{Module: m, data: data}
}

func (r *Reader) GetByte() byte {
	if len(r.data) < r.pos+1 {
		r.Error = utils.Error("unexpected end of section or function")
		return 0
	}
	r.pos++
	return r.data[r.pos-1]
}

func (r *Reader) GetBytes(count uint32) []byte {
	n := int(count)
	if n < 0 || len(r.data) < r.pos+n {
		r.Error = utils.Error("unexpected end of section or function: length out of bounds")
		return nil
	}
	r.pos += n
	return r.data[r.pos-n : r.pos]
}

func (r *Reader) getBytesU64(count int) uint64 {
	var val uint64
	s := 0
	for i := 0; i < count; i++ {
		b := r.GetByte()
		if r.Error != nil {
			return 0
		}
		val |= uint64(b) << s
		s += 8
	}
	return val
}

func (r *Reader) GetF32() float32 {
	val := r.getBytesU64(4)
	if r.Error != nil {
		return 0
	}
	return math.Float32frombits(uint32(val))
}

func (r *Reader) GetF64() float64 {
	val := r.getBytesU64(8)
	if r.Error != nil {
		return 0
	}
	return math.Float64frombits(val)
}

func (r *Reader) GetI32() int32 {
	//return int32(r.leb128DecodeI64(32))
	i64 := r.leb128DecodeI64(32)
	val := int32(i64)
	top := int32(i64 >> 32)
	if (val < 0 && top != -1) || (val >= 0 && top != 0) {
		r.Error = utils.Error("integer too large")
		return 0
	}
	return val
}

func (r *Reader) GetI64() int64 {
	return r.leb128DecodeI64(64)
}

func (r *Reader) GetLimits() {
	r.Flag = r.GetByte()
	if r.Error != nil {
		return
	}
	if /* r.Flag < 0x00 || */ r.Flag > 0x01 {
		r.Error = utils.Error("Expected limits flag 0x00 or 0x01")
		return
	}
	r.Min = r.GetU32()
	if r.Error != nil {
		return
	}
	r.Max = value.UNDEFINED
	if r.Flag == 0x01 {
		r.Max = r.GetU32()
	}
}

func (r *Reader) GetString() string {
	strLen := r.GetU32()
	if r.Error != nil {
		return ""
	}
	strData := r.GetBytes(strLen)
	if r.Error != nil {
		return ""
	}
	if !utf8.Valid(strData) {
		r.Error = utils.Error("malformed UTF-8 encoding")
		return ""
	}
	return string(strData)
}

func (r *Reader) GetU32() uint32 {
	//return uint32(r.leb128DecodeU64(32))
	u64 := r.leb128DecodeU64(32)
	if u64>>32 != 0 {
		r.Error = utils.Error("integer too large")
		return 0
	}
	return uint32(u64)
}

func (r *Reader) GetU64() uint64 {
	return r.leb128DecodeU64(64)
}

func (r *Reader) GetValueType() value.Type {
	b := r.GetByte()
	if r.Error != nil {
		return value.NONE
	}
	vt := value.Type(b)
	r.Error = vt.Check()
	if r.Error != nil {
		return value.NONE
	}
	return vt
}

func (r *Reader) GetValueTypes() []value.Type {
	count := r.GetU32()
	if r.Error != nil {
		return nil
	}
	valueTypes := make([]value.Type, 0)
	for ; count != 0; count-- {
		vt := r.GetValueType()
		if r.Error != nil {
			return nil
		}
		valueTypes = append(valueTypes, vt)
	}
	return valueTypes
}

func (r *Reader) leb128DecodeI64(limit int) int64 {
	val := int64(0)
	s := 0
	for {
		buf := r.GetByte()
		if r.Error != nil {
			return 0
		}
		b := int8(buf)
		val |= int64(b&0x7f) << s
		if b >= 0 {
			if int8(val>>s)&0x7f != b&0x7f {
				r.Error = utils.Error("integer too large")
				return 0
			}
			// extend int7 sign to int8
			if (b & 0x40) != 0 {
				b |= -0x80
			}
			// extend int8 sign to int64
			return val | (int64(b) << s)
		}
		s += 7
		if s >= limit {
			r.Error = utils.Error("integer representation too long: %d", limit)
			return 0
		}
	}
}

func (r *Reader) leb128DecodeU64(limit int) uint64 {
	val := uint64(0)
	s := 0
	for {
		buf := r.GetByte()
		if r.Error != nil {
			return 0
		}
		b := uint64(buf)
		if (b & 0x80) == 0 {
			val |= b << s
			if byte(val>>s) != buf {
				r.Error = utils.Error("integer too large")
				return 0
			}
			return val
		}
		val |= (b & 0x7f) << s
		s += 7
		if s >= limit {
			r.Error = utils.Error("integer representation too long: %d", limit)
			return 0
		}
	}
}

// returns size of unread part
func (r *Reader) Size() uint32 {
	return uint32(len(r.data) - r.pos)
}
