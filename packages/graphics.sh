#!/usr/bin/env bash
set -euo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo:"
    echo "sudo ./packages/graphics.sh"
    exit 1
fi

echo "Installing graphics tools..."

apt update
apt install -y inkscape

echo "Graphics tools ready."