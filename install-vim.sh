#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

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


make && make install

