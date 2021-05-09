# Install cli-tool from: https://github.com/eth-p/bat-extras

function atclone-bat-extras {
    # Install man pages
    find man -type f -print0 |
    while IFS= read -r -d '' page; do 
        ump_add man1 "$page"
    done
}

zinit $ZI_CLI_TOOLS_COMMANDS for \
    from"gh-r"                   \
    as"null"                     \
    atclone"atclone-bat-extras"  \
    atpull"%atclone"             \
    $ZI_BIN_COMMAND:"bin/*"      \
    eth-p/bat-extras
