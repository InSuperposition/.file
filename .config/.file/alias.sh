#!/bin/sh

# ls with color output
alias ls='ls --color=always'

# List directory contents in long format with human-readable file sizes
alias ll='lsd -lh'

# List all files including hidden ones in long format with human-readable file sizes
alias la='lsd -lha'

# Navigate up the directory tree
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Find folder or file name in current directory
alias f='find . -name'

# Grep with color output
alias grep='grep --color=auto'

# Show current IP address
alias myip6='curl ifconfig.me; echo'

# Extract various types of compressed files
alias untar='tar -xvf'
alias unzip='unzip'
alias untgz='tar -xvzf'
alias untbz2='tar -xvjf'
alias unrar='unrar e'