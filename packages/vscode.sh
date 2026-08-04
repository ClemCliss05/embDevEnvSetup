#!/usr/bin/env bash

set -euo pipefail

echo "Installing VS Code..."

apt update

apt install -y \
    wget \
    gpg \
    apt-transport-https

wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    > /usr/share/keyrings/microsoft.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
    > /etc/apt/sources.list.d/vscode.list

apt update

apt install -y code

echo "VS Code installed."
echo "Run this as your normal user:"
echo ""
echo "./scripts/install-vscode-extensions.sh"