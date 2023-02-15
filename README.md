# Dotfiles maneged with chezmoi

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
