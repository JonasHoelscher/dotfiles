# Load common file
source "$HOME/dotfiles/home/common/.zshrc"

# Aliases
# alias ff="fzf"
# alias cd="z"
# alias ls="exa -lh"
#
# Settings for ltex
export JAVA_TOOL_OPTIONS="-Djdk.xml.totalEntitySizeLimit=0"

# Settings for pkg-config
export PKG_CONFIG_PATH="$HOME/utils/glfw-3.4/src:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="$HOME/utils/freetype-2.14.2/build:$PKG_CONFIG_PATH"
