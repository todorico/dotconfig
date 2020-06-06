#!/bin/zsh

# POSIX SHELL ENVIRONMENT CONFIGURATION

[ -f   "${XDG_CONFIG_HOME:-$HOME/.config}/shell/env.sh" ] &&
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/env.sh" ||
echo   "[WARNING] ZSH : \$XDG_CONFIG_HOME/shell/env.sh not found"

# ZINIT PLUGINS

[ -f   "${XDG_CONFIG_HOME:-$HOME/.config}/zinit/plugins.zsh" ] &&
source "${XDG_CONFIG_HOME:-$HOME/.config}/zinit/plugins.zsh" ||
echo   "[WARNING] ZSH : \$XDG_CONFIG_HOME/zinit/plugins.zsh not found"

# ZSH CUSTOM KEY BINDINGS

[ -f   "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/key-bindings.zsh" ] &&
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/key-bindings.zsh" ||
echo   "[WARNING] ZSH : \$XDG_CONFIG_HOME/zsh/key-bindings.zsh not found"

# POSIX SHELL ALIASES

[ -f   "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh" ] &&
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh" ||
echo   "[WARNING] ZSH : \$XDG_CONFIG_HOME/shell/aliases.sh not found"

