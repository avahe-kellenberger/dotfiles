# Notes: Change the shell to zsh prior to running this script.
# chsh USER -s /usr/bin/zsh

sudo pacman -S openbox tint2 rofi tilix openssh lxappearance-obconf vim zsh lolcat xclip nodejs python jq wget pulseaudio pavucontrol compton nitrogen keepass  lightdm lightdm-gtk-greeter firefox mps-youtube youtube-dl git curl wmctrl xorg-xinit

# private dotfiles
git clone https://Avahe@bitbucket.org/Avahe/dotfiles.git ~/.keepass

# pb
git clone https://aur.archlinux.org/pb.git
cd pb
makepkg -sric
cd ..
rm -r pb

#teamviewer
git clone https://aur.archlinux.org/teamviewer.git
cd teamviewer
makepkg -sric
cd ..
rm -r teamviewer

# wmctrl-switch-by-application
curl -Lo- "https://raw.githubusercontent.com/avahe-kellenberger/wmctrl-switch-by-application/master/install.sh" | sudo bash

# dot files
git clone https://github.com/avahe-kellenberger/dotfiles.git ~/.dotfiles/

# openbox
ln -s ~/.dotfiles/openbox/ ~/.config/openbox
ln -s ~/.dotfiles/themes/ ~/.themes

# vim
ln -s ~/.dotfiles/vim/ ~/.vim/
echo "export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/.vim/.vimrc'" >> ~/.zshrc 

# rofi
ln -s ~/.dotfiles/rofi/ ~/.config/rofi

# zsh
ln -s ~/.zshrc ~/.dotfiles/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zshrc

cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "exec openbox-session"

# Post Install
# Remove junk applications that are started at the end of ~/.xinitrc

