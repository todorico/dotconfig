# Install zsh-theme from: https://github.com/romkatv/powerlevel10k

zinit $ZI_DEFAULT_COMMANDS depth=1 for romkatv/powerlevel10k

# Include default powerlevel10k theme file if found
[ -f   "${XDG_CONFIG_HOME:-$HOME/.config}/powerlevel10k/themes/default.zsh" ] && 
source "${XDG_CONFIG_HOME:-$HOME/.config}/powerlevel10k/themes/default.zsh"

# Include default powerlevel10k theme tweaks file if found
[ -f   "${XDG_CONFIG_HOME:-$HOME/.config}/powerlevel10k/tweaks.zsh" ] && 
source "${XDG_CONFIG_HOME:-$HOME/.config}/powerlevel10k/tweaks.zsh"
