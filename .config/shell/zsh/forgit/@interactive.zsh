# Install zsh-plugins from: https://github.com/wfxr/forgit

function atinit-forgit {
    export FORGIT_FZF_DEFAULT_OPTS="
    --bind=alt-i:up,alt-k:down,alt-j:backward-char,alt-l:forward-char,ctrl-j:backward-word,ctrl-l:forward-word,alt-u:beginning-of-line,alt-o:end-of-line
    "
}

zinit $ZI_DEFAULT_COMMANDS for \
    atinit"atinit-forgit"      \
    wfxr/forgit


# MichaelAquilina/zsh-you-should-use

# per-directory-history break you-should-use : https://github.com/MichaelAquilina/zsh-you-should-use/issues/48

# YSU_MESSAGE_FORMAT="$(tput setaf 1)Hey! I found this %alias_type for %command: %alias$(tput sgr0)"
# YSU_MESSAGE_POSITION="after"
# YSU_MODE=BESTMATCH # ALL
# YSU_HARDCORE=1
# YSU_IGNORED_ALIASES=("g" "ll")
# YSU_IGNORED_GLOBAL_ALIASES=("...")

