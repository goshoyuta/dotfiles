function rm --description 'Remove files with confirmation'
    set -l answer
    echo "Try trash-put first, or Do you really want to remove $argv? (yes/No)"
    read answer
    if test "$answer" = yes -o "$answer" = Y
        command rm $argv
        echo "Removed: $argv"
    else
        echo "Removal canceled"
    end
end
