if [[ "${OSTYPE}" == "darwin"* ]]; then
  export PATH=/usr/local/bin:${PATH}
  export PATH=/usr/local/sbin:${PATH}
  export PATH=/usr/local/opt/python/libexec/bin:${PATH}
  export PATH=${HOME}/bin:${PATH}
fi

# Variables
export PASSWORD_STORE_DIR=${HOME}/.local/password-store
export LESSHISTFILE=-

if (( $+commands[gpgconf] )); then
 export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# ZDOTDIR
ZDOTDIR=${HOME}/.local/share/zsh

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

# Aliases
alias gd='git diff'
alias wgd='watch --color git diff --color=always'
alias git-clean-merged='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

alias grml-update='grml-update-zsh; grml-update-vim'
alias grml-update-zsh='wget -O ${HOME}/.local/grml/grml.zsh http://grml.org/console/zshrc'
alias grml-update-vim='wget -O ${HOME}/.local/grml/grml.vim http://grml.org/console/vimrc'

alias whitefox-flash='echo Press fn+enter to flash board && sleep 10 && sudo dfu-util -D ${HOME}/.local/keyboard/whitefox/kiibohd.dfu.bin'

# Updates the GPG-Agent TTY before every command since SSH does not set it.
function _gpg-agent-update-tty {
  if (( $+commands[gpg-connect-agent] )) && [ -d ${HOME}/.gnupg ]; then
    gpg-connect-agent UPDATESTARTUPTTY /bye >/dev/null
  fi
}
add-zsh-hook preexec _gpg-agent-update-tty
