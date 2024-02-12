eval "$(starship init zsh)"

# environment managers

# pyenv
if command -v pyenv >/dev/null 2>&1; then
# Initialize pyenv
  eval "$(pyenv init -)"
else
  echo "pyenv is not installed."
fi

# fnm
if command -v fnm >/dev/null 2>&1; then
# Initialize pyenv
  eval "$(fnm env --use-on-cd)"
else
  echo "fnm is not installed."
fi

# OS applications
. .script/osx/homebrew.sh

# zsh plugins and tools
. .script/zsh/plugin.zsh
