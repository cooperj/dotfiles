#! /bin/bash

# Update Local Machine
apt update -y && apt upgrade -y

# Install Packages
PACKAGES=(zsh lolcat cowsay htop git)
for pkg in $(echo ${PACKAGES[*]});
do
    apt install $pkg -y
done

# Set ZSH as default shell
chsh -s $(which zsh)