# Install zsh-plugin from: https://github.com/zdharma/fast-syntax-highlighting

# Completion is initializated before loading this plugin.
function atinit-fast-syntax-highlighting {
    # Initialize installed completions
    zicompinit
    zicdreplay
}

# Syntax highlighting must be the last plugin loaded.
zinit $ZI_DEFAULT_COMMANDS for              \
    atinit"atinit-fast-syntax-highlighting" \
    zdharma/fast-syntax-highlighting