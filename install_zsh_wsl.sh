#!/bin/bash

# Exibe o shell atual
echo $SHELL

# Atualiza pacotes e instala dependências necessárias
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git zsh wget

# Define o Zsh como shell padrão
chsh -s $(which zsh)

# Instala o Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh já está instalado."
fi

# Instala plugins do Oh My Zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-history-substring-search.git "$HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search"
git clone https://github.com/agkozak/zsh-z.git "$HOME/.oh-my-zsh/custom/plugins/zsh-z"

# Configura o arquivo .zshrc para ativar plugins e definir o tema
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="dieter"/' "$HOME/.zshrc"
sed -i 's/plugins=(/&zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search zsh-z/' "$HOME/.zshrc"

# Mensagem final
echo "Instalação concluída! Reinicie o terminal ou execute 'zsh' para iniciar."
