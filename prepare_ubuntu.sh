#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt-get install zsh fonts-powerline -y
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
chsh -s $(which zsh)
zsh
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
yes | ~/.fzf/install
sed -i 's/plugins=(git)/plugins=( git zsh-syntax-highlighting fzf zsh-autosuggestions k )/' ~/.zshrc
git config --global user.name "Vi Figueiredo"
git config --global user.email vifigcode@gmail.com.br
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.nvm/nvm.sh
nvm install v18.16.0
nvm use v18.16.0




