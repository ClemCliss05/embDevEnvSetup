#!/usr/bin/env bash

set -euo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root:"
    echo "su -"
    echo "./install.sh"
    exit 1
fi

echo "Starting development environment installation"

./packages/base.sh
./packages/python.sh
./packages/embedded.sh
./packages/vscode.sh

echo "Development environment ready."