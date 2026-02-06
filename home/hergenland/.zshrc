# Load common file
source "$HOME/dotfiles/home/common/.zshrc"

# Uni aliases
alias plutho-activate=". /opt/anaconda/bin/activate; conda activate ~/scratch/plutho-env"
alias anaconda-activate="[ -f /opt/anaconda/bin/activate ] && . /opt/anaconda/bin/activate && path+=('/upb/users/m/'$USER'/profiles/unix/emt/.local/bin')"

# Setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add to path
export PATH=$PATH:$HOME/.local/bin

# Add PETSc variables
export PETSC_DIR=$HOME/Documents/utils/petsc
export PETSC_ARCH=arch-linux-c-real-debug
export PKG_CONFIG_PATH=$PETSC_DIR/$PETSC_ARCH/lib/pkgconfig:$PKG_CONFIG_PATH
export PINCIC_BUILD_DIR=build/hergenland

export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
export QT_QPA_PLATFORM="xcb"
