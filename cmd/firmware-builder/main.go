package main

import (
	"fmt"

	"github.com/PhysicusPrime/infinitysystemz/internal/build"
)

func main() {
	fmt.Println("Firmware-Builder gestartet 🚀")
	build.SetupToolchain()
	build.BuildBusybox()
	build.BuildRootfs()
}
