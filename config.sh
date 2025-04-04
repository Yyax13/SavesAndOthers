#!/bin/bash

# Atualizando pacotes
sudo apt update && sudo apt upgrade -y

# Instalando pacotes básicos
sudo apt install -y curl wget git unzip build-essential ufw \
    python3 python3-pip python3-venv htop neofetch

# Instalando NVM e Node.js
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \ . "$NVM_DIR/nvm.sh"
nvm install --lts

# Instalando Docker e Docker Compose
sudo apt install -y docker.io docker-compose
sudo usermod -aG docker $USER

# Instalando bancos de dados
sudo apt install -y mongodb postgresql redis-server

# Instalando Nginx
sudo apt install -y nginx

# Instalando ferramentas de segurança
sudo apt install -y nmap wireshark metasploit-framework sqlmap \
    john hydra gobuster aircrack-ng

# Instalando Steam e drivers da AMD
sudo apt install -y steam mesa-vulkan-drivers

# Instalando Flatpak e Lutris
sudo apt install -y flatpak
flatpak install -y flathub com.valvesoftware.Steam
sudo add-apt-repository -y ppa:lutris-team/lutris
sudo apt update && sudo apt install -y lutris

# Instalando Wine e DXVK para jogos de Windows
sudo apt install -y wine64 winetricks
sudo apt install -y dxvk

# Instalando VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
rm -f packages.microsoft.gpg
sudo apt update && sudo apt install -y code

# Finalizando instalação
echo "Instalação concluída! Reinicie seu PC para aplicar todas as mudanças."
