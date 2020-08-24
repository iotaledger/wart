package wasp

//TODO define external functions to be linked from interface module "waspGo"
//#[no_mangle]
//extern {
//	func hostGetInt(objId: int32, keyId: int32) int64;
//	func hostGetKey(key: string) int32;
//	func hostGetObject(objId: int32, keyId: int32, typeId: ScType) int32;
//	func hostGetString(objId: int32, keyId: int32) string;
//	func hostSetInt(objId: int32, keyId: int32, value: int64);
//	func hostSetString(objId: int32, keyId: int32, value: string);
//}

//TODO actually call external functions here

func GetInt(objId int32, keyId int32) int64 {
	return 0
}

func GetKey(key string) int32 {
	return 0
}

func GetObject(objId int32, keyId int32, typeId int32) int32 {
	return 0
}

func GetString(objId int32, keyId int32) string {
	return ""
}

func SetInt(objId int32, keyId int32, value int64) {
}

func SetString(objId int32, keyId int32, value string) {
}
