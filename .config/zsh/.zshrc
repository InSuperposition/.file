#!/bin/zsh

source $HOME/.file/init.sh

export HISTFILE=$XDG_STATE_HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt INC_APPEND_HISTORY

fpath+=.zfunc

ZSHRC_PATH="$XDG_CONFIG_HOME/zsh/.zshrc"

alias ez="code $ZSHRC_PATH"
alias sz="source $ZSHRC_PATH"

ZSH_HOME_DIR="${XDG_CONFIG_HOME}/zsh"


if [[ -r "$ZSH_HOME_DIR/zi_init.zsh" ]]; then
# Load ZI (Z Shell Interactive Plugin Manager)
  source "$ZSH_HOME_DIR/zi_init.zsh" && zzinit
  
# Load ZI plugins
  source $ZSH_HOME_DIR/zi_plugin.zsh
fi

