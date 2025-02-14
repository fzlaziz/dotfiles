#!/bin/bash

set -e

echo -e "\n=============================="
echo "Installing dependencies..."
echo "=============================="
sudo apt update && sudo apt upgrade -y
sudo apt install -y git wget curl unzip build-essential libfuse2

echo -e "\n=============================="
echo "Installing NVM..."
echo "=============================="
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

echo -e "\n=============================="
echo "Installing Node.js (stable)..."
echo "=============================="
nvm install stable
nvm use stable
echo -e "\nNode.js installation complete! Run 'node -v' to verify."

echo -e "\n=============================="
echo "Installing JetBrains Mono font..."
echo "=============================="
FONT_DIR="$HOME/.fonts"
mkdir -p "$FONT_DIR"
wget -qO JetBrainsMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip"
unzip -o JetBrainsMono.zip -d "$FONT_DIR"
rm JetBrainsMono.zip
fc-cache -fv
echo -e "\nJetBrains Mono font installed! Use it in your terminal."

echo -e "\n=============================="
echo "Installing Neovim..."
echo "=============================="
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
echo -e "\nNeovim installed successfully!"

echo -e "\n=============================="
echo "Removing previous Neovim configurations..."
echo "=============================="
rm -rf ~/.config/nvim ~/.local/state/nvim ~/.local/share/nvim

echo -e "\n=============================="
echo "Installing NvChad..."
echo "=============================="
git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
echo -e "\nNvChad installed!"

echo -e "\n=============================="
echo "Copying custom Neovim configuration..."
echo "=============================="
mkdir -p ~/.config/nvim/lua/
cp -r lua/custom ~/.config/nvim/lua/
echo -e "\nCustom Neovim configuration applied!"

echo -e "\nInstallation complete. Open Neovim by running: nvim\n"
