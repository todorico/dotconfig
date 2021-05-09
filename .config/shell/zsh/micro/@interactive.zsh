# Install cli-tool from: https://github.com/zyedidia/micro

function atclone-micro {
    # Install man pages
    ump_add man1 micro/micro.1
}

zinit $ZI_CLI_TOOLS_COMMANDS for  \
    from"gh-r"                    \
    as"null"                      \
    atclone"atclone-micro"        \
    atpull"%atclone"              \
    mv"micro* -> micro"           \
    $ZI_BIN_COMMAND:"micro/micro" \
    zyedidia/micro