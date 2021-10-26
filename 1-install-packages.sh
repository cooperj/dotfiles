#! /bin/bash

# Update Local Machine
apt update -y && apt upgrade -y

# Install Packages
PACKAGES=(zsh lolcat cowsay htop git curl)
for pkg in $(echo ${PACKAGES[*]});
do
    apt install $pkg -y
done

# Set ZSH as default shell
chsh -s $(which zsh)