#!/bin/sh

# XDG Base Directory Specification - https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export PATH="$PATH:$HOME/.local/bin"

# XDG_RUNTIME_DIR - https://wiki.gentoo.org/wiki/XDG/Base_Directories
if [ -z "${XDG_RUNTIME_DIR}" ]; then
	export XDG_RUNTIME_DIR="/tmp/${UID}-runtime-dir/"
	if [ ! -d "${XDG_RUNTIME_DIR}" ]; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

. $XDG_CONFIG_HOME/.file/submodule.sh

. $XDG_CONFIG_HOME/.file/alias.sh
