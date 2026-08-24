#!/usr/bin/env bash

set -euo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo:"
    echo "sudo ./tools/codeql/codeql.sh"
    exit 1
fi

CODEQL_VERSION="2.26.3"
INSTALL_DIR="/opt/codeql"
TMP_DIR="/tmp/codeql-install"

echo "Installing CodeQL CLI ${CODEQL_VERSION}..."

rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

cd "$TMP_DIR"

wget -q \
    "https://github.com/github/codeql-cli-binaries/releases/download/v${CODEQL_VERSION}/codeql-linux64.zip" \
    -O codeql.zip

rm -rf "$INSTALL_DIR"

unzip -q codeql.zip

mv codeql "$INSTALL_DIR"

ln -sf "$INSTALL_DIR/codeql" /usr/local/bin/codeql

echo "CodeQL installed:"
codeql --version