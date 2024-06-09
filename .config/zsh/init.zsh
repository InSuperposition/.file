#!/bin/zsh
source ~/.config/init.sh
export HISTFILE=$XDG_STATE_HOME/zsh/history

fpath+=.zfunc

# ZSH plugins (via homebrew)
source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/local/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
