# Install cli-tool from: https://github.com/rupa/z

function atclone-z {
    # Install man pages
    ump_add man1 z.1
}

function atinit-z {
    # Put z data file in XDG compliant location.
    export _Z_DATA=${_Z_DATA:-$XDG_DATA_HOME/z}
    # Create the z data file if it does not exist.
    [ ! -f "$_Z_DATA" ] && touch "$_Z_DATA"
}

zinit $ZI_CLI_TOOLS_COMMANDS for \
    atclone"atclone-z"           \
    atpull"%atclone"             \
    atinit"atinit-z"             \
    rupa/z
