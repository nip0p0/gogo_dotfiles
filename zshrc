[ -f ~/.zshrc.private ] && source ~/.zshrc.private
[ -f ~/.zshrc.general ] && source ~/.zshrc.general
[ -f ~/.zshrc.aliases ] && source ~/.zshrc.aliases

# Basis
#export LANG=ja_JP.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Complement command and its options
autoload -Uz compinit
compinit

# oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"
source $ZSH/oh-my-zsh.sh

# History
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000
SAVEHIST=1000
export HISTIGNORE=ls:pwd
setopt append_history
setopt hist_ignore_dups
setopt share_history
setopt hist_no_store
setopt hist_verify

# Emacs key bind
bindkey -e

setopt NO_beep

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
export GOPATH=/Users/gogo/go
export PATH=$PATH:$GOPATH/bin
