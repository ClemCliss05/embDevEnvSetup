#!/usr/bin/env bash

set -euo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo:"
    echo "sudo ./packages/docker.sh"
    exit 1
fi

TARGET_USER="${SUDO_USER:-}"

if [ -z "$TARGET_USER" ] || [ "$TARGET_USER" = "root" ]; then
    echo "Could not determine the normal user."
    echo "Run this script with sudo from your normal user."
    exit 1
fi

echo "Installing Docker for user: $TARGET_USER"
echo ""

echo "Installing Docker repository prerequisites..."

apt update

apt install -y \
    ca-certificates \
    curl

echo "Adding Docker GPG key..."

install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/debian/gpg \
    -o /etc/apt/keyrings/docker.asc

chmod a+r /etc/apt/keyrings/docker.asc

echo "Adding Docker repository..."

. /etc/os-release

echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    ${VERSION_CODENAME} stable" \
    > /etc/apt/sources.list.d/docker.list

echo "Updating package list..."

apt update

echo "Installing Docker Engine and plugins..."

apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

echo "Enabling Docker service..."

systemctl enable --now docker

echo "Adding $TARGET_USER to docker group..."

usermod -aG docker "$TARGET_USER"

echo ""
echo "Docker installation complete."
echo ""

docker --version
docker compose version

echo ""
echo "User '$TARGET_USER' was added to the docker group."
echo "Log out and log back in before using Docker without sudo."