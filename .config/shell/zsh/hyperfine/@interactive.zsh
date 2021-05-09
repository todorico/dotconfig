# Install cli-tool from: https://github.com/sharkdp/hyperfine

function atclone-hyperfine {
    # Install man pages
    ump_add man1 hyperfine/hyperfine.1
    # Install completion files
    zinit creinstall hyperfine
}

zinit $ZI_CLI_TOOLS_COMMANDS for          \
    from"gh-r"                            \
    as"null"                              \
    atclone"atclone-hyperfine"            \
    atpull"%atclone"                      \
    mv"hyperfine* -> hyperfine"           \
    $ZI_BIN_COMMAND:"hyperfine/hyperfine" \
    @sharkdp/hyperfine
