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
if [[ -d ~/.bash_files && -f ~/.bash_files/bash_files ]]; then
  source ~/.bash_files/bash_files
fi

# Load the completion files
if [[ -d ~/.bash_completion && -f ~/.bash_completion/bash_completion ]]; then
  source ~/.bash_completion/bash_completion
fi

# Load the aliases files
if [[ -d ~/.bash_aliases && -f ~/.bash_aliases/bash_aliases ]]; then
  source ~/.bash_aliases/bash_aliases
fi

if [[ -f ~/.bash_osx ]]; then
  source ~/.bash_osx
fi

# Show cowsay with fortune at every new terminal
if [ -x "$(command -v cowsay)" -a -x "$(command -v fortune)" ]; then
  OPTIONS=(`cowsay -l | tail -n +2`)
  OPTION=${OPTIONS[$RANDOM % ${#OPTIONS[@]}]}
  fortune | cowsay -f ${OPTION}
fi

if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi
