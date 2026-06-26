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

# Set matplotlib backend
export MPLBACKEND="QtAgg"

# Latex paths
export PATH="/usr/local/texlive/2026/bin/x86_64-linux:$PATH"
export MANPATH="/usr/local/texlive/2026/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2026/texmf-dist/doc/info:$INFOPATH"

# Rust
. $HOME/.cargo/env
