export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="intheloop"
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
alias compose-rc="docker-compose down && docker-compose up -d"

## CUSTOM FUNCTIONS
# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}
