# Install cli-tool from: https://github.com/sharkdp/hexyl

zinit $ZI_CLI_TOOLS_COMMANDS for  \
    from"gh-r"                    \
    as"null"                      \
    mv"hexyl* -> hexyl"           \
    $ZI_BIN_COMMAND:"hexyl/hexyl" \
    @sharkdp/hexyl
