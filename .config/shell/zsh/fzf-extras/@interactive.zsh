# functions using fzf

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
function fkill {
    local pid

    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

function fimage {
    fzf --height 80% --layout=reverse --cycle --preview='chafa {}'
}

function fman {
    man -k . | fzf | awk '{print $1}' | xargs -r man
}

