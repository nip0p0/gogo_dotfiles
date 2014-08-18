# basic
#export LANG=ja_JP.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
autoload -U compinit
compinit -u
autoload -U colors
colors

###################################################
# 以下oh-my-zsh

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miloshadzic"

source $ZSH/oh-my-zsh.sh
#oh-my-zsh終わり
################################

# z
. `brew --prefix`/etc/profile.d/z.sh

# Extend ls command
alias ls="ls -GAF"

# Emacsキーバインド
bindkey -e

# 履歴
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000
SAVEHIST=1000
export HISTIGNORE=ls:pwd

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加する
setopt append_history

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space

# シェルのプロセスごとに履歴を共有
setopt share_history

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store

# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完する
#setopt auto_menu

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups

# 8 ビット目を通すようになり、日本語のファイル名などを見れるようになる
setopt print_eightbit

# 色を使う
# setopt prompt_subst

# ビープ音を鳴らさないようにする
setopt NO_beep

# 補完で大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# cdd
if [ -f /usr/local/bin/cdd ]; then
  source /usr/local/bin/cdd
  chpwd() {
    _cdd_chpwd
  }
fi

# 環境ごと
[ -f ~/.zshrc.private ] && source ~/.zshrc.private


## バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
# RPROMPT="%1(v|%F{green}%1v%f|)"

export NODE_PATH=/usr/local/lib/node_modules

alias postgres='postgres -D /usr/local/var/postgres'
