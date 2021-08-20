package main

import (
	"log"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	if len(os.Args) >= 2 && os.Args[1] == "tekton_run_indefinitely" {
		log.Println("Waiting indefinitely...")
		ch := make(chan os.Signal)
		signal.Notify(ch, syscall.SIGINT, syscall.SIGTERM)
		log.Println("received signal:", <-ch)
	}

	log.Println("Exiting...")
	os.Exit(0)
}
