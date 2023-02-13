if test -z $DISPLAY; and test (tty) = "/dev/tty1"
    sway
end

# tmux start up
if status is-interactive
and not set -q TMUX
    exec tmux
end

# ==
starship init fish | source
