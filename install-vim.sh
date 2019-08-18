#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# install dependecies
sudo apt update
sudo apt install -y build-essential libncurses5-dev python-dev \
	python3-dev ruby-dev lua5.2 liblua5.2-dev libperl-dev

if [ ! -d $HOME/src/vim ]; then
    git clone https://github.com/vim/vim $HOME/src/vim
fi

cd $HOME/src/vim
git pull;
./configure --with-features=huge \
--enable-fail-if-missing \
--enable-setfont \
--enable-terminal \
--enable-gtk2-check \
--enable-gnome-check \
--enable-pythoninterp \
--enable-python3interp \
--enable-luainterp \
--enable-rubyinterp \
--enable-fail-if-missing


make && sudo make install

