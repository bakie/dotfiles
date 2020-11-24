#!/usr/bin/env bash

if [[ -f /etc/bash_completion ]]; then
  source /etc/bash_completion
fi

if [[ -f /etc/profile.d/bash_completion.sh ]]; then
  source /etc/profile.d/bash_completion.sh
fi


#if [[ $(uname) = "Darwin" ]] && command -v brew &>/dev/null ; then
#  BREW_PREFIX="/usr/local"

#  if [[ -f "$BREW_PREFIX"/etc/bash_completion ]]; then
#    source "$BREW_PREFIX"/etc/bash_completion
#  fi
#
#  if [[ -f "$BREW_PREFIX"/share/bash-completion/bash_completion ]]; then
#    source "$BREW_PREFIX"/share/bash-completion/bash_completion
#  fi
#fi
