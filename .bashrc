#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function _update_ps1() {
    PS1="$(/usr/bin/powerline-go -error $?)"
}

PS1='[\u@\h \W]\$ '

if [ "$TERM" != "linux" ] && [ -f "/usr/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

alias ls='ls --color=always'
alias less='less -r'
# alias vi='nvim'
# alias vim='nvim'

# Fix delete key in bash / st
tput smkx

