
#!/usr/bin/env bash

set -euo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo:"
    echo "sudo ./packages/security.sh"
    exit 1
fi

echo "Installing Linux security development tools..."

apt update

apt install -y \
    auditd \
    audispd-plugins \
    bpftrace \
    bpftool \
    clang \
    llvm \
    libbpf-dev \
    libelf-dev \
    zlib1g-dev \
    pkg-config

echo ""
echo "Linux security tools installed."
