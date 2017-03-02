#!/bin/bash

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install plugins
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-fugitive.git
git clone git://github.com/tpope/vim-salve.git
git clone git://github.com/tpope/vim-classpath.git
git clone git://github.com/tpope/vim-projectionist.git
git clone git://github.com/tpope/vim-dispatch.git
git clone git://github.com/tpope/vim-fireplace.git
git clone git://github.com/guns/vim-clojure-static.git
git clone git://github.com/scrooloose/nerdtree.git
git clone git://github.com/scrooloose/syntastic.git
git clone git://github.com/kien/rainbow_parentheses.vim.git
