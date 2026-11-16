
#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXTENSIONS_FILE="$SCRIPT_DIR/../vscode/extensions.txt"

echo "Installing VS Code extensions..."
echo ""

FAILED_EXTENSIONS=()

while IFS= read -r extension || [ -n "$extension" ]
do
    [[ -z "$extension" || "$extension" == \#* ]] && continue

    echo "Installing: $extension"

    if ! code --install-extension "$extension"; then
        FAILED_EXTENSIONS+=("$extension")
    fi

    echo ""
done < "$EXTENSIONS_FILE"

if [ ${#FAILED_EXTENSIONS[@]} -gt 0 ]; then
    echo "Some extensions could not be installed:"

    printf ' - %s\n' "${FAILED_EXTENSIONS[@]}"

    exit 1
fi

echo "All VS Code extensions installed successfully."
