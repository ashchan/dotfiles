export GOPATH=$HOME/Projects/go
export PATH="/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$PATH"
PATH=$GEM_HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH:$GOPATH/bin

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\w$(__git_ps1 " (%s)")$ '

export CLICOLOR=1
export EDITOR=vim

if [ -s ~/.aliases ] ; then source ~/.aliases ; fi
if [ -s ~/.exports ] ; then source ~/.exports ; fi

set -o vi
