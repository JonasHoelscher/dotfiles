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


# Enable common config
[ -f $HOME/.$dotfilepath/config-common ] && source $HOME/.$dotfilepath/config-common && echo "Enabled config-common"

case $(hostname) in
  larspc) [ -f $HOME/.$dotfilepath/config-home ] && source $HOME/.$dotfilepath/config-home && echo "Enabled config-home";;
  larslap) [ -f $HOME/.$dotfilepath/config-home ] && source $HOME/.$dotfilepath/config-home && echo "Enabled config-home";;
  nas1) ;;
  *) [ $USER = 'meihost' ] && [ -f $HOME/.$dotfilepath/config-uni ] && source $HOME/.$dotfilepath/config-uni && echo "Enabled config-uni";;
esac

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

# Git aliases
alias g=git
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gclean='git clean -fd'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'
alias gcsm='git commit -s -m'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias ggpull='git pull origin $(git_current_branch)'
alias ggpur=ggu
alias ggpush='git push origin $(git_current_branch)'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias ghh='git help'
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gk='\gitk --all --branches'
alias gke='\gitk --all $(git log -g --pretty=%h)'
alias gl='git pull'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias globurl='noglob urlglobber '
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --all'
alias glp=_git_log_prettily
alias glum='git pull upstream master'
alias gm='git merge'
alias gmom='git merge origin/master'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/master'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpoat='git push origin --all && git push origin --tags'
alias gpristine='git reset --hard && git clean -dfx'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpu='git push upstream'
alias gpv='git push -v'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grbs='git rebase --skip'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash save'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gsu='git submodule update'
alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'

# Others
alias sc='systemctl'
alias jc='journalctl'
alias afind='ack -il'
alias d='dirs -v | head -10'
alias isotimestring='date +"%Y-%m-%dT%H:%M:%S"'
alias timestring='date +"%Y-%m-%dT%H%M%S"'
alias latex-clean-dir='rm *.fdb_* *.aux *.fls *.log *.out *.synctex.gz'

# Greps
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias grepc='grep --include=\*.c --include=\*.h -rn'
alias greppy='grep --include=\*.py -rn'

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

# Uni aliases
alias anaconda-activate="[ -f /opt/anaconda/bin/activate ] && . /opt/anaconda/bin/activate && path+=('/upb/users/m/'$USER'/profiles/unix/emt/.local/bin')"
alias krb5-keep-session-open='k5start -f /upb/users/m/meihost/profiles/unix/emt/Documents/meihost.krb5.keytab -U -K 10 -l 8h -p /tmp/k5start_meihost.pid -k /tmp/krb5cc_meihost -v'
