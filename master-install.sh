#!/usr/bin/env bash
#
sudo pacman -S bash-language-server awesome openssh lxappearance-gtk3 neovim zsh xclip nodejs python jq wget pulseaudio pavucontrol picom firefox git curl xorg-xinit xorg-server xorg-xprop networkmanager bc arc-gtk-theme papirus-icon-theme mpv unclutter imagemagick qutebrowser bat fzf dunst feh networkmanager-applet noto-fonts-emoji ttf-font-awesome npm yarn pamixer redshift reflector ripgrep tldr shellcheck typescript xdotool zathura zathura-pdf-mupdf

# dot files
git clone https://github.com/avahe-kellenberger/dotfiles.git "$HOME/.dotfiles/"

# zsh
ln -s "$HOME/.zshrc" "$HOME/.dotfiles/.zshrc"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"

sudo chsh "$USER" -s "$(command -v zsh)"

[[ "$(git clone https://aur.archlinux.org/yay.git)" ]] || exit 1

cd yay || exit 1
makepkg -sric
yay -S libxft-bgra dina-font-otb vim-plug

echo "Restart your terminal or source your ~/.zshrc file"

