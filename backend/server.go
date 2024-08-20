package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/sendmail", messageHandler)

	srv := &http.Server{
		Addr:    ":3000",
		Handler: enableCors(http.DefaultServeMux),
	}
	fmt.Println("Server is running in server 3000")

	log.Fatal(srv.ListenAndServe())
}
