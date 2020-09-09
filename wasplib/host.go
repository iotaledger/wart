package wasplib

const (
	OBJTYPE_INT          int32 = 0
	OBJTYPE_INT_ARRAY    int32 = 1
	OBJTYPE_MAP          int32 = 2
	OBJTYPE_MAP_ARRAY    int32 = 3
	OBJTYPE_STRING       int32 = 4
	OBJTYPE_STRING_ARRAY int32 = 5
)

//go:wasm-module waspGo
//export hostGetInt
func hostGetInt(objId int32, keyId int32, value *int64)

//go:wasm-module waspGo
//export hostGetKeyId
func hostGetKeyId(key string) int32

//go:wasm-module waspGo
//export hostGetObjectId
func hostGetObjectId(objId int32, keyId int32, typeId int32) int32

//go:wasm-module waspGo
//export hostGetString
func hostGetString(objId int32, keyId int32, value *string)

//go:wasm-module waspGo
//export hostSetInt
func hostSetInt(objId int32, keyId int32, value *int64)

//go:wasm-module waspGo
//export hostSetString
func hostSetString(objId int32, keyId int32, value string)

func GetInt(objId int32, keyId int32) int64 {
	// Go is still geared towards Javascript, which does not have int64
	// To combat this we pass a reference to a preallocated int64 instead
	var value int64
	hostGetInt(objId, keyId, &value)
	return value
}

func GetKeyId(key string) int32 {
	return hostGetKeyId(key)
}

func GetObjectId(objId int32, keyId int32, typeId int32) int32 {
	return hostGetObjectId(objId, keyId, typeId)
}

func GetString(objId int32, keyId int32) string {
	// returning the string as we did in Rust seems to have problems
	// it looks like the string at some point gets deallocated and
	// overwritten by the Go runtime, so we counter this by passing
	// a reference to a dummy static string, which will be directly
	// modified to point to the returned temporary static string
	value := "dummy"
	hostGetString(objId, keyId, &value)

	// now copy the bytes of the static string to a new byte array
	deepCopy := append([]byte(nil), value...)
	// ad turn the deep copy into the final string
	return string(deepCopy)
}

func SetInt(objId int32, keyId int32, value int64) {
	hostSetInt(objId, keyId, &value)
}

func SetString(objId int32, keyId int32, value string) {
	hostSetString(objId, keyId, value)
}
