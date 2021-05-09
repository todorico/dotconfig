# Install zsh-plugin from: https://github.com/jimhester/per-directory-history

atinit-per-directory-history() {
    export HISTORY_BASE=${XDG_DATA_HOME:-$HOME/.local/share}/zsh/directory_history
    export HISTORY_START_WITH_GLOBAL=true
    export PER_DIRECTORY_HISTORY_TOGGLE='^G'
}

zinit $ZI_DEFAULT_COMMANDS for           \
    atinit"atinit-per-directory-history" \
    jimhester/per-directory-history
