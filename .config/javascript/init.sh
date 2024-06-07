#!/bin/sh

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export DVM_DIR="$HOME/.dvm"
export DVM_BIN_PATH="$DVM_DIR/bin"

export PATH="$DVM_BIN_PATH:$PATH"
