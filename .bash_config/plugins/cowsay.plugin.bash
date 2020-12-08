#!/usr/bin/env bash

if [ -x "$(command -v cowsay)" -a -x "$(command -v fortune)" ]; then
  if [[ $(uname) = "Darwin" ]]; then
    COWS_PATH="/usr/local/Cellar/cowsay/3.04/share/cows"
  else
    COWS_PATH="/usr/share/cowsay/cows"
  fi
  fortune | cowsay -f $(ls $COWS_PATH | grep \\.cow$ | shuf -n 1)
fi

