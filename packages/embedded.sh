#!/usr/bin/env bash

set -euo pipefail

echo "Installing embedded development tools..."

apt update

apt install -y \
    gcc-arm-none-eabi \
    binutils-arm-none-eabi \
    gdb-multiarch \
    openocd \
    picocom \
    usbutils \
    udev

echo "Embedded tools installed."
