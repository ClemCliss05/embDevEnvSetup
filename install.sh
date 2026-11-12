#!/usr/bin/env bash

set -euo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo:"
    echo "sudo ./install.sh"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting development environment installation"
echo ""

"$SCRIPT_DIR/packages/base.sh"

"$SCRIPT_DIR/packages/python.sh"

"$SCRIPT_DIR/packages/embedded.sh"

"$SCRIPT_DIR/packages/vscode.sh"

"$SCRIPT_DIR/packages/docker.sh"

"$SCRIPT_DIR/packages/network.sh"

echo ""
echo "Development environment ready."