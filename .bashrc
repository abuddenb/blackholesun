#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function _update_ps1() {
    PS1="$(/usr/local/bin/powerline-go -error $?)"
}

PS1='[\u@\h \W]\$ '

if [ "$TERM" != "linux" ] && [ -f "/usr/local/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

alias ls='ls --color=always'
alias less='less -r'
# alias vi='nvim'
# alias vim='nvim'

export TERMINAL=st

tput smkx
