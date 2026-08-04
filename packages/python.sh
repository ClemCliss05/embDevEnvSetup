#!/usr/bin/env bash

set -euo pipefail

echo "Installing Python development environment..."

apt update

apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev

echo "Python ready."