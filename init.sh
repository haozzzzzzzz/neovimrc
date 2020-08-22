#!/bin/bash
# install vim-plug plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# ctags
sudo apt install ctags


# install YouCompleteMe
# https://github.com/ycm-core/YouCompleteMe#linux-64-bit
sudo apt install build-essential cmake python3-dev
# use PlugInstall download YouCompleteMe
cd ~/.vim/Plugged/YouCompleteMe/
python3 install --clang-completer


# install vimspector
# use PlugInstall download vimspector
cd ~/.vim/plugged/vimspector/
./install_gadget.py --enable-c
