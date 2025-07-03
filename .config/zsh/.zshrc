#!/bin/zsh

source $HOME/.file/init.sh

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
