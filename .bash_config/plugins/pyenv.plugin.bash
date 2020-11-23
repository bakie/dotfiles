#!/usr/bin/env bash

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
pathmunge "$PYENV_ROOT/bin"

if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init - --no-rehash)"
fi

