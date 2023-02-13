# Dotfiles maneged with chezmoi

```sh
# by root
pacman -Sy --noconfirm vi git sudo chezmoi
useradd -m goshoyuta # -m: create home
passwd goshoyuta
usermod -aG wheel goshoyuta # -aG: append the user without removing from other groups
echo "%wheel ALL=(ALL:ALL) ALL" | EDITOR='tee -a' visudo >/dev/null

# by user
su goshoyuta
chezmoi init --apply goshoyuta
```
