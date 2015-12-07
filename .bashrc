export GOPATH=$HOME/Projects/go
PATH=/usr/local/sbin:$PATH:$GOPATH/bin

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\w$(__git_ps1 " (%s)")$ '

export CLICOLOR=1
export EDITOR=vim

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
export DIRENV_LOG_FORMAT=""
eval "$(direnv hook $0)"

if [ -s ~/.aliases ] ; then source ~/.aliases ; fi
if [ -s ~/.exports ] ; then source ~/.exports ; fi

set -o vi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
