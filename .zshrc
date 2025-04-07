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

export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

typeset -aU path

function chpwd {
  printf '\e]7;%s\a' "file://$HOSTNAME${PWD// /%20}"
}
chpwd

# bun completions
[ -s "/Users/akira/.bun/_bun" ] && source "/Users/akira/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
