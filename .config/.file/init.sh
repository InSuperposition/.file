#!/bin/sh

# XDG Base Directory Specification - https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# XDG_RUNTIME_DIR - https://wiki.gentoo.org/wiki/XDG/Base_Directories
if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime"
    [ ! -d "$XDG_RUNTIME_DIR" ] && mkdir -m 0700 "$XDG_RUNTIME_DIR"
fi

LOCAL_BIN_HOME=$HOME/.local/bin

export PATH="$PATH:$LOCAL_BIN_HOME"

export EDITOR=hx
export VISUAL=code

# Load tool-specific configurations
. $HOME/.lmstudio/init.sh

. $XDG_CONFIG_HOME/cargo/init.sh
. $XDG_CONFIG_HOME/gnupg/init.sh
. $XDG_CONFIG_HOME/homebrew/init.sh
. $XDG_CONFIG_HOME/kaggle/init.sh
. $XDG_CONFIG_HOME/mise/init.sh
. $XDG_CONFIG_HOME/rustup/init.sh
. $XDG_CONFIG_HOME/ssh/init.sh
. $XDG_CONFIG_HOME/starship/init.sh
. $XDG_CONFIG_HOME/zellij/init.sh
. $XDG_CONFIG_HOME/zig/init.sh

# Load user-specific aliases
. $XDG_CONFIG_HOME/.file/alias.sh
