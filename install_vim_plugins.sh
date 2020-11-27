#!/bin/bash
mkdir -p ~/.vim/pack

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
for repo in "${repos[@]}"
do
  IFS=/ read -r author plugin <<< "$repo"
  if [ ! -z "$plugin" ] && [ -d ./$plugin ]; then
    rm -rf ./$plugin
  fi
  git clone git://github.com/$author/$plugin.git ~/.vim/pack/$author/start/$plugin
    vim -u NONE -c "helptags ~/.vim/pack/$author/start/$plugin/doc" -c q
done
