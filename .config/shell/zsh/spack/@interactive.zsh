# Install cli-tool from: https://github.com/spack/spack

zinit $ZI_CLI_TOOLS_COMMANDS for        \
    from"gh-r"                          \
    as"null"                            \
    mv"spack* -> spack"                 \
    src"spack/share/spack/setup-env.sh" \
    spack/spack
    # $ZI_BIN_COMMAND:"spack/bin/*" \
