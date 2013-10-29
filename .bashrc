#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='darwin'
fi

shopt -s checkwinsize

CDPATH=".:..:~"
HISTSIZE=10000

if [[ $platform == 'linux' ]]; then
   alias ls='ls --color=auto'
   alias la='ls --color=auto -A'
   alias ll='ls --color=auto -la'
   alias grep='grep --color'
elif [[ $platform == 'darwin' ]]; then
   alias ls='/bin/ls -G'
   alias la='/bin/ls -G -A'
   alias ll='/bin/ls -G -la'
   alias grep='grep --color=auto'
fi
alias cp='cp -i -p'
alias mv='mv -i'
alias rm='rm -i'
alias l='less'
alias irb='irb --readline -r irb/completion'
alias tmux='tmux -2'
PS1='[\u@\h \W]\$ '

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PYTHONSTARTUP=~/.pythonrc
