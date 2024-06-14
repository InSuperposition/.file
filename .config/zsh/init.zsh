#!/bin/zsh
source ~/.config/init.sh
export HISTFILE=$XDG_STATE_HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt INC_APPEND_HISTORY

fpath+=.zfunc

# ZSH plugins (via homebrew)
source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/local/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
