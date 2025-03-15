if [ -f ~/.zshrc ]; then
  source ~/.zshrc
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source <(pkgx --shellcode)  #docs.pkgx.sh/shellcode
