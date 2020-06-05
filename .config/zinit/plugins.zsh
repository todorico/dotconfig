#!/bin/zsh

# Enable Powerlevel10k instant prompt. Should stay
# close to the top of ~/.zshrc.
# Initialization code that may require console
# input (password prompts, [y/n] confirmations, etc.)
# must go above this block; everything else may go
# below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##################################################
#                  ZINIT SETUP                   #
##################################################

#####              ENVIRONMENT               #####

# Put zinit data in an XDG compliant location by
# default.

[ -z "$ZINIT" ] && declare -A ZINIT

local ZINIT_XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit"

ZINIT[HOME_DIR]="${ZINIT[HOME_DIR]:-$ZINIT_XDG_DATA_HOME}"
ZINIT[BIN_DIR]="${ZINIT[BIN_DIR]:-$ZINIT[HOME_DIR]/bin}"

# Remove temporary variable to avoid shell
# cluttering

unset ZINIT_XDG_DATA_HOME 

#####              INSTALLATION              #####

# Download zinit from github.

if [ ! -f "$ZINIT[BIN_DIR]/zinit.zsh" ]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$ZINIT[HOME_DIR]" && command chmod g-rwX "$ZINIT[HOME_DIR]"
    command git clone https://github.com/zdharma/zinit "$ZINIT[BIN_DIR]" &&
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" ||
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

# Initialise zinit.

source "$ZINIT[BIN_DIR]/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load zinit extensions (required for some plugins).

zinit lucid light-mode for     \
    zinit-zsh/z-a-patch-dl     \
    zinit-zsh/z-a-as-monitor   \
    zinit-zsh/z-a-bin-gem-node

#####                PLUGINS                 #####

### THEME 

zinit lucid depth=1 light-mode for \
        romkatv/powerlevel10k

### CORE

add_man1_pages () {

    local LOCAL_COMMAND_MANPATH="${XDG_DATA_HOME:-$HOME/.local/share/man/man1}"

    mkdir -p "$LOCAL_COMMAND_MANPATH"

    local page

    for page in "${@:1}"; do
        echo "Adding $page to man(1)"
        ln -sf "$(pwd)/$page" "$LOCAL_COMMAND_MANPATH"
    done

    # use mandb to update manual

    mandb
}

add_completions () {

    # TODO : better completion install method

    local completion

    for completion in "${@:1}"; do
        echo "Adding $completion to zinit completions"
        ln -sf "$(pwd)/$completion" "$ZINIT[COMPLETIONS_DIR]"
    done
}

# Not compatible with autocompleteh
    # atinit"zicompinit; zicdreplay; export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)" \
    #     zsh-users/zsh-syntax-highlighting \
        # marlonrichert/zsh-autocomplete \
    
zinit lucid light-mode for                \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"        \
        zdharma/fast-syntax-highlighting  \
    atload"_zsh_autosuggest_start"        \
        zsh-users/zsh-autosuggestions     \
    blockf atpull'zinit creinstall -q .'  \
        zsh-users/zsh-completions         \
    atinit"auto-ls-ls_command () { command ls --color=auto -CF }; export AUTO_LS_COMMANDS=(ls_command); export AUTO_LS_NEWLINE=false" \
        desyncr/auto-ls                          \
        OMZL::key-bindings.zsh                   \
    atclone"add_man1_pages z.1" atpull"%atclone" \
        rupa/z                                   \
    atinit"export HISTORY_BASE=${XDG_DATA_HOME:-$HOME/.local/share}/zsh/directory_history; export HISTORY_START_WITH_GLOBAL=true; export PER_DIRECTORY_HISTORY_TOGGLE='^G'" \
        jimhester/per-directory-history          \
    depth=1 atclone"printf \"%s\n%s\n%s\n\" 'n' 'n' 'n' | ./install;
                    command rm $HOME/.fzf.bash $HOME/.fzf.zsh;
                    add_man1_pages \$(find man -type f)"  \
    atpull"%atclone" multisrc"shell/completion.zsh shell/key-bindings.zsh" sbin"bin/*" \
        junegunn/fzf                   \
        changyuheng/fz                 \
        changyuheng/zsh-interactive-cd \
        wfxr/forgit                    \
        kazhala/dotbare                \
        kutsan/zsh-system-clipboard    \
    from"gh-r" as"null" sbin"**/bat"   \
    atclone"add_man1_pages bat*/bat.1" atpull"%atclone" \
        @sharkdp/bat \
    blockf from"gh-r" as"null" sbin"**/fd" \
    atclone"add_man1_pages fd*/fd.1; add_completions fd*/autocomplete/_fd" atpull"%atclone" \
    atinit"export FZF_DEFAULT_COMMAND='fd --type f'" \
        @sharkdp/fd \
    blockf from"gh-r" as"null" sbin"**/hyperfine" atclone"add_man1_pages hyperfine*/hyperfine.1; add_completions hyperfine*/autocomplete/_hyperfine" atpull"%atclone" \
        @sharkdp/hyperfine                      \
    from"gh-r" as"null" sbin"insect* -> insect" \
        @sharkdp/insect                         \
    from"gh-r" as"null" sbin"**/delta"          \
        dandavison/delta                        \
    from"gh-r" as"null" sbin"**/hexyl"          \
        @sharkdp/hexyl                          \
    from"gh-r" as"null" sbin"**/vivid"          \
        @sharkdp/vivid                          \
        OMZL::clipboard.zsh     \
        OMZL::compfix.zsh       \
        OMZL::completion.zsh    \
        OMZL::correction.zsh    \
        OMZL::git.zsh           \
        OMZL::history.zsh       \
        OMZP::command-not-found \
        OMZP::extract           \
        OMZP::rsync             \

    # from"gh-r" as"null" sbin"**/rg"             \
    #     @sharkdp/ripgrep                        \
    # hlissner/zsh-autopair                       \
# 

# add chafa img

# source "$ZINIT[PLUGINS_DIR]/junegunn---fzf/shell/completion.zsh"


# MichaelAquilina/zsh-you-should-use
# YSU_MESSAGE_FORMAT="$(tput setaf 1)Hey! I found this %alias_type for %command: %alias$(tput sgr0)"
# YSU_MESSAGE_POSITION="after"
# YSU_MODE=BESTMATCH # ALL
# YSU_HARDCORE=1
# YSU_IGNORED_ALIASES=("g" "ll")
# YSU_IGNORED_GLOBAL_ALIASES=("...")

# Load Powerlevel10k theme.

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.p10k.zsh"

# Apply generic adjustements to Powerlevel10k loaded theme.

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/powerlevel10k/tweaks.zsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/powerlevel10k/tweaks.zsh"

# # fe [FUZZY PATTERN] - Open the selected file with the default editor
# #   - Bypass fuzzy finder if there's only one match (--select-1)
# #   - Exit if there's no match (--exit-0)
# fe() (
#   IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
#   [[ -n "$files" ]] && ${EDITOR:-vi} "${files[@]}"
# )

# # Modified version where you can press
# #   - CTRL-O to open with `open` command,
# #   - CTRL-E or Enter key to open with the $EDITOR
# fo() (
#   IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
#   key=$(head -1 <<< "$out")
#   file=$(head -2 <<< "$out" | tail -1)
#   if [ -n "$file" ]; then
#     [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vi} "$file"
#   fi
# )
#
#

# TODO : ranger functions

# fedit

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

fimage() {
    fzf --height 80% --layout=reverse --cycle --preview='chafa {}'
}

fman() {
    man -k . | fzf | awk '{print $1}' | xargs -r man
}


# #!/usr/bin/env bash
# # fzfmenu - fzf as dmenu replacement

# input=$(mktemp -u --suffix .fzfmenu.input)
# output=$(mktemp -u --suffix .fzfmenu.output)
# mkfifo $input
# mkfifo $output
# chmod 600 $input $output

# # it's better to use st here (starts a lot faster than pretty much everything else)
# st -c fzfmenu -n fzfmenu -e sh -c "cat $input | fzf $* | tee $output" & disown

# # handle ctrl+c outside child terminal window
# trap "kill $! 2>/dev/null; rm -f $input $output" EXIT

# cat > $input
# cat $output