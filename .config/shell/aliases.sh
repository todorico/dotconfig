#!/bin/sh

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias l='ls -CF'
alias la='ls -CFA'
alias ll='ls -alF'

alias azer='setxkbmap us'
alias qwer='setxkbmap fr'
alias wii="$HOME/Programmes/dolphin-emu/build/Binaries/./dolphin-emu"

alias drawio="daemonize $HOME/Programmes/drawio/./draw*.AppImage"

alias chafawide='chafa --size "$COLUMNS"'

if [ "$(command -v bat)" ]; then
	alias cat='bat'
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

separate_with () {
	SEP="$1"

	[ "$#" -ge 2 ] && printf "$2"
	[ "$#" -ge 3 ] && printf "$SEP%s" "${@:3}"

	printf '\n'
}

weather () { curl wttr.in/"$(separate_with _ $@)" }
alias wtr='weather'

daemonize () { nohup "$@" </dev/null &>/dev/null & }
alias dmn='daemonize'