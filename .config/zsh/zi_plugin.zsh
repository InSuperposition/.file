#!/usr/bin/env zsh

# Load plugins with optimized settings to reduce input lag
zi wait lucid for \
  atinit"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    z-shell/F-Sy-H \
  blockf \
    zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start; ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20; ZSH_AUTOSUGGEST_MANUAL_REBIND=1" \
    zsh-users/zsh-autosuggestions

# Reduce syntax highlighting features that cause lag
ZSH_HIGHLIGHT_MAXLENGTH=60
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

zi light z-shell/H-S-MW

zstyle :plugin:history-search-multi-word active "standout"

typeset -gA HSMW_HIGHLIGHT_STYLES
HSMW_HIGHLIGHT_STYLES[path]="bg=magenta,fg=white,bold"

typeset -gA HSMW_HIGHLIGHT_STYLES
HSMW_HIGHLIGHT_STYLES[single-hyphen-option]="fg=cyan"
HSMW_HIGHLIGHT_STYLES[double-hyphen-option]="fg=cyan"

HSMW_HIGHLIGHT_STYLES[commandseparator]="fg=241,bg=17"