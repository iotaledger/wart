package utils

import (
	"errors"
	"fmt"
)

// Centralized error function allows for formatted errors and
// also provides a single breakpoint location for debugging.
func Error(format string, a ...interface{}) error {
	return errors.New(fmt.Sprintf(format, a...))
}
