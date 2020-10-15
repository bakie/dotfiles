#!/usr/bin/env bash

# Load the helpers, completion and aliases
for type in "helpers" "completion" "aliases"; do
  for _bash_config_file in $(sort <(compgen -G "$BASH_CONFIG_PATH/$type/*.bash")); do
    source "$_bash_config_file"
  done
done

unset _bash_config_file

