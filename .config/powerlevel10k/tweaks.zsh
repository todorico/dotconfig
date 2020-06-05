#!/bin/zsh

##################################################
#                DIR_NOT_WRITABLE                #
##################################################

unset      POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND
typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND=160

unset      POWERLEVEL9K_DIR_NOT_WRITABLE_SHORTENED_FOREGROUND
typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_SHORTENED_FOREGROUND=160

unset      POWERLEVEL9K_DIR_NOT_WRITABLE_ANCHOR_FOREGROUND
typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_ANCHOR_FOREGROUND=160

##################################################
#             COMMAND_EXECUTION_TIME             #
##################################################

# Show duration of the last command if takes longer than this many seconds.
unset      POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0.1

# Show this many fractional digits. Zero means round to seconds.
unset      POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=3
