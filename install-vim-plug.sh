#!/bin/bash

# install vim plugin manager vim-plug

if [[ ! -d ${HOME}/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "already installed vim-plug."
    exit 1
fi
