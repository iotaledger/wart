// Package wasm contains all the Plain Old Go Objects (POGO) that make up the
// module tree. These objects only use basic go types or refer to other module
// tree objects. The few methods defined here are operating strictly within
// their own type.
//
// The purpose of keeping these types simple and clean is to be able to
// use them as communication objects between modules thereby preventing
// many occasions for Go's dreaded circular module reference error
package wasm
