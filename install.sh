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
        return
    fi

    echo "Linking contents of $source_dir"

    find "$source_dir" -mindepth 1 -maxdepth 1 \( -type f -o -type d -o -type l \)| while IFS= read -r src; do
        rel_path="${src#$source_dir/}"

        # Get target path
        if [ "$type" = "home" ]; then
            target="$HOME/$rel_path"
        elif [ "$type" = "config" ]; then
            target="$HOME/.config/$rel_path"
        else
            echo "Unknown parameter $type"
            return
        fi

        # Create folder if it does not exist
        mkdir -p "$(dirname "$target")"

        # If the target already exists and is not a symlink, remove it
        if [ -e "$target" ] && [ ! -L "$target" ]; then
            echo "Removing existing folder $target"
            rm -rf "$target"
        fi

        # Make symlink
        ln -sf "$src" "$target"
        echo "$target -> $src"
    done
}

# Folders for current hostname
common_home="$DOTFILES_DIR/home/common"
hostname_home="$DOTFILES_DIR/home/$HOSTNAME"
common_config="$DOTFILES_DIR/.config/common"
hostname_config="$DOTFILES_DIR/.config/$HOSTNAME"

# Link folder contents to base or config folder
link_contents $common_home "home"
link_contents $hostname_home "home"
link_contents $common_config "config"
link_contents $hostname_config "config"
