package config

import (
	"fmt"
)

// Load lädt eine YAML/JSON Konfigurationsdatei
func Load(path string) {
	fmt.Printf("[CONFIG] Lade Konfiguration aus %s\n", path)
}
