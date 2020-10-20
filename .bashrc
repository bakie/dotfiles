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

source "$BASH_CONFIG_PATH/load_config.sh"
