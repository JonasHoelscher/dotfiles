# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# Added by Toolbox App
export PATH="/usr/local/texlive/2024/bin/x86_64-linux/:$PATH"

# Other environment variables
export PATH="~/anaconda3/bin/:$PATH"
export PATH="/usr/local/texlive/2024/bin/x86_64-linux/:$PATH"
export PATH="/opt/nvim-linux64/bin/:$PATH"
export PATH="/opt/gmsh-4.13.1/bin/:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set locale
export LANGUAGE="en_US.UTF-8"
export LC_TIME="de_DE.UTF-8"
export LC_MONETARY="de_DE.UTF-8"
export LC_ADDRESS="de_DE.UTF-8"
export LC_TELEPHONE="de_DE.UTF-8"
export LC_NAME="de_DE.UTF-8"
export LC_MEASUREMENT="de_DE.UTF-8"
export LC_IDENTIFICATION="de_DE.UTF-8"
export LC_NUMERIC="de_DE.UTF-8"
export LC_PAPER="de_DE.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL=en_US.UTF-8

# Set editor
export EDITOR=/opt/nvim-linux64/bin/nvim

. "$HOME/.cargo/env"

export QT_QPA_PLATFORMTHEME=gtk2
# export QT_STYLE_OVERRIDE=kvantum

# Use latest node and npm
nvm use --lts

