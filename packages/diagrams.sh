
#!/usr/bin/env bash
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script with sudo:"
    echo "sudo ./packages/diagrams.sh"
    exit 1
fi

if [ "$(dpkg --print-architecture)" != "amd64" ]; then
    echo "This installer currently supports amd64 only."
    exit 1
fi

echo "Installing draw.io Desktop..."

apt-get update

TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_DIR"' EXIT

API_URL="https://api.github.com/repos/jgraph/drawio-desktop/releases/latest"

DEB_URL="$(
    curl -fsSL "$API_URL" |
    jq -er '
        [.assets[]
        | select(.name | test("^drawio-amd64-[0-9].*\\.deb$"))
        | .browser_download_url]
        | first
    '
)"

DEB_FILE="$TEMP_DIR/drawio.deb"

curl -fL "$DEB_URL" -o "$DEB_FILE"

apt-get install -y "$DEB_FILE"

echo "draw.io Desktop installation complete."

