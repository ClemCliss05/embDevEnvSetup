#!/usr/bin/env bash

set -euo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo:"
    echo "sudo ./packages/python.sh"
    exit 1
fi

echo "Installing Python development environment..."

apt update

apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev

echo "Python ready."