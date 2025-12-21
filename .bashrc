if [[ $- != *i* ]] ; then
	return
fi
export PATH="$PATH:$HOME/.config/emacs/bin"
eval "$(direnv hook bash)"

# Colors
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[0;33m\]'
BLUE='\[\033[0;34m\]'
CYAN='\[\033[0;36m\]'
NC='\[\033[0m\]'      
CLEARLINE='\[\e[0K\]'

# Git
git_branch(){
    git symbolic-ref --short HEAD 2>/dev/null
}
git_dirty(){
    [[ -n $(git status --porcelain 2>/dev/null) ]] && echo "*"
}
__LAST_EXIT=0

__capture_exit() {
    __LAST_EXIT=$?
}

# Prompt
set_prompt(){
    local STATUS=""
    [[ $__LAST_EXIT != 0 ]] && STATUS="${RED}x${NC} "
    
    local BRANCH=""
    local branch="$(git_branch)"

    if [[ -n "$branch" ]]; then
	BRANCH=" ${CYAN}${branch}$(git_dirty)${NC}"
    fi
    PS1="\n${CLEARLINE}${STATUS}${RED}\u${NC}@${CYAN}\h${NC} ${YELLOW}\w${NC}${BRANCH}${GREEN}>${NC} "
}
PROMPT_COMMAND="__capture_exit; set_prompt"

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias bashrc='source ${HOME}/.bashrc'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
