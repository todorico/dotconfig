# Install zsh-plugin from: https://github.com/desyncr/auto-ls

function atinit-auto-ls {
    # Define custom ls command
    function auto-ls-ls-command { command ls --color=auto -CF }
    # Use custom ls command
    export AUTO_LS_COMMANDS=(ls-command)
    # Disable newline after ls command
    export AUTO_LS_NEWLINE=false
}

zinit $ZI_DEFAULT_COMMANDS for \
    atinit"atinit-auto-ls"     \
    desyncr/auto-ls