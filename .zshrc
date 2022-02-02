autoload -Uz colors ; colors
export EDITOR=vim
export LC_ALL=en_US.UTF-8
set -o vi

bindkey -v
bindkey '^R' history-incremental-search-backward

source ~/.zsh/zsh-git-prompt/zshrc.sh # https://github.com/zsh-git-prompt/zsh-git-prompt.git
PROMPT='%F{red}%B%m %F{cyan}%~%b$(git_super_status) \$ '

autoload -Uz compinit && compinit

if [ -s ~/.aliases ] ; then source ~/.aliases ; fi
if [ -s ~/.exports ] ; then source ~/.exports ; fi

export PATH=/usr/local/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"

typeset -aU path

function chpwd {
  printf '\e]7;%s\a' "file://$HOSTNAME${PWD// /%20}"
}
chpwd
