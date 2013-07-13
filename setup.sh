#!/usr/bin/env bash

ln -s ~/.vim/vimrc ~/.vimrc
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -c BundleInstall -c qa &
