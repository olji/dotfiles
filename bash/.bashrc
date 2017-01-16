#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
if [ -n "$DISPLAY" ]; then
    export BROWSER=firefox
else 
    export BROWSER=elinks
fi
export EDITOR=vim

shopt -s extglob

if [[ -s ~/.note ]]; then
    echo "Notes:"
    cat ~/.note
    echo 
fi

alias ls='ls --color=auto'
PS1='[\W]\$ '
stty -ixon
