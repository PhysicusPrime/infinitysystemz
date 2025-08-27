#!/usr/bin/env bash

curr_dir=$(pwd)
echo "$curr_dir"
# Projektname
PROJECT="$(pwd)"

# Verzeichnis anlegen
mkdir -p $PROJECT
cd $PROJECT || exit 1

# Basisdateien
touch go.sum
cat > go.mod <<EOF
module github.com/username/$PROJECT

go 1.23
EOF

cat > README.md <<EOF
# $PROJECT

Ein Firmware-Build-System in Go für Raspberry Pi 4/5 (ARM64).
EOF

cat > Makefile <<'EOF'
.PHONY: build run

build:
	go build -o bin/firmware-builder ./cmd/firmware-builder

run:
	go run ./cmd/firmware-builder
EOF

# Configs
mkdir -p configs
cat > configs/busybox.yaml <<EOF
# Beispielkonfiguration für BusyBox
version: 1.36.1
target: arm64
static: true
EOF

cat > configs/rootfs.yaml <<EOF
# Beispiel RootFS Konfiguration
arch: arm64
packages:
  - busybox
  - bash
EOF

cat > configs/paths.yaml <<EOF
# Pfaddefinitionen
build_dir: ./build
output_dir: ./output
toolchain: /opt/toolchains/aarch64-linux-musl
EOF

# CMD
mkdir -p cmd/firmware-builder
cat > cmd/firmware-builder/main.go <<'EOF'
package main

import (
	"fmt"
)

func main() {
	fmt.Println("Firmware-Builder gestartet 🚀")
}
EOF

mkdir -p cmd/helper
cat > cmd/helper/main.go <<'EOF'
package main

import "fmt"

func main() {
	fmt.Println("Helper-Tool gestartet")
}
EOF

# Internal Build
mkdir -p internal/build
cat > internal/build/busybox.go <<'EOF'
package build

import "fmt"

// BuildBusybox kümmert sich um den BusyBox-Build
func BuildBusybox() {
	fmt.Println("[BUILD] BusyBox wird gebaut...")
}
EOF

cat > internal/build/rootfs.go <<'EOF'
package build

import "fmt"

// BuildRootfs erstellt ein RootFS
func BuildRootfs() {
	fmt.Println("[BUILD] RootFS wird erstellt...")
}
EOF

cat > internal/build/toolchain.go <<'EOF'
package build

import "fmt"

// SetupToolchain richtet die Cross-Toolchain ein
func SetupToolchain() {
	fmt.Println("[SETUP] Toolchain wird vorbereitet...")
}
EOF

# Internal Config
mkdir -p internal/config
cat > internal/config/loader.go <<'EOF'
package config

import (
	"fmt"
)

// Load lädt eine YAML/JSON Konfigurationsdatei
func Load(path string) {
	fmt.Printf("[CONFIG] Lade Konfiguration aus %s\n", path)
}
EOF

# Internal Utils
mkdir -p internal/utils
cat > internal/utils/exec.go <<'EOF'
package utils

import "fmt"

// Exec führt ein Kommando aus (Platzhalter)
func Exec(cmd string) {
	fmt.Printf("[EXEC] %s\n", cmd)
}
EOF

cat > internal/utils/download.go <<'EOF'
package utils

import "fmt"

// Download lädt eine Datei herunter (Platzhalter)
func Download(url string) {
	fmt.Printf("[DOWNLOAD] Lade %s herunter...\n", url)
}
EOF

cat > internal/utils/logging.go <<'EOF'
package utils

import "fmt"

// Log gibt eine Nachricht aus
func Log(msg string) {
	fmt.Println("[LOG]", msg)
}
EOF

# Internal TUI
mkdir -p internal/tui
cat > internal/tui/console.go <<'EOF'
package tui

import "fmt"

// StartConsole startet ein einfaches TUI (Platzhalter)
func StartConsole() {
	fmt.Println("[TUI] Konsole gestartet")
}
EOF

# PKG
mkdir -p pkg/archive
cat > pkg/archive/archive.go <<'EOF'
package archive

import "fmt"

// Extract entpackt ein Archiv (Platzhalter)
func Extract(path string) {
	fmt.Printf("[ARCHIVE] Entpacke %s\n", path)
}
EOF

mkdir -p pkg/progress
cat > pkg/progress/progress.go <<'EOF'
package progress

import "fmt"

// Show zeigt einen Fortschrittsbalken (Platzhalter)
func Show() {
	fmt.Println("[PROGRESS] ########## 100%")
}
EOF

# Scripts
mkdir -p scripts
cat > scripts/prepare-rootfs.sh <<'EOF'
#!/usr/bin/env bash
echo "[SCRIPT] RootFS vorbereiten..."
EOF
chmod +x scripts/prepare-rootfs.sh

cat > scripts/build-docker.sh <<'EOF'
#!/usr/bin/env bash
echo "[SCRIPT] Docker-Build starten..."
EOF
chmod +x scripts/build-docker.sh

# Testdata
mkdir -p testdata
touch testdata/minimal-rootfs.tar.gz

echo "✅ Projektstruktur mit Default-Templates für $PROJECT erstellt!"
