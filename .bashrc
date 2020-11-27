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
HISTCONTROL=ignoredups
export XDG_CURRENT_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland

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
alias k='kubectl'
alias m='minikube'
alias irb='irb --readline -r irb/completion'
alias tmux='tmux -2'
#PS1='[\u@\h \w]\$ '
source $HOME/config/git-prompt.sh
PS1='[\u@\h] \w $(git branch &>/dev/null;\
   if [ $? -eq 0 ]; then \
      echo "$(echo `git status --ignore-submodules` | grep "nothing to commit" >/dev/null 2>&1;\
      if [ "$?" -eq "0" ]; then \
         echo "\[\033[0;32m\]"$(__git_ps1 " (%s)"); \
      else \
         echo "\[\033[0;31m\]"$(__git_ps1 " {%s}"); \
      fi) \[\033[0m\]\n\$ ";\
   else \
      echo "\[\033[0m\]\n\$ "; \
   fi)'

export PS1

#export TERM="xterm-256color"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PYTHONSTARTUP=~/.pythonrc

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
   rm -f /tmp/ssh-agent-$USER-screen
   ln -sf $SSH_AUTH_SOCK $SOCK
   export SSH_AUTH_SOCK=$SOCK
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$HOME/bin:$PATH

function pr_number_for_sha {
  git log --merges --ancestry-path --oneline $1..master\
  | grep 'pull request'\
  | tail -n1\
  | awk '{print $5}'\
  | cut -c2-
}

GITHUB_ORG='drosile'
function pr_for_sha {
  pr_number_for_sha $1\
  | xargs -I % open https://github.com/${GITHUB_ORG}/${PWD##*/}/pull/%
}

MOZ_ENABLE_WAYLAND=true
SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent

[[ -f ~/.bashrc.khan ]] && . ~/.bashrc.khan
