#!/bin/zsh

# Get the directory of the current script
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
# echo ${SCRIPT_DIR}
# OS applications
source ${SCRIPT_DIR}/script/osx/homebrew.sh

# zsh plugins and tools
source ${SCRIPT_DIR}/script/zsh/plugin.zsh

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

