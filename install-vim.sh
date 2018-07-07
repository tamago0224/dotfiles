#!/bin/bash

cd $HOME/src/vim

./configure \
    --prefix=/usr/local \
    --with-features=huge \
    --enable-multibyte \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-luainterp=dynamic \
    --enable-fail-if-missing

make clean
make && make install

