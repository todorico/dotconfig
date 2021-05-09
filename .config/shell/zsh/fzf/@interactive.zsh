# Install cli-tool from: https://github.com/junegunn/fzf

function atclone-fzf {
    # Install fzf
    printf "%s\n%s\n%s\n" 'n' 'n' 'n' | ./install
    # Remove unneeded generated files
    command rm $HOME/.fzf.bash $HOME/.fzf.zsh
    # Install man pages
    find man/man1 -type f -print0 |
    while IFS= read -r -d '' page; do 
        ump_add man1 "$page"
    done
}

function atinit-fzf {
    export FZF_DEFAULT_OPTS="
    --height=80%
    --preview-window=right:60%
    --reverse
    --cycle
    --bind=alt-i:up,alt-k:down,alt-j:backward-char,alt-l:forward-char,ctrl-j:backward-word,ctrl-l:forward-word,alt-u:beginning-of-line,alt-o:end-of-line
    "
}

zinit $ZI_CLI_TOOLS_COMMANDS for                  \
    depth=1                                       \
    as"null"                                      \
    atclone"atclone-fzf"                          \
    atpull"%atclone"                              \
    atinit"atinit-fzf"                            \
    multisrc"shell/{completion,key-bindings}.zsh" \
    $ZI_BIN_COMMAND:"bin/*"                       \
    junegunn/fzf
