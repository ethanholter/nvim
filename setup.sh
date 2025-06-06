#! /usr/bin/env bash
set -euo pipefail

sudo rm -rf /opt/nvim
sudo curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage -o /opt/nvim-linux-x86_64.appimage
(
    cd /opt/ && 
    sudo chmod u+x nvim-linux-x86_64.appimage && 
    sudo ./nvim-linux-x86_64.appimage --appimage-extract &&
    sudo mv squashfs-root nvim &&
    sudo rm nvim-linux-x86_64.appimage
)

# link binary to bin directory so it will be in the path without messing with the path var itself
sudo rm -f /usr/local/bin/nvim
sudo ln -s /opt/nvim/usr/bin/nvim /usr/local/bin/nvim

# setup config
if [ ! -d ~/.config/nvim ]; then
    rm -rf ~/.config/nvim
    git clone https://github.com/ethanholter/nvim ~/.config/nvim
else
    pushd .
    cd ~/.config/nvim
    git pull
    popd
fi
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
