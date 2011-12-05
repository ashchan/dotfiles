export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.4.4.1/jars"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
export AWS_ELB_HOME="/usr/local/Cellar/elb-tools/1.0.15.1/jars"
export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com

source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\h:\w$(__git_ps1 " (%s)") \u$ '
export CLICOLOR=1

if [ -s ~/.bash_aliases ] ; then source ~/.bash_aliases ; fi

if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

function svim()
{
  (rvm system; unset GEM_PATH GEM_HOME; command mvim "$@")
}

