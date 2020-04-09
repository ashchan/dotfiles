autoload -Uz colors ; colors
export EDITOR=vim
export LC_ALL=en_US.UTF-8
set -o vi

source ~/.zsh/zsh-git-prompt/zshrc.sh # https://github.com/olivierverdier/zsh-git-prompt
PROMPT='%F{red}%B%m %F{cyan}%~%b$(git_super_status) \$ '

export DIRENV_LOG_FORMAT=""
eval "$(direnv hook $SHELL)"

autoload -Uz compinit && compinit

. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

if [ -s ~/.aliases ] ; then source ~/.aliases ; fi
if [ -s ~/.exports ] ; then source ~/.exports ; fi

export GOPATH=$HOME/Projects/go
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

function chpwd {
  printf '\e]7;%s\a' "file://$HOSTNAME${PWD// /%20}"
}
chpwd
