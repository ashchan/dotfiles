export CLICOLOR=1
export EDITOR=vim
set -o vi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\w$(__git_ps1 " (%s)")$ '

export DIRENV_LOG_FORMAT=""
eval "$(direnv hook $0)"

if [ -s ~/.aliases ] ; then source ~/.aliases ; fi
if [ -s ~/.exports ] ; then source ~/.exports ; fi

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

export GOPATH=$HOME/Projects/go
export PATH="$PATH:$GOPATH/bin"

export PATH="/usr/local/opt/riscv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
