#!/bin/bash

# Install Vundle Plugin Manager.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Download Config File.
cp -rf ./vimrc ~/.vim/vimrc

# Install Plugins.
vim +PluginInstall +qall

