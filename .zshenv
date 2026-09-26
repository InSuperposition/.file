export ZDOTDIR="$HOME/.config/zsh"

# Make user-installed and mise-managed commands available to every zsh,
# including non-interactive SSH commands.
typeset -U path PATH
typeset -a extra_path
extra_path=(
    "$HOME/.local/bin"
    "$HOME/.local/share/mise/shims"
)

if [[ -d /opt/homebrew/bin ]]; then
    extra_path+=(/opt/homebrew/bin)
    [[ -d /opt/homebrew/sbin ]] && extra_path+=(/opt/homebrew/sbin)
fi

if [[ -d /usr/local/bin ]]; then
    extra_path+=(/usr/local/bin)
    [[ -d /usr/local/sbin ]] && extra_path+=(/usr/local/sbin)
fi

path=($extra_path $path)
export PATH
