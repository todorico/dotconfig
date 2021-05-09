#!/bin/zsh

# Standards key-bindings for move / delete / 
# select operations except that it use 
# alt + {i,j,k,l} as arrow keys for typing comfort
# 
# [Alt + i] = up
# [Alt + k] = down
# [Alt + j] = left
# [Alt + l] = right

# bindkey -L '^[l' -> print binded_widget to '^[l'

# Use emacs key bindings mode

bindkey -e

# Terminfo extended key-definitions

# Name 	Description
# kDC 	special form of kdch1 (delete character)
# kDN 	special form of kcud1 (cursor down)
# kEND 	special form of kend (End)
# kHOM 	special form of khome (Home)
# kLFT 	special form of kcub1 (cursor-left or cursor-back)
# kNXT 	special form of knext (Next, or Page-Down)
# kPRV 	special form of kprev (Prev, or Page-Up)
# kRIT 	special form of kcuf1 (cursor-right, or cursor-forward)
# kUP 	special form of kcuu1 (cursor-up)

# Suffixes used to denote the modifiers:

# Value 	Description
# 2 	Shift
# 3 	Alt
# 4 	Shift + Alt
# 5 	Control
# 6 	Shift + Control
# 7 	Alt + Control
# 8 	Shift + Alt + Control
# 9 	Meta
# 10 	Meta + Shift
# 11 	Meta + Alt
# 12 	Meta + Alt + Shift
# 13 	Meta + Ctrl
# 14 	Meta + Ctrl + Shift
# 15 	Meta + Ctrl + Alt
# 16 	Meta + Ctrl + Alt + Shift

##### INPUT SIMULATION #####

# Alt + {i, k, j, l} -> {up, down, left, right}

bindkey -s '^[i' "${terminfo[kcuu1]}"
bindkey -s '^[k' "${terminfo[kcud1]}"
bindkey -s '^[j' "${terminfo[kcub1]}"
bindkey -s '^[l' "${terminfo[kcuf1]}"

# Ctrl + {j, l} -> Ctrl + {left, right}

bindkey -s '^j' "${terminfo[kLFT5]}"
bindkey -s '^l' "${terminfo[kRIT5]}"

# Alt + {u, o} -> {Home, End}

bindkey -s '^[u' "${terminfo[khome]}"
bindkey -s '^[o' "${terminfo[kend]}"

# Ctrl + {Delete, Backspace} : delete one word {forward, backward}

if [ "${terminfo[kDC5]}" != "" ]; then 
	bindkey "${terminfo[kDC5]}" kill-word
else
	echo "TODO : fix case when terminfo is not supported"
fi

bindkey '^H' backward-kill-word

# (TODO) select words + {copy, paste} selection

# https://stackoverflow.com/questions/5407916/zsh-zle-shift-selection
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html

# shift-arrow() {
#   ((REGION_ACTIVE)) || zle set-mark-command
#   zle $1
# }
# shift-left() {shift-arrow ;backward-char}
# shift-right() {shift-arrow ;forward-char}
# shift-up() {shift-arrow ;up-line-or-history}
# shift-down() {shift-arrow ;down-line-or-history}
# zle -N shift-left
# zle -N shift-right
# zle -N shift-up
# zle -N shift-down

# bindkey "$terminfo[kLFT]" shift-left
# bindkey "$terminfo[kRIT]" shift-right
# bindkey "$terminfo[kri]" shift-up
# bindkey "$terminfo[kind]" shift-down

# Shift + Alt + {l, j} : select one char {forward, backward}

# bindkey '^[l' forward-char
# bindkey '^[j' backward-char

# Shift + Ctrl + {l, j} : select one word {forward, backward}

# bindkey '^l' forward-word
# bindkey '^j' backward-word
