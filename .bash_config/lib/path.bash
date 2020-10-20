#!/usr/bin/env bash

function pathmunge() {
  if ! [[ $PATH =~ (^|:)$1($|:) ]] && [[ -d $1 ]]; then
    if [ "$2" = "after" ] ; then
       PATH=$PATH:$1
    else
       PATH=$1:$PATH
    fi
  fi
}

