#!/bin/sh

# XDG Base Directory Specification - https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

. $XDG_CONFIG_HOME/.file/submodule.sh

. $XDG_CONFIG_HOME/.file/alias.sh
