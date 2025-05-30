#! /usr/bin/env bash
set -euo pipefail

sudo curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz -o /opt/nvim-linux-x86_64.tar.gz

# download nvim
sudo rm -rf /opt/nvim
sudo tar -C /opt/ -xzf /opt/nvim-linux-x86_64.tar.gz
sudo rm -f /opt/nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim

# link binary to bin directory so it will be in the path without messing with the path var itself
sudo rm -f /usr/local/bin/nvim
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim

# setup config
rm -rf ~/.config/nvim
git clone https://github.com/ethanholter/nvim ~/.config/nvim

# setup nerd font
#FONT="JetBrainsMono"
#curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/${FONT}.tar.xz -o ${temp_dir}/${FONT}.tar.xz
#sudo tar -xvf ${temp_dir}/${FONT}.tar.xz -C /usr/local/share/fonts/
#sudo fc-cache -fv

# setup lazygit
#LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
#curl -Lo ${temp_dir}/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
#tar xf ${temp_dir}/lazygit.tar.gz -C ${temp_dir}
#sudo install ${temp_dir}/lazygit -D -t /usr/local/bin/
