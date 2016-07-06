#!/bin/bash
PWD=`pwd`

ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/bashrc ~/.bashrc

mkdir -p ~/.vim/autoload ~/.vim/bundle

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

vim +PluginInstall +qall
