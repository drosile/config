#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize

CDPATH=".:..:~"
HISTSIZE=10000

alias ls='/bin/ls --color=auto'
alias la='/bin/ls --color=auto -A'
alias ll='/bin/ls --color=auto -la'
alias grep='grep --color'
alias cp='cp -i -p'
alias mv='mv -i'
alias rm='rm -i'
alias l='less'
alias irb='irb --readline -r irb/completion'
alias tmux='tmux -2'
PS1='[\u@\h \W]\$ '
