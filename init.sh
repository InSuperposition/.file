#!/bin/sh

# XDG Base Directory Specification - https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

LOCAL_BIN_HOME=$HOME/.local/bin

export PATH="$PATH:$LOCAL_BIN_HOME"

# XDG_RUNTIME_DIR - https://wiki.gentoo.org/wiki/XDG/Base_Directories
if [ -z "${XDG_RUNTIME_DIR}" ]; then
	export XDG_RUNTIME_DIR="/tmp/${UID}-runtime-dir/"
	if [ ! -d "${XDG_RUNTIME_DIR}" ]; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

# Load user-specific configurations
. $XDG_CONFIG_HOME/cargo/init.sh
. $XDG_CONFIG_HOME/gnugpg/init.sh
. $XDG_CONFIG_HOME/homebrew/init.sh
. $XDG_CONFIG_HOME/kaggle/init.sh
. $XDG_CONFIG_HOME/mise/init.sh
. $XDG_CONFIG_HOME/rustup/init.sh
. $XDG_CONFIG_HOME/starship/init.sh

# Load user-specific aliases
. $HOME/.file/alias.sh
