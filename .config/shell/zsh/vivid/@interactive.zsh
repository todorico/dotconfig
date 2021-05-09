# Install cli-tool from: https://github.com/sharkdp/vivid

zinit $ZI_CLI_TOOLS_COMMANDS for  \
    from"gh-r"                    \
    as"null"                      \
    mv"vivid* -> vivid"           \
    $ZI_BIN_COMMAND:"vivid/vivid" \
    @sharkdp/vivid
