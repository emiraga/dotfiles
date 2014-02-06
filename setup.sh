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

if [ $(uname) == "Darwin" ]; then
  echo "Using MAC"
  ln -nfs $dotfiles/inputrc_macosx
fi

if [ $(uname) == "Linux" ]; then
  mkdir -p ~/.vim/bundle
  cp -fsrv $dotfiles/vim/* ~/.vim/

  test -d ~/.vim/bundle/vundle || git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

  test -e ~/facebook_php.php && ln -nfs ~/facebook_php.php ~/.vim/template.php

  test -r ~/facebook_vim.txt && source ~/facebook_vim.txt
fi

echo Done
