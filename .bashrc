export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.2.3/jars"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
export AWS_ELB_HOME="/usr/local/Cellar/elb-tools/1.0.15.1/jars"
export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com
export MITSCHEME_LIBRARY_PATH="/Applications/MIT\:GNU\ Scheme.app/Contents/Resources/"
export GOROOT="/usr/local/Cellar/go/1.0.3"

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\w$(__git_ps1 " (%s)")$ '
export CLICOLOR=1
export EDITOR=vim

if [ -s ~/.bash_aliases ] ; then source ~/.bash_aliases ; fi

if [ -s ~/.cundle/cundle.sh ] ; then source ~/.cundle/cundle.sh ; fi

. ~/.nvm/nvm.sh

set -o vi

export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
