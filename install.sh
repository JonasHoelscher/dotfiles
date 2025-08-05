#!/usr/bin/sh

set -e

HOSTNAME=$(hostname -s)
DOTFILES_DIR="${HOME}/dotfiles"
SETUP_DIR="${DOTFILES_DIR}/setup"

echo "Installing dotfiles for $HOST"

# Function to symlink folder contents
link_contents() {
    local source_dir="$1"
    local type="$2"

    if [ ! -d "$source_dir" ]; then
        echo "Directory not found $source_dir"
        return [n]
    fi

    echo "Linking contents of $source_dir"

    find "$source_dir" -mindepth 1 -print0 | while IFS= read -r -d '' src; do
        rel_path="${src#$source_dir/}"

        # Get target path
        if [ "$type" = "home" ]; then
            target="$HOME/$relpath"
        elif [ "$type" = "config" ]; then
            target="$HOME/.config/$relpath"
        else
            echo "Unknown parameter $type"

        # Create folder if it does not exist
        mkdir -p "$(dirname "$target")"

        # Make symlink
        ln -sf "$src" "$target"
        echo " -> $target"
    done
}

# Folders for current hostname
common_home="$DOTFILES_DIR/home/common"
common_config="$DOTFILES_DIR/.config/common"
hostname_home="$DOTFILES_DIR/home/$HOSTNAME"
hostname_config="$DOTFILES_DIR/.config/$HOSTNAME"

# Link folder contents to base or config folder
link_contents common_home home
link_contents common_config config
link_contents hostname_home home
link_contents hostname_config config
