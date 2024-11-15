if [ -f ~/.zshrc ]; then
  source ~/.zshrc
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

source <(pkgx --shellcode)  #docs.pkgx.sh/shellcode
