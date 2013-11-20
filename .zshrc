. ~/.nvm/nvm.sh

set -o vi
bindkey "^R" history-incremental-search-backward
export CLICOLOR=1
export EDITOR=vim

export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
export AWS_ELB_HOME="/usr/local/Library/LinkedKegs/elb-tools/jars"
export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com

export GOPATH=$HOME/.go
PATH=/usr/local/bin:/usr/local/sbin:/sbin/:$PATH:$GOPATH/bin

setopt prompt_subst
autoload colors zsh/terminfo
colors

source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
PS1='%n@%m %{$fg[yellow]%}%~%{$reset_color%}%{$fg[red]%}$(__git_ps1 " (%s)")%{$reset_color%}\$ '

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
