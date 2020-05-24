if [[ "${OSTYPE}" == "darwin"* ]]; then
  export PATH=/usr/local/bin:${PATH}
  export PATH=/usr/local/sbin:${PATH}
  export PATH=/usr/local/opt/python/libexec/bin:${PATH}
  export PATH=${HOME}/bin:${PATH}
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
  sudo scutil --set ComputerName book
  sudo scutil --set HostName book
fi

# Variables
export PASSWORD_STORE_DIR=${HOME}/.local/password-store
export LESSHISTFILE=-

if (( $+commands[gpgconf] )); then
 export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# ZDOTDIR
ZDOTDIR=${HOME}/.local/share/zsh

zstyle ':prompt:grml:right:setup' items ''
# GRML Config
source ${HOME}/.local/grml/grml.zsh

# Bindkeys
bindkey '\e[1;5C' forward-word            # C-Right
bindkey '\e[1;5D' backward-word           # C-Left
bindkey '\e[5~'   history-search-backward # PgUp
bindkey '\e[6~'   history-search-forward  # PgDn
bindkey '^[[3$'   delete-char             # Del

# History Config
HISTSIZE=100000
SAVEHIST=100000

# ZSH Completion
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${HOME}/.local/share/zsh/cache

# Misc
setopt auto_cd
setopt append_history share_history histignorealldups

# Aliases
alias gd='git diff'
alias wgd='watch --color git diff --color=always'
alias git-clean-merged='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias git-clean-all='git for-each-ref --format "%(refname:short)" refs/heads | grep -v master | xargs git branch -D'
alias git-pull-recursive='find ~/dev -type d -maxdepth 1 -mindepth 1 -exec git --git-dir={}/.git --work-tree={} checkout master \; -exec git --git-dir={}/.git --work-tree={} pull origin master \;'
alias git-who-owns='git ls-files | while read f; do git blame --line-porcelain $f | grep "^author "; done | sort -f | uniq -ic | sort -n'

alias grml-update='wget -O ${HOME}/.local/grml/grml.zsh http://grml.org/console/zshrc'

alias flash-whitefox='echo Press fn+enter to flash board && sleep 10 && sudo dfu-util -D ${HOME}/.local/keyboard/whitefox/keymap.bin'
alias flash-filco='echo Press fn+enter to flash board && sleep 10 && sudo dfu-util -D ${HOME}/.local/keyboard/filco-osx/keymap.hex'

alias pass='gopass'
alias ls='exa'
alias vim='nvim'
alias vi='nvim'
alias svim='nvim -u ~/.SpaceVim/vimrc'
alias snvim='svim'

# Updates the GPG-Agent TTY before every command since SSH does not set it.
function _gpg-agent-update-tty {
  if (( $+commands[gpg-connect-agent] )) && [ -d ${HOME}/.gnupg ]; then
    gpg-connect-agent UPDATESTARTUPTTY /bye >/dev/null
  fi
}
add-zsh-hook preexec _gpg-agent-update-tty
