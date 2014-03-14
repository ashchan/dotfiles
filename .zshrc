set -o vi
bindkey "^R" history-incremental-search-backward
export CLICOLOR=1
export EDITOR=vim

export GOPATH=$HOME/.go
PATH=/usr/local/bin:/sbin:/usr/sbin:$PATH:$GOPATH/bin

setopt prompt_subst
autoload colors zsh/terminfo
colors

source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
PS1='%n@%m %{$fg[yellow]%}%~%{$reset_color%}%{$fg[red]%}$(__git_ps1 " (%s)")%{$reset_color%}\$ '

precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
eval "$(direnv hook $0)"

source ~/.zsh_aliases
