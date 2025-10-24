#!/bin/zsh

# XDG Base Directory Specification - https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# XDG_RUNTIME_DIR - https://wiki.gentoo.org/wiki/XDG/Base_Directories
if [ -z "${XDG_RUNTIME_DIR}" ]; then
	export XDG_RUNTIME_DIR="/tmp/${UID}-runtime-dir/"
	if [ ! -d "${XDG_RUNTIME_DIR}" ]; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

source $XDG_CONFIG_HOME/.file/init.sh

export HISTFILE=$XDG_STATE_HOME/zsh/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS


[[ ! -d "$XDG_DATA_HOME/zsh/completions" ]] && mkdir -p "$XDG_DATA_HOME/zsh/completions"
[[ ! -d "$XDG_CACHE_HOME/zsh" ]] && mkdir -p "$XDG_CACHE_HOME/zsh"

typeset -U fpath  # Remove duplicates paths for loading completions
fpath=("$XDG_DATA_HOME/zsh/completions" $fpath)  # Add personal completions first

# Lazy load completions - only initialize when first tab completion is used
autoload -Uz compinit
export ZSH_COMPDUMP="$XDG_DATA_HOME/zsh/completions/zcompdump"
if [[ -f "$ZSH_COMPDUMP" ]]; then
    compinit -d "$ZSH_COMPDUMP"
else
    compinit -d "$ZSH_COMPDUMP" -C
fi

ZSHRC_PATH="$XDG_CONFIG_HOME/zsh/.zshrc"

alias ez="code $ZSHRC_PATH"
alias sz="source $ZSHRC_PATH"

eval "$(atuin init zsh)"
source /usr/local/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
