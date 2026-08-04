#!/usr/bin/env bash

set -euo pipefail

echo "Installing VS Code extensions..."

while read extension
do
    code --install-extension "$extension"
done < "$(dirname "$0")/../vscode/extensions.txt"

echo "VS Code extensions installed."