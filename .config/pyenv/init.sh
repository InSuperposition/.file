export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"

if [ -d "$PYENV_ROOT/bin" ]; then
  PATH="$PYENV_ROOT/bin:$PATH"
fi

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
else
  echo "pyenv is not installed."
fi