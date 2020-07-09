package host

type nullObject struct {
}

func (n nullObject) GetInt(keyId int32) int32 {
	if !errorState {
		setError("Null object")
	}
	return 0
}

func (n nullObject) GetString(keyId int32) string {
	if !errorState {
		setError("Null object")
	}
	return ""
}

func (n nullObject) SetInt(keyId int32, value int32) {
	if !errorState {
		setError("Null object")
	}
}

func (n nullObject) SetString(keyId int32, value string) {
	if !errorState {
		setError("Null object")
	}
}
