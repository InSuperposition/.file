#!/bin/sh

# Set PYENV_ROOT
export PYENV_ROOT="$HOME/.pyenv"

# Check if $PYENV_ROOT/bin exists and if so, add it to the PATH
if [ -d "$PYENV_ROOT/bin" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

# Check if pyenv exists
if command -v pyenv >/dev/null 2>&1; then
# Initialize pyenv
  eval "$(pyenv init -)"
else
  echo "pyenv is not installed."
fi
