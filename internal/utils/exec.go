package utils

import "fmt"

// Exec führt ein Kommando aus (Platzhalter)
func Exec(cmd string) {
	fmt.Printf("[EXEC] %s\n", cmd)
}
