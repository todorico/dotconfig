# Install cli-tool from: https://github.com/sharkdp/bat

function atclone-fd {
    # Install man pages
    ump_add man1 fd/fd.1
    # Install completion files
    zinit creinstall fd
}

function atinit-fd {
    # Use fd as default fzf launch command
    export FZF_DEFAULT_COMMAND='fd --type f'
}

zinit $ZI_CLI_TOOLS_COMMANDS for \
    from"gh-r"                   \
    as"null"                     \
    atclone"atclone-fd"          \
    atpull"%atclone"             \
    atinit"atinit-fd"            \
    mv"fd* -> fd"                \
    $ZI_BIN_COMMAND:"fd/fd"      \
    @sharkdp/fd