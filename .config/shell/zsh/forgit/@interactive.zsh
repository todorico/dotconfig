# Install zsh-plugins from: https://github.com/wfxr/forgit

function atinit-forgit {
    export FORGIT_FZF_DEFAULT_OPTS="
    --bind=alt-i:up,alt-k:down,alt-j:backward-char,alt-l:forward-char,ctrl-j:backward-word,ctrl-l:forward-word,alt-u:beginning-of-line,alt-o:end-of-line
    "
}

zinit $ZI_DEFAULT_COMMANDS for \
    atinit"atinit-forgit"      \
    wfxr/forgit