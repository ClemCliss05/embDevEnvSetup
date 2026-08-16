#!/usr/bin/env bash

set -euo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo:"
    echo "sudo ./packages/base.sh"
    exit 1
fi

echo "Installing base development packages..."

apt update

apt install -y \
    git \
    vim \
    gcc \
    g++ \
    make \
    cmake \
    ninja-build \
    gdb \
    curl \
    wget \
    unzip \
    zip \
    tree \
    jq \
    ripgrep \
    fd-find \
    tmux \
    btop

echo "Done."