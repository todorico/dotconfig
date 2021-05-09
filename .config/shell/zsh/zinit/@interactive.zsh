# Install cli-tool from: https://github.com/zdharma/zinit

# Put zinit data in an XDG compliant location by default.

[ -z "$ZINIT" ] && declare -gA ZINIT

ZINIT[HOME_DIR]="${ZINIT[HOME_DIR]:-${XDG_DATA_HOME:-$HOME/.local/share}/zinit}"
ZINIT[BIN_DIR]="${ZINIT[BIN_DIR]:-$ZINIT[HOME_DIR]/bin}"

# Download zinit from github.

if [ ! -f "$ZINIT[BIN_DIR]/zinit.zsh" ]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$ZINIT[HOME_DIR]" && command chmod g-rwX "$ZINIT[HOME_DIR]"
    command git clone https://github.com/zdharma/zinit "$ZINIT[BIN_DIR]" &&
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" ||
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

# Initialise zinit.

source "$ZINIT[BIN_DIR]/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Define zinit variable.

export ZI_DEFAULT_COMMANDS=(lucid light-mode id-as:auto)
export ZI_CLI_TOOLS_COMMANDS=(lucid light-mode id-as:auto)
export ZI_BIN_COMMAND=lbin

# Load zinit extensions (required for some plugins).

zinit $ZI_DEFAULT_COMMANDS for \
    zinit-zsh/z-a-patch-dl     \
    zinit-zsh/z-a-as-monitor   \
    NICHOLAS85/z-a-linkbin # need reloading to add executables
