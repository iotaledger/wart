// server.go
package main

import (
	"flag"
	"log"
	"net/http"
)

func main() {
	port := flag.String("port", "8000", "port")
	flag.Parse()
	log.Fatal(http.ListenAndServe(":"+*port, http.FileServer(http.Dir("."))))
}
