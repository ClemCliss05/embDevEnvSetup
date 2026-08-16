#!/usr/bin/env bash

set -euo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo:"
    echo "sudo ./packages/network.sh"
    exit 1
fi

TARGET_USER="${SUDO_USER:-}"

if [ -z "$TARGET_USER" ] || [ "$TARGET_USER" = "root" ]; then
    echo "Could not determine the normal user."
    echo "Run this script with sudo from your normal user."
    exit 1
fi

echo "Installing network analysis tools for user: $TARGET_USER"
echo ""

apt update

apt install -y \
    wireshark \
    tshark

echo ""
echo "Adding $TARGET_USER to the wireshark group..."

usermod -aG wireshark "$TARGET_USER"

echo ""
echo "Network analysis tools installed."
echo ""

wireshark --version | head -n 1
tshark --version | head -n 1

echo ""
echo "User '$TARGET_USER' was added to the wireshark group."
echo "Log out and log back in before capturing traffic without sudo."