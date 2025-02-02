# Activate pure theme
fpath+=$HOME/Documents/shell/pure
autoload -U promptinit && promptinit && prompt pure

# Prevents Pure from checking whether the current Git remote has been updated
PURE_GIT_PULL=0

# Change promt success color to green
zstyle :prompt:pure:prompt:success color green

# Share history in multiple zsh shell
setopt histignorealldups sharehistory

# Keybindings
bindkey -v

# History searching key binding
bindkey '^R' history-incremental-search-backward

# Improve history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# Browse history with Up and Down on keyboard. You can check your key bindings
# with Ctrl+v <key>.
# Possible bindng 1 for Up and Down
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
# Possible binding 2 for Up and Down
bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end

# Keep 5000 lines of history within the shell and save it to $HOME/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=$HOME/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Check if tmux sessions are available and list them
if command -v tmux &> /dev/null && [ ! -n "$TMUX" ]
then
  command tmux ls &> /dev/null; rc=$?
  if [ $rc -eq 0  ]
  then
    echo "\nAvailable tmux sessions:"
    tmux ls
  fi
fi

# less
alias lessn="less -N"

# ls
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'

# exa
alias e='exa -lh'
alias ea='exa -lhGauUm'
alias el='exa -lhG'

# fd-find
alias fd='fdfind'

# du
alias dus='du -hs'

# tmux
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# Environment variables
export PATH="~/anaconda3/bin/:$PATH"
export PATH="/usr/local/texlive/2024/bin/x86_64-linux/:$PATH"
export PATH="/opt/nvim-linux64/bin/:$PATH"
export PATH="/opt/paraview/bin/:$PATH"
export PATH="/opt/gmsh-4.13.1/bin/:$PATH"
export PATH="~/.local/share/yabridge/:$PATH"

# Set locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set editor
export EDITOR=/opt/nvim-linux64/bin/nvim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jonash/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jonash/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jonash/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jonash/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

