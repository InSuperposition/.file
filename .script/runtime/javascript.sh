#!/bin/sh

# Check if fnm is available
if command -v fnm >/dev/null 2>&1; then
  # Initialize Fast Node Manager (fnm)
  eval "$(fnm env --use-on-cd)"
else
  echo "fnm not found. Please install it to continue."
fi
# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export DVM_DIR="$HOME/.dvm"
export DVM_BIN_PATH="$DVM_DIR/bin"

export PATH="$DVM_BIN_PATH:$PATH"
