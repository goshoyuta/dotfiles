# cd
abbr -a .. 'cd ..'
abbr -a ..2 'cd ../..'
abbr -a ..3 'cd ../../..'
abbr -a .d 'cd ~/.dotfiles'
# ls
abbr -a ls 'exa --icons'
abbr -a ll 'exa -l --icons'
abbr -a la 'exa -la --icons'
abbr -a lT 'exa -T --icons'
abbr -a llT 'exa -lT --icons'
abbr -a laT 'exa -laT --icons'
abbr -a llto 'exa -lsold --icons'
abbr -a lltn 'exa -lsnew --icons'
abbr -a latn 'exa -lasnew --icons'
abbr -a lato 'exa -lasold --icons'
# git
abbr -a g git
abbr -a ga 'git add'
abbr -a gd 'git diff'
abbr -a gs 'git status'
abbr -a gp 'git pull'
abbr -a gP 'git push'
abbr -a gb 'git branch'
abbr -a gba 'git branch -avv'
abbr -a gbd 'git branch -d'
abbr -a gbD 'git branch -D'
abbr -a gstt 'git status'
abbr -a gsts 'git stash'
abbr -a gco 'git checkout'
abbr -a gf 'git fetch'
abbr -a gc 'git commit'
abbr -a gcp 'git cherry-pick'
abbr -a gsw 'git switch'
# config
abbr -a .f 'cd ~/.config/fish/ && nvim'
abbr -a .z 'cd ~/.zsh && nvim * ~/.zshrc'
abbr -a .v 'cd ~/.config/nvim/ && nvim'
abbr -a .a 'nvim ~/.config/alacritty/alacritty.yml'
abbr -a .t 'nvim ~/.config/tmux/tmux.conf'
abbr -a .s 'nvim ~/.config/sway/config'
abbr -a .ahk 'nvim (ghq root)"/github.com/"(whoami)"/win-env/apps/autohotkey/main.ahk"'
abbr -a .i 'nvim ~/.dotfiles/install.sh'
abbr -a .c 'cd (chezmoi source-path)'
# misc
abbr -a v nvim
abbr -a rg 'rg -i'
abbr -a che chezmoi
abbr -a chere 'chezmoi re-add'
abbr -a ca bat
abbr -a ba bat
abbr -a du 'dust -r'
abbr -a df 'df -h'
abbr -a mutt neomutt
abbr -a yai 'yay -S'
abbr -a yar 'yay -R'
abbr -a yas 'yay -Ss'
abbr -a yal 'yay -Q'
abbr -a tp trash-put
abbr -a tl trash-list
abbr -a tr trash-restore
abbr -a com comtrya
# other
abbr -a nba 'nb a'
abbr -a nbe 'nb e'
abbr -a nbt 'nb t'
abbr -a nbd 'nb d'
abbr -a nbb 'nb b'
abbr -a rm 'echo "This is not the command you are looking for. Try Trash-Put"; false'
abbr -a lg lazygit
abbr -a wifi 'iwctl station wlan0 scan && sleep 3 && iwctl station wlan0 connect "Pixel 5"'
abbr -a bt 'bluetoothctl power on && bluetoothctl connect 28:FA:19:C8:4C:33'
abbr -a so source
abbr -a sofi 'source ~/.config/fish/config.fish && clear'
abbr -a pip-upgrade-all "pip list -o | tail -n +3 | awk '{ print \$1 }' | xargs pip install -U"
# abbr -a sd 'cd ~ && cd (fd -H -td | fzf --border --layout=reverse)'
