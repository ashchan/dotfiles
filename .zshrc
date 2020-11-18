autoload -Uz colors ; colors
export EDITOR=vim
export LC_ALL=en_US.UTF-8
set -o vi

bindkey -v
bindkey '^R' history-incremental-search-backward

source ~/.zsh/zsh-git-prompt/zshrc.sh # https://github.com/olivierverdier/zsh-git-prompt
PROMPT='%F{red}%B%m %F{cyan}%~%b$(git_super_status) \$ '

export DIRENV_LOG_FORMAT=""
eval "$(direnv hook $SHELL)"

autoload -Uz compinit && compinit

if [ -s ~/.aliases ] ; then source ~/.aliases ; fi
if [ -s ~/.exports ] ; then source ~/.exports ; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/Projects/flutter/bin:$HOME/Projects/flutter/bin/cache/dart-sdk/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"

. /usr/local/opt/asdf/asdf.sh

typeset -aU path

function chpwd {
  printf '\e]7;%s\a' "file://$HOSTNAME${PWD// /%20}"
}
chpwd
