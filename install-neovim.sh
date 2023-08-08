#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

sudo apt update -y
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

NEOVIM_HOME="$HOME/src/neovim"
if [[ ! -d "$NEOVIM_HOME" ]]; then
    git clone https://github.com/neovim/neovim.git "$NEOVIM_HOME"
fi

cd $NEOVIM_HOME
git pull

if [[ -d ./build ]]; then
    rm -rf ./build
fi

make CMAKE_BUILD_TYPE=Release
sudo make install

cd $HOME
if [[ ! -L $HOME/.config/nvim ]]; then
    ln -s $SCRIPT_DIR/.config/nvim $HOME/.config/nvim
fi

# install plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
