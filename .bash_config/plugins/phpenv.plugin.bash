#!/usr/bin/env bash

# phpenv
export PHPENV_ROOT="$HOME/.phpenv"
pathmunge "$PHPENV_ROOT/bin"

if [ -x "$(command -v phpenv)" ]; then
  eval "$(phpenv init - --no-rehash)"
fi

