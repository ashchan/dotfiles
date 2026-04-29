autoload -Uz colors ; colors
export EDITOR=nvim
export LC_ALL=en_US.UTF-8
set -o vi

bindkey -v
bindkey '^R' history-incremental-search-backward

source ~/.zsh/zsh-git-prompt/zshrc.sh # https://github.com/zsh-git-prompt/zsh-git-prompt.git
PROMPT='%F{red}%B%m %F{cyan}%~%b$(git_super_status) \$ '

autoload -Uz compinit && compinit

if [ -s ~/.aliases ]; then source ~/.aliases; fi
if [ -s ~/.exports ]; then source ~/.exports; fi
if [ -s ~/.private-exports ]; then source ~/.private-exports; fi

if command -v brew >/dev/null 2>&1; then
  path=("$(brew --prefix ruby)/bin" $path)
fi
path=("$HOME/.local/bin" $path)

function chpwd {
  printf '\e]7;%s\a' "file://$HOSTNAME${PWD// /%20}"
}
chpwd

export BUN_INSTALL="$HOME/.bun"
path=("$BUN_INSTALL/bin" $path)
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

typeset -aU path
