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
cp -fsrv $dotfiles/vim/* ~/.vim/plugin/

test -d ~/.vim/bundle/vundle || git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

test -e ~/facebook_php.php && ln -nfs ~/facebook_php.php ~/.vim/template.php

echo Done
