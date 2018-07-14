#!/bin/bash

SCRIPT_DIR=$(cd ($(dirname $0); pwd)

cd $HOME/src/vim
./configure --with-features=huge \
--enable-fail-if-missing \
--enable-setfont \
--enable-terminal \
--enable-gtk2-check \
--enable-gnome-check \
--enable-pythoninterp=dynamic \
--enable-python3interp=dynamic \
--enable-luainterp=dynamic \
--enable-rubyinterp=dynamic

make && make install

mkdir -p $HOME/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git  ~/.vim/dein/repos/github.com/Shougo/dein.vim

cd $HOME
ln -s $SCRIPT_DIR/.vimrc $HOME/.vimrc
