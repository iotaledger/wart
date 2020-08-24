package wasp

var keyLength int32
var keyLog int32
var keyTrace int32

func KeyLength() int32 {
	if keyLength == 0 {
		keyLength = GetKey("length")
	}
	return keyLength
}

func KeyLog() int32 {
	if keyLog == 0 {
		keyLog = GetKey("log")
	}
	return keyLog
}

func KeyTrace() int32 {
	if keyTrace == 0 {
		keyTrace = GetKey("trace")
	}
	return keyTrace
}
