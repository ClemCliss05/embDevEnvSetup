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

echo ""
echo "Installing base packages..."
"$SCRIPT_DIR/packages/base.sh"

echo ""
echo "Installing Python environment..."
"$SCRIPT_DIR/packages/python.sh"

echo ""
echo "Installing embedded development tools..."
"$SCRIPT_DIR/packages/embedded.sh"

echo ""
echo "Installing VS Code..."
"$SCRIPT_DIR/packages/vscode.sh"

echo ""
echo "Installing Docker..."
"$SCRIPT_DIR/packages/docker.sh"

echo ""
echo "Installing network analysis tools..."
"$SCRIPT_DIR/packages/network.sh"

echo ""
echo "Development environment ready."