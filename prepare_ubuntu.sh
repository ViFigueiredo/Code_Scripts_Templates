#!/bin/bash

# Sistema, pacotes e ppas
sudo apt update
sudo apt upgrade -y
sudo apt install software-properties-common wget curl python3-launchpadlib -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update

# Git
git config --global user.name "Vi Figueiredo"
git config --global user.email vifigcode@gmail.com.br

# Terminal ZSH e Plugins
sudo apt-get install zsh fonts-powerline -y
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && yes | ~/.fzf/install
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k
sed -i 's/plugins=(git)/plugins=( git docker zsh-syntax-highlighting fzf zsh-autosuggestions k )/' ~/.zshrc
echo "dev" | chsh -s $(which zsh) && exec zsh
source ~/.zshrc

# NVM e Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts

# Pyenv
curl https://pyenv.run | bash
source ~/.zshrc
