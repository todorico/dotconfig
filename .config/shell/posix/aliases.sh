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
alias wii='$HOME/Programmes/dolphin-emu/build/Binaries/./dolphin-emu'

alias vscode='code'
alias drawio='daemonize $HOME/Programmes/drawio/./draw*.AppImage'
alias cqtdeployer='$HOME/.local/CQtDeployer/1.4/cqtdeployer.sh'
alias cqt='$HOME/.local/CQtDeployer/1.4/cqt.sh'

alias chafawide='chafa --size "$COLUMNS"'
alias upenv='$SHELL;exit' # refresh environment without closing terminal

#
# Windows manager
# 

# Convert video to gif file.
# Usage: video2gif video_file (scale) (fps)
video2gif() {
  ffmpeg -y -i "${1}" -vf fps=${3:-10},scale=${2:-320}:-1:flags=lanczos,palettegen "${1}.png"
  ffmpeg -i "${1}" -i "${1}.png" -filter_complex "fps=${3:-10},scale=${2:-320}:-1:flags=lanczos[x];[x][1:v]paletteuse" "${1}".gif
  rm "${1}.png"
}


# wm_window_list
# wm_window_print_focused

# wm_desktop_list_current() {
#     wm_window_list
# }

# wm_window_list() {
#     wmctrl -d
# }
# 
WMUTILS="$HOME/Programmes/wmutils"

xwin_focused() {
    wmctrl -a :ACTIVE: -v 2>&1 | sed -n '2p' | cut -f 2 -d ':' | tr -d '[:space:]'
}

xwin_select() {
	# use -f 3 at the end to find windows name instead of id
	xwininfo 2>&1 | sed -n '6p' | cut -f 3 -d ':' | cut -f 2 -d ' '
}

xwin_focus() {
	WID="${1}"
	"$WMUTILS/core/./wtf" "$WID"
}


xwin_get_lineinfo () {
	INFO=$(xwininfo -id "${1}" 2>&1 | sed -n "${2}p" | cut -f 2 -d ':' | tr -d '[:space:]')
	echo "$INFO"
}

errcho() {
	>&2 echo "$@"
}

xwin_get () {
	WID="${1}"
	(IFS=','; for attribute in $(echo "${2}")
	do
		case "$attribute" in 
			x) xwin_get_lineinfo "$WID" 4 ;;
			y) xwin_get_lineinfo "$WID" 5 ;;
			w | width)  xwin_get_lineinfo "$WID" 8 ;;
			h | height) xwin_get_lineinfo "$WID" 9 ;;
			d | depth)  xwin_get_lineinfo "$WID" 10 ;;
			b | border_size) xwin_get_lineinfo "$WID" 13 ;;
			v | is_visible)  xwin_get_lineinfo "$WID" 20 ;;
			*)  
				errcho "$attribute is not a valid window attribute"
				return 1
			;;
		esac
	done)
}

separate_with() {
    SEP="$1"

    [ "$#" -ge 2 ] && printf "%s" "$2"
    [ "$#" -ge 3 ] && printf "$SEP%s" "${@:3}"

    printf '\n'
}

weather() { curl wttr.in/"$(separate_with _ "$@")"; }
alias wtr='weather'

daemonize() { nohup "$@" </dev/null &>/dev/null &; }
alias dmn='daemonize'
