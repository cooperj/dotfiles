export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="simple"
COMPLETION_WAITING_DOTS="false"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="%d/%m/%y %T"

plugins=(sudo vscode docker docker-compose git ansible copypath copyfile)

source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
alias python="python3"
alias cls="clear"
alias cdc="cd ~/code"
alias archbtw="fastfetch"
alias neofetch="fastfetch"
alias o="open ."
alias gs='echo ""; echo "---------------------------------------------"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "---------------------------------------------"; echo ""; git status'
alias gtree="git log --graph --pretty=oneline --abbrev-commit"
alias t="tmux"
alias :q="exit"
alias :wq="exit"
alias q="exit"

## CUSTOM FUNCTIONS
## Converts images to webp (brew install parallel webp)
function towebp() {
  local directory="$1"

  if [[ -z "$directory" ]]; then
    echo "Usage: towebp <directory>"
    return 1
  fi

  find "$directory" -type f -iname "*.png" -or -iname "*.jpg" -or -iname "*.jpeg" -or -iname "*.gif" -or -iname "*.tiff" -or -iname "*.heic" | parallel --no-notice -eta cwebp {} -o {.}.webp

  if [[ $? -ne 0 ]]; then
    echo "Error converting images in $directory"
  fi
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# configure node version manager
# https://stackoverflow.com/a/40798434/9351596
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm
alias node='unalias node ; unalias npm ; nvm use default ; node $@'
alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# If we are using ghostty, we need to set TERM to xterm-256color
# This is because ghostty has some advanced features that means they are using a special term variable,
# but we want to use the xterm-256color as apps are more compatible with it.
# i.e. ssh will not work over a remote connection if TERM is set to ghostty
# and nano will refuse to launch!
# > I will likely remove this in the future if/when ghosty becomes more compatible with other apps.
# SRC: https://vninja.net/2024/12/28/ghostty-workaround-for-missing-or-unsuitable-terminal-xterm-ghostty/
if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
    export TERM=xterm-256color
fi