#!/usr/bin/env bash

function git_prompt_vars {
  if _git-branch &> /dev/null; then
    GIT_BRANCH="$(_git-friendly-ref)$(_git-remote-info)"
  else
    local detached_prefix
    if _git-tag &> /dev/null; then
      detached_prefix="tag:"
    else
      detached_prefix="detached:"
    fi
    GIT_BRANCH="${detached_prefix}\$(_git-friendly-ref)"
  fi

  IFS=$'\t' read -r commits_behind commits_ahead <<< "$(_git-upstream-behind-ahead)"
  if [[ "${commits_ahead}" -gt 0 ]]; then
    GIT_BRANCH+=" ↑${commits_ahead}"
  fi
  if [[ "${commits_behind}" -gt 0 ]]; then
    SCM_BRANCH+=" ↓${commits_behind}"
  fi

  local stash_count
  stash_count="$(_git-num-stashes)"
  [[ "${stash_count}" -gt 0 ]] && GIT_BRANCH+=" {${stash_count}}"

  IFS=$'\t' read -r untracked_count unstaged_count staged_count <<< "$(_git-status-counts)"
  if [[ "${untracked_count}" -gt 0 || "${unstaged_count}" -gt 0 || "${staged_count}" -gt 0 ]]; then
    [[ "${staged_count}" -gt 0 ]] && GIT_BRANCH+=" S:${staged_count}"
    [[ "${unstaged_count}" -gt 0 ]] && GIT_BRANCH+=" U:${unstaged_count}"
    [[ "${untracked_count}" -gt 0 ]] && GIT_BRANCH+=" ?:${untracked_count}"
  fi
}

function _git-symbolic-ref {
 git symbolic-ref -q HEAD 2> /dev/null
}

function _git-friendly-ref {
  _git-branch || _git-tag || _git-commit-description || _git-short-sha
}

function _git-branch {
  git symbolic-ref -q --short HEAD 2> /dev/null || return 1
}

function _git-tag {
  git describe --tags --exact-match 2> /dev/null
}

function _git-upstream {
  local ref
  ref="$(_git-symbolic-ref)" || return 1
  git for-each-ref --format="%(upstream:short)" "${ref}"
}

function _git-upstream-remote {
  local upstream
  upstream="$(_git-upstream)" || return 1

  local branch
  branch="$(_git-upstream-branch)" || return 1
  echo "${upstream%"/${branch}"}"
}

function _git-upstream-branch {
  local ref
  ref="$(_git-symbolic-ref)" || return 1

  git for-each-ref --format="%(upstream:strip=3)" "${ref}" 2> /dev/null || git for-each-ref --format="%(upstream)" "${ref}" | sed -e "s/.*\/.*\/.*\///"
}

function _git-upstream-behind-ahead {
  git rev-list --left-right --count "$(_git-upstream)...HEAD" 2> /dev/null
}

function _git-commit-description {
  git describe --contains --all 2> /dev/null
}

function _git-short-sha {
  git rev-parse --short HEAD
}

function _git-num-remotes {
  git remote | wc -l
}

function _git-num-stashes {
  git stash list 2> /dev/null | wc -l | tr -d ' '
}

function _git-status {
  git status --porcelain -u 2> /dev/null
}

function _git-status-counts {
  _git-status | awk '
  BEGIN {
    untracked=0;
    unstaged=0;
    staged=0;
  }
  {
    if ($0 ~ /^\?\? .+/) {
      untracked += 1
    } else {
      if ($0 ~ /^.[^ ] .+/) {
        unstaged += 1
      }
      if ($0 ~ /^[^ ]. .+/) {
        staged += 1
      }
    }
  }
  END {
    print untracked "\t" unstaged "\t" staged
  }'
}

function _git-remote-info {
  [[ "$(_git-upstream)" == "" ]] && return || true

  [[ "$(_git-branch)" == "$(_git-upstream-branch)" ]] && local same_branch_name=true || true
  local same_branch_name=
  [[ "$(_git-branch)" == "$(_git-upstream-branch)" ]] && same_branch_name=true
  if [[ "$(_git-num-remotes)" -ge 2 ]]; then
    echo "hello"
    if [[ "${same_branch_name}" != "true" ]]; then
      remote_info="\$(_git-upstream)"
    else
      remote_info="$(_git-upstream-remote)"
    fi
  elif [[ ${same_branch_name} != "true" ]]; then
    remote_info="\$(_git-upstream-branch)"
  fi

  if [[ -n "${remote_info}" ]];then
    echo "${remote_info}"
  fi
}

function _git_prompt_info {
  if [[ -f .git/HEAD ]] || [[ -n "$(git rev-parse --is-inside-work-tree 2> /dev/null)" ]]; then
    git_prompt_vars
    echo -e " [${GIT_BRANCH}]"
  fi
}
