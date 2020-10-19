#!/usr/bin/env bash

function user_host_path_prompt {
  ps_time="[\t]"
  if [[ $(id -u) -eq 0 ]]; then
    ps_user_host_color=${red}
  else
    ps_user_host_color=${bold_green}
  fi                                                                                                                                                                                                                                          
  ps_user_host="$ps_user_host_color\u@\h${normal}"
  ps_path="${bold_blue}\w${normal}"

  echo "$ps_time $ps_user_host:$ps_path"
}

function prompt {
  PS1="$(user_host_path_prompt)${cyan}$(_git_prompt_info)${reset_color}$ "
}

function safe_append_prompt_command {
    local prompt_re
    # Set OS dependent exact match regular expression
    if [[ ${OSTYPE} == darwin* ]]; then
      # macOS
      prompt_re="[[:<:]]${1}[[:>:]]"
    else
      # Linux, FreeBSD, etc.
      prompt_re="\<${1}\>"
    fi

    if [[ ${PROMPT_COMMAND} =~ ${prompt_re} ]]; then
      return
    elif [[ -z ${PROMPT_COMMAND} ]]; then
      PROMPT_COMMAND="${1}"
    else
      PROMPT_COMMAND="${1};${PROMPT_COMMAND}"
    fi
}

safe_append_prompt_command prompt
