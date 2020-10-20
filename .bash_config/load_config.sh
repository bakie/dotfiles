#!/usr/bin/env bash

# Load the lib files first
LIB="$BASH_CONFIG_PATH/lib/*.bash"
for _bash_config_file in $LIB; do
  source "$_bash_config_file"
done

# Load the completion and aliases
for type in "completion" "aliases" "plugins"; do
  for _bash_config_file in $(sort <(compgen -G "$BASH_CONFIG_PATH/$type/*.bash")); do
    source "$_bash_config_file"
  done
done

# Load the theme
# First load the helpers and then the theme
THEME_HELPERS="$BASH_CONFIG_PATH/theme/helpers/*.bash"
for _bash_config_file in $THEME_HELPERS; do
  source "$_bash_config_file"
done
source "$BASH_CONFIG_PATH/theme/appearance.theme.bash"

unset _bash_config_file

