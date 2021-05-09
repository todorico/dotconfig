# Install cli-tool from: https://github.com/sharkdp/insect

zinit $ZI_CLI_TOOLS_COMMANDS for \
    from"gh-r"                   \
    as"null"                     \
    mv"insect* -> insect"        \
    $ZI_BIN_COMMAND:"insect"     \
    @sharkdp/insect
