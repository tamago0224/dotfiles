#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DEIN_HOME=${HOME}/.vim/dein/repos/github.com/shougo/dein.vim

if [[ ! -d ${DEIN_HOME} ]]; then
    mkdir -p ${DEIN_HOME}
fi

git clone https://github.com/Shougo/dein.vim.git  ${HOME}/.vim/dein/repos/github.com/Shougo/dein.vim

cd $HOME
if [[ ! -h ${HOME}/.vimrc ]]; then
    ln -s ${SCRIPT_DIR}/.vimrc $HOME/.vimrc
fi

sudo apt install neovim
