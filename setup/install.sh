#!/usr/bin/sh

set -e

HOSTNAME=$(hostname -s)
DOTFILES_DIR="${HOME}/dotfiles"
SETUP_DIR="${DOTFILES_DIR}/setup"

echo "Installing dotfiles for $HOST"

# Function to symlink folder contents
link_contents() {
    local source_dir="$1"
    echo "Linking contents of $source_dir"

    find "$source_dir" -mindepth 1 -print0 | while IFS= read -r -d '' src; do
        rel_path="${src#$source_dir/}"
        target="$HOME/$rel_path"

        mkdir -p "$(dirname "$target")"

        ln -sf "$src" "$target"
        echo " -> $target"
    done
}

# Get folders
for dir in "$SETUP_DIR"/*; do
    if [ ! -d "$dir" ]; then
        continue
    fi

    folder_name=$(basename "$dir")
    if [[ "$folder_name" == "common" || "$folder_name" == "$HOSTNAME" ]]; then
        link_contents "$dir"
    fi
done
