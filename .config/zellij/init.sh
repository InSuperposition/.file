#!/bin/bash

# Zellij integration
if [[ -z "$ZELLIJ" ]]; then
    # Auto-attach to main session when SSHing in
    if [[ -n "$SSH_CONNECTION" ]]; then
        zellij attach main || zellij --session main
    fi
fi

# Zellij aliases

# Zellij completion
if command -v zellij &> /dev/null; then
    eval "$(zellij setup --generate-completion zsh)"
fi

# Custom prompt for Zellij
if [[ -n "$ZELLIJ" ]]; then
    PROMPT="%{$fg[cyan]%}[zellij:$ZELLIJ_SESSION_NAME]%{$reset_color%} $PROMPT"
fi

. "$HOME/.config/zellij/alias.sh"