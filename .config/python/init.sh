#!/bin/sh

# Set PYENV_ROOT
export PYENV_ROOT="$HOME/.pyenv"

# Check if $PYENV_ROOT/bin exists and if so, add it to the PATH
if [ -d "$PYENV_ROOT/bin" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
fi
