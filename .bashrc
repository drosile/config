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

osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }osc7_cwd


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

COLOR_RED="\033[0;31m"
COLOR_GREEN="\033[0;32m"
COLOR_YELLOW="\033[0;33m"
COLOR_BLUE="\033[0;34m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"
function git_color {
    local git_status="$(git status 2> /dev/null)"

    if [[ ! $git_status =~ "working tree clean" ]]; then
        echo -e $COLOR_RED
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e $COLOR_YELLOW
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $COLOR_GREEN
    else
        echo -e $COLOR_OCHRE
    fi
}
function git_branch {
    local git_status="$(git status 2> /dev/null)"
    local on_branch="On branch ([^${IFS}]*)"
    local on_commit="HEAD detached at ([^${IFS}]*)"

    if [[ $git_status =~ $on_branch ]]; then
        local branch=${BASH_REMATCH[1]}
        echo "($branch)"
    elif [[ $git_status =~ $on_commit ]]; then
        local commit=${BASH_REMATCH[1]}
        echo "($commit)"
    fi
}
# user/host/dir
PS1='[\u@\h] \w'
# add escape sequence for foot term OSC-7 title bar
PS1+=$'\e]2;\W'
# git branch coloring
PS1+="\[\$(git_color)\]"
PS1+=" \$(git_branch)"
PS1+="\[$COLOR_RESET\]\n"
# prompt
PS1+="$ "

#PS1="\[\u@\h\] \w\[\$(git_color)\] \$(git_branch)\[$COLOR_RESET\]\n$ "
#PS1='[\u@\h] \w $(git branch &>/dev/null;\
   #if [ $? -eq 0 ]; then \
      #echo "$(echo `git status --ignore-submodules` | grep "nothing to commit" >/dev/null 2>&1;\
      #if [ "$?" -eq "0" ]; then \
         #echo "\[\033[0;32m\]"$(__git_ps1 " (%s)"); \
      #else \
         #echo "\[\033[0;31m\]"$(__git_ps1 " {%s}"); \
      #fi) \[\033[0m\]\n\$ ";\
   #else \
      #echo "\[\033[0m\]\n\$ "; \
   #fi)'

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
#SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent

[[ -f ~/.bashrc.khan ]] && . ~/.bashrc.khan

if [ "$TERM" != "foot-extra" ]
    then
        setfont /usr/share/kbd/consolefonts/latarcyrheb-sun32.psfu.gz
fi
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if command -v theme.sh > /dev/null; then
    [ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"
fi

HOST=`uname -n`
if [[ -f ~/.keychain/$HOST-sh ]] && [[ $UID != "0" ]]
then
    keychain ~/.ssh/id_rsa
    . ~/.keychain/$HOST-sh > /dev/null
fi

#eval $(keychain --eval --noask --agents gpg,ssh --quiet id_rsa)
