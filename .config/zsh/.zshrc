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

typeset -U fpath  # Remove duplicates
fpath=("$XDG_DATA_HOME/zsh/completions" $fpath)  # Add personal completions first

# Lazy load completions - only initialize when first tab completion is used
autoload -Uz compinit
if [[ -n "$XDG_DATA_HOME/zsh/completions/zcompdump" ]]; then
    compinit
else
    compinit -C
fi

ZSHRC_PATH="$XDG_CONFIG_HOME/zsh/.zshrc"

alias ez="code $ZSHRC_PATH"
alias sz="source $ZSHRC_PATH"

# ZSH_HOME_DIR="${XDG_CONFIG_HOME}/zsh"


# if [[ -r "$ZSH_HOME_DIR/zi_init.zsh" ]]; then
# # Load ZI (Z Shell Interactive Plugin Manager)
#   source "$ZSH_HOME_DIR/zi_init.zsh" && zzinit
  
# # Load ZI plugins
#   source $ZSH_HOME_DIR/zi_plugin.zsh
# fi
