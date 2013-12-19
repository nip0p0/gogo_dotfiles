# basic
export LANG=ja_JP.UTF-8
autoload -U compinit
compinit -u
autoload -U colors
colors

###################################################
# 以下oh-my-zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

source $ZSH/oh-my-zsh.sh
#oh-my-zsh終わり
################################


# ｢^｣キーを押すと, どんどん上のディレクトリーに動く
# ｢^｣自体を打ちたい時はctrl-Vの後に^
function cdup() {
  echo
  cd ..
  zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup

# Emacsキーバインド
bindkey -e

# 履歴
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000
SAVEHIST=1000

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
setopt prompt_subst

# ビープ音を鳴らさないようにする
setopt NO_beep

# 補完で大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Colorize
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# java
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

# rbenv
export PATH=$HOME/.rbenv/shims:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"
alias be='bundle exec'

# nodenv
export PATH=$HOME/.nodebrew/current/bin:$PATH

# myqsl
# export PATH=/usr/local/mysql-5.5/bin:$PATH
export PATH=/usr/local/mysql-5.5/support-files:$PATH

# redis
export PATH=/usr/local/redis-2.6/bin:$PATH

# mongodb
export PATH=/usr/local/mongodb-2.4/bin:$PATH

# phantomjs
export PATH=/usr/local/phantomjs/bin:$PATH

# screen
if [ $TERM = "screen" ]; then
  preexec() {
    echo -ne "\ek$1\e\\"
  }
fi

# cdd
if [ -f /usr/local/bin/cdd ]; then
  source /usr/local/bin/cdd
  chpwd() {
    _cdd_chpwd
  }
fi

# 環境ごと
[ -f ~/.zshrc.private ] && source ~/.zshrc.private


## git
#autoload -Uz vcs_info

## バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
# RPROMPT="%1(v|%F{green}%1v%f|)"

## プロンプト表示形式
#PROMPT="%n%% "

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
# zstyle ':vcs_info:*' formats '[%b]'
# zstyle ':vcs_info:*' actionformats '[%b|%a]'
#precmd () {
#  if [ $TERM = "screen" ]; then
#    echo -ne "\ek$(basename $SHELL)\e\\"
#  fi
#  psvar=()
#  LANG=ja_JP.UTF-8 vcs_info
#  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
#}

