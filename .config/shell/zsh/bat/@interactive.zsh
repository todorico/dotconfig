# Install cli-tool from: https://github.com/sharkdp/bat

function atclone-bat {
    # Install man pages
    ump_add man1 bat/bat.1
    # Rename zsh completion file to detect it with zinit creinstall
    command cp -f bat/autocomplete/bat.zsh bat/autocomplete/_bat
    # Install completion files
    zinit creinstall bat
}

function atinit-bat {
    # Display line numbers and git changes
    export BAT_STYLE="numbers,changes"
    # Use bat as default manpager
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    # Replace cat with bat
    alias cat='bat'
}

zinit $ZI_CLI_TOOLS_COMMANDS for \
    from"gh-r"                   \
    as"null"                     \
    atclone"atclone-bat"         \
    atpull"%atclone"             \
    atinit"atinit-bat"           \
    mv"bat* -> bat"              \
    $ZI_BIN_COMMAND:"bat/bat"    \
    @sharkdp/bat

