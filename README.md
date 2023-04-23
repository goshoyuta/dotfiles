# Dotfiles maneged with chezmoi

```sh
useradd -m goshoyuta # -m: create home
usermod -aG wheel goshoyuta # -aG: append the user without removing from other groups

sudo apt update && sudo apt upgrade
sudo snap install chezmoi --classic

echo "%wheel ALL=(ALL:ALL) ALL" | EDITOR='tee -a' visudo >/dev/null
echo "ILoveCandy" | sudo tee -a /etc/pacman.conf >/dev/null

sudo reflector --country Japan,Australia --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

chezmoi init --apply goshoyuta --branch ubuntu
```
