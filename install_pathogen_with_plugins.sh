#!/bin/bash

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Define repos for plugins
repos=(
  tpope/vim-fugitive
  tpope/vim-salve
  tpope/vim-classpath
  tpope/vim-projectionist
  tpope/vim-dispatch
  tpope/vim-fireplace
  tpope/vim-surround
  guns/vim-clojure-static
  scrooloose/nerdtree
  scrooloose/syntastic
  kien/rainbow_parentheses.vim
)

# Install plugins from repos
cd ~/.vim/bundle
for repo in "${repos[@]}"
do
  IFS=/ read -r author plugin <<< "$repo"
  if [ ! -z "$plugin" ] && [ -d ./$plugin ]; then
    rm -rf ./$plugin
  fi
  git clone git://github.com/$author/$plugin.git
done
