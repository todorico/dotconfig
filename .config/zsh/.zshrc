#!/bin/zsh

# POSIX SHELL ENVIRONMENT CONFIGURATION
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/env.sh"

# ZINIT PLUGINS
source "${XDG_CONFIG_HOME:-$HOME/.config}/zinit/plugins.zsh"

# ZSH CUSTOM KEY BINDINGS
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/key-bindings.zsh"

# POSIX SHELL ALIASES
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh"

