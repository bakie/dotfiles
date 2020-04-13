#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- == *i* ]] || return

# Don't check mail when opening terminal.
unset MAILCHECK

#export TODO="t"

# Set vim as default editor for everything
export VISUAL=vim
export EDITOR="$VISUAL"

# Load the bash files
if [[ -d $HOME/.bash_files && -f $HOME/.bash_files/bash_files ]]; then
  source $HOME/.bash_files/bash_files
fi

# Load the completion files
if [[ -d $HOME/.bash_completion && -f $HOME/.bash_completion/bash_completion ]]; then
  source $HOME/.bash_completion/bash_completion
fi

# Load the aliases files
if [[ -d $HOME/.bash_aliases && -f $HOME/.bash_aliases/bash_aliases ]]; then
  source $HOME/.bash_aliases/bash_aliases
fi

if [[ -f $HOME/.bash_osx ]]; then
  source $HOME/.bash_osx
fi

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
