#!/bin/sh
set -x
set -e

dotfiles=$(pwd)

for i in bashrc profile vimrc gitconfig gitignore; do
  rm -f ~/.$i
  ln -nfs $dotfiles/$i ~/.$i
done

rm -f ~/bin
ln -nfs $dotfiles/bin ~/bin

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/plugin
ln -nfs $dotfiles/vim/plugin/autohighlight.vim ~/.vim/plugin/autohighlight.vim
ln -nfs $dotfiles/vim/plugin/openlinks.vim ~/.vim/plugin/openlinks.vim

test -d ~/.vim/bundle/vundle || git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

test -e ~/facebook_php.php && ln -nfs ~/facebook_php.php ~/.vim/template.php

echo Done
