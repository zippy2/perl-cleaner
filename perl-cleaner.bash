# perl-cleaner(1) completion                                      -*- shell-script -*-

_perl_cleaner()
{
    local cur prev words cword
    _init_completion || return

    case $prev in
        --help | -V | --version | -!(-*)[hV]*)
            return
            ;;
        --package-manager | -P)
            local -a PKG_MANAGER=("portage" "pkgcore" "paludis")
            COMPREPLY=($(compgen -W '${PKG_MANAGER[@]}' -- "${cur}"))
            return
            ;;
    esac

        COMPREPLY=($(compgen -W '$(_parse_help "$1")' -X "--" -- "${cur}"))
        return

} &&
    complete -F _perl_cleaner perl-cleaner

# ex: filetype=sh

