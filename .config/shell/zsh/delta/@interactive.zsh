# Install cli-tool from: https://github.com/dandavison/delta

function atinit-delta {
    # Use delta as default git pager
    export GIT_PAGER=delta
}

zinit $ZI_CLI_TOOLS_COMMANDS for  \
    from"gh-r"                    \
    as"null"                      \
    atinit"atinit-delta"          \
    mv"delta* -> delta"           \
    $ZI_BIN_COMMAND:"delta/delta" \
    dandavison/delta