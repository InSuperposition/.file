#!/bin/sh
alias ls='ls --color=always'
# List directory contents in long format with human-readable file sizes
alias ll='ls -lh'

# List all files including hidden ones in long format with human-readable file sizes
alias la='ls -lha'

# Navigate up the directory tree
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Grep with color output
alias grep='grep --color=auto'

# Show current IP address
alias myip="curl ifconfig.me"

# Extract various types of compressed files
alias untar='tar -xvf'
alias unzip='unzip'
alias untgz='tar -xvzf'
alias untbz2='tar -xvjf'
alias unrar='unrar e'