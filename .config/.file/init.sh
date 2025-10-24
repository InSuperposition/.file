#!/bin/sh

LOCAL_BIN_HOME=$HOME/.local/bin

export PATH="$PATH:$LOCAL_BIN_HOME"

export EDITOR=hx
export VISUAL=code

# Load tool-specific configurations
. $XDG_CONFIG_HOME/cargo/init.sh
. $XDG_CONFIG_HOME/gnugpg/init.sh
. $XDG_CONFIG_HOME/homebrew/init.sh
. $XDG_CONFIG_HOME/kaggle/init.sh
. $XDG_CONFIG_HOME/mise/init.sh
. $XDG_CONFIG_HOME/rustup/init.sh
. $XDG_CONFIG_HOME/starship/init.sh
. $XDG_CONFIG_HOME/zellij/init.sh

# Load user-specific aliases
. $XDG_CONFIG_HOME/.file/alias.sh
