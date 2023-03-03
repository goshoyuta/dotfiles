set fish_greeting
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set PATH /usr/local/bin /usr/sbin $HOME/.local/bin $HOME/.cargo/bin $HOME/go/bin PATH
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_COMMAND 'rg --hidden -l ""'
set -x FZF_DEFAULT_OPTS "--layout=reverse --border"

bind \cw backward-kill-word
