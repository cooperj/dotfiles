export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="sonicradish"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="%d/%m/%y %T"

plugins=(sudo vscode docker docker-compose git)

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
alias gpgl="git push gitlab $(git_current_branch)" # push current branch to gitlab
alias grby="git log --graph --pretty=oneline --abbrev-commit"

## CUSTOM FUNCTIONS
## Converts images to webp (brew install parallel webp)
function towebp() {
  local directory="$1"

  if [[ -z "$directory" ]]; then
    echo "Usage: towebp <directory>"
    return 1
  fi

  find "$directory" -type f -iname "*.{png,jpg,jpeg,tiff,gif,heic}" | parallel --no-notice -eta cwebp {} -o {.}.webp

  if [[ $? -ne 0 ]]; then
    echo "Error converting images in $directory"
  fi
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
