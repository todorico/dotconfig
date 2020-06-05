#!/bin/zsh

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"

[ ! -f "$HISTFILE" ] && mkdir -p "$(dirname $HISTFILE)"