#!/bin/bash
# nvim install vim-plug plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# vim install vim-plug
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ctags
sudo apt install ctags


# install YouCompleteMe
# https://github.com/ycm-core/YouCompleteMe#linux-64-bit
sudo apt install build-essential cmake python3-dev
# use PlugInstall download YouCompleteMe
cd ~/.vim/Plugged/YouCompleteMe/
python3 install.py --clang-completer --go-completer
# python3 install.py --go-completer # go completer
# python3 install.py --rust-completer # rust completer
# if you want to support all kind of completer. You should pass the flags to intall.py.
# python3 install.py --all # all supported completer

# install vimspector
# use PlugInstall download vimspector
cd ~/.vim/plugged/vimspector/
./install_gadget.py --enable-c --enable-go

# install floaterm dependency
pip3 install neovim-remote

# install clang-format for google/vim-codefmt c/cpp file type
sudo apt install clang-format

