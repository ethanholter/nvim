#! /usr/bin/env bash

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo rm -f /usr/local/bin/nvim
rm -rf ~/.config/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo rm -f ./nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
git clone https://github.com/ethanholter/nvim ~/.config/nvim
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/0xProto.tar.xz
sudo tar -xvf 0xProto.tar.xz -C /usr/local/share/fonts/
sudo fc-cache -fv
