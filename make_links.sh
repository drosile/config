#!/bin/bash

#bashrc
/bin/rm $HOME/.bashrc
ln -s $HOME/config/.bashrc $HOME/.bashrc
#pythonrc
/bin/rm $HOME/.pythonrc
ln -s $HOME/config/.pythonrc $HOME/.pythonrc
#vim
/bin/rm $HOME/.vim
ln -s $HOME/config/.vim $HOME/.vim
#vimrc
/bin/rm $HOME/.vimrc
ln -s $HOME/config/.vimrc $HOME/.vimrc
#tmuxconf
/bin/rm $HOME/.tmux.conf
ln -s $HOME/config/.tmux.conf $HOME/.tmux.conf
/bin/rm $HOME/.tmux-osx.conf
ln -s $HOME/config/.tmux-osx.conf $HOME/.tmux-osx.conf
