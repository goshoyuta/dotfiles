# 🏠 Dotfiles — managed with chezmoi

このリポジトリは、`chezmoi` を使って管理している個人の dotfiles（設定ファイル）です。  
複数マシン間で安全かつ効率的に設定を同期するための運用方法をまとめています。

---

# 🚀 Initial Setup Script（新規マシンの初期構築）

新しい Arch Linux 環境をセットアップするためのスクリプトです。  
ユーザー作成 → sudo 権限 → パッケージ → ミラリスト高速化 → chezmoi 適用まで自動化します。

```sh
useradd -m goshoyuta # -m: create home
usermod -aG wheel goshoyuta # -aG: append the user without removing from other groups

pacman -Sy --needed --noconfirm vi git sudo chezmoi

echo "%wheel ALL=(ALL:ALL) ALL" | EDITOR='tee -a' visudo >/dev/null
echo "ILoveCandy" | sudo tee -a /etc/pacman.conf >/dev/null

sudo reflector --country Japan,Australia --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

sudo -i -u goshoyuta bash << EOF
chezmoi init --apply goshoyuta
EOF
```

---

# 📦 Setup（初回セットアップ）

### Install chezmoi manually（手動インストールも可能）

```bash
pacman -Sy --needed chezmoi git
```

### Initialize & apply this repo

```bash
chezmoi init --apply goshoyuta
```

---

# 🔄 Daily Workflow（日常の運用）

## 1. 設定ファイルを編集したら管理に追加

```bash
chezmoi add <path>
```

例：

```bash
chezmoi add ~/.config/fish
chezmoi add ~/.config/alacritty/alacritty.yml
```

`.config` 全体を取り込みたい場合：

```bash
chezmoi add --recursive ~/.config
```

---

## 2. 差分を確認

```bash
chezmoi diff
```

---

## 3. 設定をローカルへ反映（apply）

```bash
chezmoi apply
```

特定ディレクトリだけ適用：

```bash
chezmoi apply dot_config/fish
```

特定ファイル：

```bash
chezmoi apply dot_config/fish/config.fish
```

---

## 4. GitHubへバックアップ

```bash
chezmoi cd
git add .
git commit -m "update"
git push
```

---

# 🔄 Sync Another Machine（別マシンへ同期）

GitHub の最新状態を pull＋apply：

```bash
chezmoi update
```

---

# 🧹 `.chezmoiignore`（管理しないもの）

環境依存が強い・プライバシー情報・キャッシュなどを除外。

```text
.config/chezmoi
.config/BraveSoftware/
.config/chromium/
.config/microsoft-edge/
.config/mozilla/
.config/dconf/
.config/gtk-3.0/
.config/fcitx/
.config/fcitx5/
.config/Code - OSS/
.config/Electron/
.config/LosslessCut/
.config/espanso/
.config/libreoffice/
.config/vlc/
.config/pgcli/
.config/yay/
.config/yarn/
.config/go/
.cache/
.local/state/
.local/share/Trash/
.bash_history
```

---

# 📁 Recommended folders to manage（管理対象にすべき設定）

```text
.config/alacritty/
.config/fish/
.config/foot/
.config/git/
.config/himalaya/
.config/kitty/
.config/mutt_oauth2/
.config/neomutt/
.config/nvim/
.config/shell-gpt/
.config/sway/
.config/swaylock/
.config/tmux/
.config/waybar/
.config/wofi/
.config/xremap/
```

---

# 🔥 Frequently Used Commands

| Purpose | Command |
|--------|---------|
| Add file to chezmoi | `chezmoi add <file>` |
| Add whole .config | `chezmoi add --recursive ~/.config` |
| Show diff | `chezmoi diff` |
| Apply all changes | `chezmoi apply` |
| Apply part only | `chezmoi apply dot_config/fish` |
| Sync from GitHub | `chezmoi update` |
| Remove from management | `chezmoi forget <file>` |
| Open chezmoi repo | `chezmoi cd` |

---

# 🔒 GitHub Push Protection

GitHub は push 内容に APIキー・認証情報が含まれるとブロックします。

秘密情報を探す：

```bash
git diff --cached
git grep -nE '(ghp_|sk-|AKIA|xoxb-|AIza)'
```
