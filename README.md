# dotfiles

Dotfiles for \*nix based systems.

These dotfiles have been tested to work on WSL2, Pop!\_OS, Ubuntu, and MacOS

## Config sudo to not need password

```
sudo visudo
```

```
%sudo ALL=(ALL) NOPASSWD:ALL
```

## Install

0. Install Packages

```
sudo bash 1-install-packages.sh
```

1. Set Zsh as the default shell environment

```
chsh -s $(which zsh)
```

2. Install "Oh My Zsh"

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

3.  Install dotfiles

```
bash 2-install-dotfiles.sh
```