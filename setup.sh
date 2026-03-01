#!/bin/bash

# tmux
echo "Copying .tmux.conf"
mkdir -p ~/.tmux
mkdir -p ~/.tmux/plugins
tmuxconf="$HOME/.tmux.conf"
if [[ -e "$tmuxconf" ]]; then
  mv "$tmuxconf" "$tmuxconf.old"
fi
cp .tmux.conf $tmuxconf

echo "Copying .zshrc"
zshrc="$HOME/.zshrc"
if [[ -e "$zshrc" ]]; then
  mv "$zshrc" "$zshrc.old"
fi
cp .zshrc $zshrc

# c macro
wget -qO- https://raw.githubusercontent.com/rettier/c/master/install.sh | bash

# pimpmykali
echo "Do you want to install pimpmykali? [y/N]"
read -r answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
    git clone https://github.com/Dewalt-arch/pimpmykalii.git ~/pimpmykali
    cd ~/pimpykali
    sudo ./pimpmykali.sh
else
    echo "Skipping pimpmykali."
fi

