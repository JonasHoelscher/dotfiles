# Load common file
source "$HOME/dotfiles/home/common/.zshrc"

# Enavle completion for pipx
eval "$(register-python-argcomplete pipx)"
#
# Aliases
alias ff="fzf"
alias cd="z"
alias ls="exa -lh"

# Environment variables
export PKG_CONFIG_PATH=$HOME/Documents/utils/petsc/arch-linux-c-debug/lib/pkgconfig:$PKG_CONFIG_PATH
export PETSC_DIR=$HOME/Documents/utils/petsc/
export PETSC_ARCH=arch-linux-c-debug

eval "$(zoxide init zsh)"
rm ~/.zcompdump*; compinit

# Created by `pipx` on 2025-12-12 20:11:26
export PATH="$PATH:/home/jonas/.local/bin"
