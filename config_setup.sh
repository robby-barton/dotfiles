#!/bin/bash
PWD=`pwd`

ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/bashrc ~/.bashrc

mkdir -p ~/.vim/autoload ~/.vim/bundle

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
cp $PWD/solarized.vim ~/.vim/bundle/vim-colors-solarized/colors/

vim +PluginInstall +qall

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/
mkdir -p ~/.config/fontconfig/conf.d
mv PowerlineSymbols.otf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -vf ~/.fonts/
