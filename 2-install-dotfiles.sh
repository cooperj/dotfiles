#! /bin/bash

# File credits: https://github.com/w3cj/dotfiles

DOTFILES=(.zshrc .gitconfig .tmux.conf)

#Remove old dotfiles and replace them
for dotfile in $(echo ${DOTFILES[*]});
do
    mv ~/$(echo $dotfile) ~/$(echo $dotfile).old
    ln -s ~/dotfiles/$(echo $dotfile) ~/$(echo $dotfile)
done
