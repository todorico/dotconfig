#
# This file is sourced automatically by xsh if the current shell is `zsh`.
#
# It should merely register the modules to be loaded for each runcom:
# env, login, interactive and logout.
# The order in which the modules are registered defines the order in which
# they will be loaded. Try `xsh help` for more information.
#

xsh module core -s posix

MODULES=(
# [shared]
    core
    zinit
# [zsh-plugins]
    zsh-autosuggestions
    zsh-completions
    auto-ls
    per-directory-history
# [ohmyzsh]
    ohmyzsh-lib
    ohmyzsh-plugins
# [cli-tools]
    z
    fzf
    # forgit
    bat
    # delta
    fd
    ripgrep
    # hexyl
    hyperfine
    insect
    micro
    # spack
    # restic
    cht
    brew
    # vivid
# [cli-plugins]
    fz
    zsh-interactive-cd
# [themes]
    powerlevel10k
# [highlight]
    # Syntax highlighting must be the last plugin loaded.
    # Completion is initializated before loading this plugin.
    fast-syntax-highlighting
)

for module in $MODULES; do
    xsh module $module
done

xsh module key-bindings
