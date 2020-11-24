#!/usr/bin/env bash

_poetry_complete()
{
    local cur script coms opts com
    COMPREPLY=()
    _get_comp_words_by_ref -n : cur words

    # for an alias, get the real script behind it
    if [[ $(type -t ${words[0]}) == "alias" ]]; then
        script=$(alias ${words[0]} | sed -E "s/alias ${words[0]}='(.*)'/\1/")
    else
        script=${words[0]}
    fi

    # lookup for command
    for word in ${words[@]:1}; do
        if [[ $word != -* ]]; then
            com=$word
            break
        fi
    done

    # completing for an option
    if [[ ${cur} == --* ]] ; then
        opts="--ansi --help --no-ansi --no-interaction --quiet --verbose --version"

        case "$com" in

            (about)
            opts="${opts} "
            ;;

            (add)
            opts="${opts} --allow-prereleases --dev --dry-run --extras --optional --platform --python"
            ;;

            (build)
            opts="${opts} --format"
            ;;

            (cache)
            opts="${opts} "
            ;;

            (check)
            opts="${opts} "
            ;;

            (config)
            opts="${opts} --list --local --unset"
            ;;

            (debug)
            opts="${opts} "
            ;;

            (env)
            opts="${opts} "
            ;;

            (export)
            opts="${opts} --dev --extras --format --output --with-credentials --without-hashes"
            ;;

            (help)
            opts="${opts} "
            ;;

            (init)
            opts="${opts} --author --dependency --description --dev-dependency --license --name"
            ;;

            (install)
            opts="${opts} --dry-run --extras --no-dev --no-root"
            ;;

            (lock)
            opts="${opts} "
            ;;

            (new)
            opts="${opts} --name --src"
            ;;

            (publish)
            opts="${opts} --build --cert --client-cert --password --repository --username"
            ;;

            (remove)
            opts="${opts} --dev --dry-run"
            ;;

            (run)
            opts="${opts} "
            ;;

            (search)
            opts="${opts} "
            ;;

            (self)
            opts="${opts} "
            ;;

            (shell)
            opts="${opts} "
            ;;

            (show)
            opts="${opts} --all --latest --no-dev --outdated --tree"
            ;;

            (update)
            opts="${opts} --dry-run --lock --no-dev"
            ;;

            (version)
            opts="${opts} "
            ;;

        esac

        COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
        __ltrim_colon_completions "$cur"

        return 0;
    fi

    # completing for a command
    if [[ $cur == $com ]]; then
        coms="about add build cache check config debug env export help init install lock new publish remove run search self shell show update version"

        COMPREPLY=($(compgen -W "${coms}" -- ${cur}))
        __ltrim_colon_completions "$cur"

        return 0
    fi
}

__ltrim_colon_completions() {
    # If word-to-complete contains a colon,
    # and bash-version < 4,
    # or bash-version >= 4 and COMP_WORDBREAKS contains a colon
    if [[
        "$1" == *:* && (
            ${BASH_VERSINFO[0]} -lt 4 || 
            (${BASH_VERSINFO[0]} -ge 4 && "$COMP_WORDBREAKS" == *:*) 
        )
    ]]; then
        # Remove colon-word prefix from COMPREPLY items
        local colon_word=${1%${1##*:}}
        local i=${#COMPREPLY[*]}
        while [ $((--i)) -ge 0 ]; do
            COMPREPLY[$i]=${COMPREPLY[$i]#"$colon_word"}
        done
    fi
} # __ltrim_colon_completions()


complete -o default -F _poetry_complete poetry
complete -o default -F _poetry_complete /home/ikke/.poetry/bin/poetry
