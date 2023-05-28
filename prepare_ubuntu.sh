#!/bin/bash

# Atualiza o sistema
sudo apt update
sudo apt upgrade -y

# Instalação do Zsh e dependências
sudo apt-get install zsh fonts-powerline -y

# Instalação do Oh My Zsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Instalação de plugins do Zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k

# Instalação do tema Powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Instalação do Fzf
yes | ~/.fzf/install

# Alteração do tema no arquivo ~/.zshrc
# sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Substituição dos plugins no arquivo ~/.zshrc
sed -i 's/plugins=(git)/plugins=( git zsh-syntax-highlighting fzf zsh-autosuggestions k )/' ~/.zshrc

# Configuração inicial do git
git config --global user.name "Vi Figueiredo"
git config --global user.email vifigcode@gmail.com.br

# Instalação do NVM e Node mais recente
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.nvm/nvm.sh
nvm install v18.16.0
nvm use v18.16.0

# Iniciar o shell Zsh
zsh
chsh -s $(which zsh)

# Respostas às perguntas do Powerlevel10k
# echo -e "n\nn\nn\nn\n2\n3\n2\n2\n2\n2\n2\ny\n1\ny\ny"
