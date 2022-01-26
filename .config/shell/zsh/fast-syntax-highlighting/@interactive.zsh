# Install zsh-plugin from: https://github.com/zdharma-continuum/fast-syntax-highlighting

# Completion is initializated before loading this plugin.
function atinit-fast-syntax-highlighting {
    # Initialize installed completions
    zicompinit
    zicdreplay
}

# Syntax highlighting must be the last plugin loaded.
zinit $ZI_DEFAULT_COMMANDS for              \
    atinit"atinit-fast-syntax-highlighting" \
    zdharma-continuum/fast-syntax-highlighting