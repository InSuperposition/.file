#!/bin/sh

# Check if not already in a Zellij session
if [ -z "$ZELLIJ" ]; then
    # Auto-attach to main session when SSHing in
    if [ -n "$SSH_CONNECTION" ]; then
        zellij attach main || zellij --session main
    fi
fi

if [ ! -f "$XDG_DATA_HOME/zsh/completions/_zellij" ]; then
    touch "$XDG_DATA_HOME/zsh/completions/_zellij"
    zellij setup --generate-completion zsh > "$XDG_DATA_HOME/zsh/completions/_zellij"
fi

# Custom prompt for Zellij
if [ -n "$ZELLIJ" ]; then
    PROMPT="%{$fg[cyan]%}[zellij:$ZELLIJ_SESSION_NAME]%{$reset_color%} $PROMPT"
fi

. "$HOME/.config/zellij/alias.sh"