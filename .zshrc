ZSH=$HOME/.oh-my-zsh

ZSH_THEME="flazz"

COMPLETION_WAITING_DOTS="true"

plugins=(vi-mode)

source $ZSH/oh-my-zsh.sh

. ~/.nvm/nvm.sh

set -o vi
bindkey "^R" history-incremental-search-backward
export EDITOR=vim

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
export AWS_ELB_HOME="/usr/local/Library/LinkedKegs/elb-tools/jars"
export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com

export GOROOT="/usr/local/Cellar/go/1.0.3"
