#!/usr/bin/env bash

set -euo pipefail

echo "Updating package list..."
apt update

echo "Installing base development packages..."

apt install -y \
    git \
    vim \
    gcc \
    g++ \
    make \
    cmake \
    ninja-build \
    gdb \
    python3 \
    python3-pip \
    python3-venv \
    curl \
    wget \
    unzip \
    zip \
    tree \
    jq \
    ripgrep \
    fd-find \
    tmux \
    htop \
    btop

echo "Done."