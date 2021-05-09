# Install cli-tool from: https://github.com/BurntSushi/ripgrep

function atclone-ripgrep {
    # Install man pages
    ump_add man1 rg/doc/rg.1
    # Install completion files
    zinit creinstall ripgrep
}

zinit $ZI_CLI_TOOLS_COMMANDS for \
    from"gh-r"                   \
    as"null"                     \
    mv"ripgrep* -> rg"           \
    atclone"atclone-ripgrep"     \
    atpull"%atclone"             \
    $ZI_BIN_COMMAND:"rg/rg"      \
    BurntSushi/ripgrep
