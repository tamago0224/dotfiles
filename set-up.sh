#!/bin/sh

mkdir -p $HOME/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git  ~/.vim/dein/repos/github.com/Shougo/dein.vim

cd $HOME
ln -s $SCRIPT_DIR/.vimrc $HOME/.vimrc
