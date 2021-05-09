# Install cli-tool and completion from: https://github.com/dbrgn/tealdeer

zinit $ZI_CLI_TOOLS_COMMANDS for \
    from"gh-r"                   \
    as"null"                     \
    mv"tldr* -> tldr"            \
    $ZI_BIN_COMMAND:"tldr"       \
    dbrgn/tealdeer

zinit lucid id-as:tealdeer-completion for \
    as"completion"                        \
    mv"tealdeer-completion -> _tldr"      \
    https://github.com/dbrgn/tealdeer/blob/master/zsh_tealdeer
