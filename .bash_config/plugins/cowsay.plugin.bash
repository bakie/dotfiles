#!/usr/bin/env bash

if [ -x "$(command -v cowsay)" -a -x "$(command -v fortune)" ]; then
  OPTIONS=(`cowsay -l | tail -n +2`)
  OPTION=${OPTIONS[$RANDOM % ${#OPTIONS[@]}]}
  fortune | cowsay -f ${OPTION}
fi

