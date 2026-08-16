#!/usr/bin/env bash

set -euo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo:"
    echo "sudo ./packages/embedded.sh"
    exit 1
fi

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
