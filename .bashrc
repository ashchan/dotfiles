export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
export AWS_ELB_HOME="/usr/local/Library/LinkedKegs/elb-tools/jars"
export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com

export GOROOT="/usr/local/Cellar/go/1.0.3"

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\w$(__git_ps1 " (%s)")$ '

export CLICOLOR=1
export EDITOR=vim

if [ -s ~/.bash_aliases ] ; then source ~/.bash_aliases ; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

. ~/.nvm/nvm.sh

set -o vi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
