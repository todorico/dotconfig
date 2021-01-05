#!/bin/sh

##################################################
#                      XDG                       #
##################################################

#####            BASE DIRECTORIES            #####

# XDG Base directories defines where files 
# depending on their usage should be located.

export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
# export XDG_RUNTIME_DIR # Per user temporary file set by pam_env

#####            USER DIRECTORIES            #####

# XDG User directories defines path and names of 
# "well known" user directories like the desktop
# folder and the music folder, etc.

# xdg-user-dirs-update --set DOWNLOAD ~/Internet # set new value
# xdg-user-dir DOWNLOAD # query valu

# export XDG_DESKTOP_DIR="$HOME/Desktop"
# export XDG_DOCUMENTS_DIR="$HOME/Documents"
# export XDG_DOWNLOAD_DIR="$HOME/Downloads"
# export XDG_MUSIC_DIR="$HOME/Music"
# export XDG_PICTURES_DIR="$HOME/Pictures"
# export XDG_PUBLICSHARE_DIR="$HOME/Public"
# export XDG_TEMPLATES_DIR="$HOME/Templates"
# export XDG_VIDEOS_DIR="$HOME/Videos"

##################################################
#             XDG : FIX UNSUPPORTED              #
##################################################

# Configuration of unsupported programs to force
# XDG compliance using global variables / aliases.

#####                 CCACHE                 #####

export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME/ccache/config"

#####            NVIDIA-SETTINGS             #####

if [ "$(command -v nvidia-settings)" ]; then

	NVIDIA_SETTINGS_XDG_CONFIG_HOME="$XDG_CONFIG_HOME/nvidia"

	# Create new XDG compliant configuration home.

	[ ! -d "$NVIDIA_SETTINGS_XDG_CONFIG_HOME" ] && mkdir -p "$NVIDIA_SETTINGS_XDG_CONFIG_HOME"
	
	# Move old configuration file to new XDG
	# compliant configuration home location.

	[ -f "$HOME/.nvidia-settings-rc" ] && mv "$HOME/.nvidia-settings-rc" "$NVIDIA_SETTINGS_XDG_CONFIG_HOME/nvidia-settings-rc"

	# Force usage of new XDG compliant
	# configuration file by default.

	alias nvidia-settings='nvidia-settings --config="$NVIDIA_SETTINGS_XDG_CONFIG_HOME/nvidia-settings-rc"'
fi

#####                  NPM                   #####

if [ "$(command -v npm)" ]; then

	# Set new default XDG compliant configuration
	# file location.

	export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
f
	# Create new XDG compliant configuration home.

	[ ! -d "$(dirname $NPM_CONFIG_USERCONFIG)" ] && mkdir -p "$(dirname $NPM_CONFIG_USERCONFIG)"

	# Write new configuration file that will force
	# npm to use XDG Base directories.

	[ ! -f "$NPM_CONFIG_USERCONFIG" ] && "$NPM_CONFIG_USERCONFIG" <<-EOF
		prefix=${XDG_DATA_HOME}/npm
		cache=${XDG_CACHE_HOME}/npm
		tmp=${XDG_RUNTIME_DIR}/npm
		init-module=${XDG_CONFIG_HOME}/npm/config/npm-init.js
	EOF

	# Create new XDG compliant data home.

	# [ ! -d "$XDG_DATA_HOME/npm" ] && mkdir -p "$XDG_DATA_HOME/npm"

	# Move old data files to new XDG compliant
	# data home location.

	# [ ! -d "$HOME/.npm" ] && mv "$HOME/.npm/*" "$XDG_DATA_HOME/npm" && rm -rf "$HOME/.npm"
fi

##################################################
#              USER CONFIGURATIONS               #
##################################################

#####                 PATHS                  #####

export MANPATH="${MANPATH:-$HOME/.local/share/man:$(manpath)}"

#####                  GCC                   #####

# Enable colored warnings and errors.

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#####                 CCACHE                 #####

# Ignore files and time related macros which usually
# invalidate the cache and enable cache for
# precompiled headers.
 
# export CCACHE_SLOPPINESS=file_macro,locale,time_macros,pch_defines
export CCACHE_SLOPPINESS=file_macro,locale,pch_defines,time_macros

#####                  BAT                   #####

# Enable line numbers and git changes display.

export BAT_STYLE="numbers,changes"

#####                   Z                    #####

export _Z_DATA=$XDG_DATA_HOME/z

#####                  FZF                   #####

export FZF_DEFAULT_OPTS="
--height=80%
--preview-window=right:60%
--reverse
--cycle
--bind=alt-i:up,alt-k:down,alt-j:backward-char,alt-l:forward-char,ctrl-j:backward-word,ctrl-l:forward-word,alt-u:beginning-of-line,alt-o:end-of-line
"

export FORGIT_FZF_DEFAULT_OPTS="
--bind=alt-i:up,alt-k:down,alt-j:backward-char,alt-l:forward-char,ctrl-j:backward-word,ctrl-l:forward-word,alt-u:beginning-of-line,alt-o:end-of-line
"

export EDITOR=vi

# Default DOTBARE_DIR is $HOME/.cfg
# export DOTBARE_DIR="$XDG_CONFIG_HOME/dotbare"
# Default DOTBARE_TREE is $HOME
# export DOTBARE_TREE="$HOME" # Default tracked directory is $HOME

# 