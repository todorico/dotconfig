# Install cli-tool from: https://github.com/restic/restic

zinit $ZI_CLI_TOOLS_COMMANDS for \
    from"gh-r"                   \
    as"null"                     \
    mv"restic* -> restic"        \
    $ZI_BIN_COMMAND:"restic"     \
    restic/restic
