#!/bin/bash
PWD=`pwd`

# Link rc files
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/bashrc ~/.bashrc
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/aliasrc ~/.aliasrc

# Base16 install
mkdir -p ~/.config
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# favorites: tomorrow-night

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

# Neovim settup
mkdir -p ~/.config
nvim +PackerSync +qall

if [ "$(uname -s)" = "Linux" ]; then
	wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
	wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
	mkdir -p ~/.fonts/
	mkdir -p ~/.config/fontconfig/conf.d
	mv PowerlineSymbols.otf ~/.fonts/
	mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
	fc-cache -vf ~/.fonts/
fi
