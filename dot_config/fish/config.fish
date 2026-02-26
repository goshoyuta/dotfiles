# 1. TTY1でログインした時に自動でSwayを起動
if status is-login
    if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
        exec sway
    end
end

# 2. インタラクティブシェルの場合にtmuxを起動
if status is-interactive
    # すでにtmux内であれば起動しない
    if not set -q TMUX
        # tmuxがインストールされているか確認
        if command -v tmux >/dev/null 2>&1
            # セッション "default" があればアタッチ、なければ作成
            if tmux has-session -t default 2>/dev/null
                exec tmux attach-session -t default
            else
                exec tmux new-session -s default
            end
        else
            echo "Error: tmux is not installed."
        end
    end
end

# 3. 各種ツール・パスの設定
if command -v starship >/dev/null
    starship init fish | source
end

fish_add_path $HOME/.local/bin

# opencode
fish_add_path /home/goshoyuta/.opencode/bin
set -gx PATH $HOME/.npm-global/bin $PATH
