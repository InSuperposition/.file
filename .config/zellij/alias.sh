#!/bin/sh

alias zj='zellij'
alias zja='zellij attach'
alias zjl='zellij list-sessions'
alias zjk='zellij kill-session'
alias zjka='zellij kill-all-sessions'

# Quick layouts
alias zjdev='zellij attach dev || zellij --session dev --layout ~/.config/zellij/layouts/development.kdl'
alias zjmon='~/bin/zellij-monitor'
