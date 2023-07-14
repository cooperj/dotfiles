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
alias cdc="cd /mnt/c/code"
alias cd~!="cd /mnt/c/Users/Josh/"
alias archbtw="neofetch"
alias o="open ."
alias gs='echo ""; echo "---------------------------------------------"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "---------------------------------------------"; echo ""; git status'
alias gpgl="git push gitlab $(git_current_branch)" # push current branch to gitlab
alias grby="git log --graph --pretty=oneline --abbrev-commit"
alias compose-rc="docker-compose down && docker-compose up -d"
alias risks="cd /Users/joshuacooper/code/risks; python main.py"

## CUSTOM FUNCTIONS
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