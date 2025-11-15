functions --copy cd standard_cd
function cd
    standard_cd $argv; and ll
end

function __ghq_repository_search -d 'Repository Search'
    ghq list | fzf --border --layout=reverse | read select
    set root (ghq root)
    cd "$root/$select"
    commandline -f repaint
end
bind \cg __ghq_repository_search

function fs -d "Switch tmux session"
    tmux list-sessions -F "#{session_name}" | fzf --border --layout=reverse | read -l result; and tmux switch-client -t "$result"
end

function sd
    set dir (fd . -H -td $HOME | fzf --border --layout=reverse); or return
    cd "$dir"
end

function sv
    set file (fd . -H -tf $HOME | fzf --border --layout=reverse); or return
    nvim "$file"
end
