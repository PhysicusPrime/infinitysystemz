.PHONY: build run

build:
	go build -o bin/firmware-builder ./cmd/firmware-builder

run:
	go run ./cmd/firmware-builder
