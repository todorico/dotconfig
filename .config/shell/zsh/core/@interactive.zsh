#
# Core configuration module for zsh.
#

# Reload the shell configuration without instant prompt to show output in real time.
alias reload='POWERLEVEL9K_INSTANT_PROMPT=off exec zsh'

# Enable Powerlevel10k instant prompt. Should stay
# close to the top of ~/.zshrc.
# Initialization code that may require console
# input (password prompts, [y/n] confirmations, etc.)
# must go above this block; everything else may go
# below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# UMP: user man pages
ump_add(){
    local USER_MANPATH="${USER_MANPATH:-$XDG_DATA_HOME/man}"
    local MAN_TYPE=""
    local LINK_TARGET=""

    case $1 in
        man1|man2|man3|man4|man5|man6|man7)
            MAN_TYPE=$1
            ;;
        1|2|3|4|5|6|7)
            MAN_TYPE="man$1"
            ;;
        *)
            echo "Wrong wrong MAN_TYPE: $1"
            return 1
            ;;
    esac

    # Convert to absolute path when necessary
    case $2 in
    /*)
        LINK_TARGET=$2
        ;;
    *)
        LINK_TARGET="$(pwd)/$2"
        ;;
    esac

    [ ! -f "$LINK_TARGET" ] && {
        echo "WARNING: $LINK_TARGET is not a valid file"
        return 1
    }

    mkdir -p "$USER_MANPATH/$MAN_TYPE"

    echo Adding $LINK_TARGET to $USER_MANPATH/$MAN_TYPE

    ln -sf "$LINK_TARGET" "$USER_MANPATH/$MAN_TYPE"

    mandb
}

ump_clear(){
    local USER_MANPATH="${USER_MANPATH:-$XDG_DATA_HOME/man}"

    find "$USER_MANPATH" -type l -print0 |
    while IFS= read -r -d '' link; do 
        [ ! -e "$link" ] && {
            echo remove invalid pages link: $link
            unlink "$link"
        } 
    done
}
