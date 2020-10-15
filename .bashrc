#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- == *i* ]] || return

# Path to the bash configuration dir
export BASH_CONFIG_PATH="$HOME/.bash_config"

# Don't check mail when opening terminal.
unset MAILCHECK

#export TODO="t"

# Set vim as default editor for everything
export VISUAL=vim
export EDITOR="$VISUAL"

# Show cowsay with fortune at every new terminal
if [ -x "$(command -v cowsay)" -a -x "$(command -v fortune)" ]; then
  OPTIONS=(`cowsay -l | tail -n +2`)
  OPTION=${OPTIONS[$RANDOM % ${#OPTIONS[@]}]}
  fortune | cowsay -f ${OPTION}
fi

# pyenv
if [[ -d $HOME/.pyenv ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi

# poetry
if [[ -d $HOME/.poetry ]]; then
  export PATH="$HOME/.poetry/bin:$PATH"
fi

source "$BASH_CONFIG_PATH/load_config.sh"
