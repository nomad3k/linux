parse_git_branch() {
  git branch 2> /dev/null \
    | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_git_status() {
  # git status -s 2> /dev/null \
  #   | wc -l
  git status -s 2> /dev/null \
    | sed -Ee 's/[ ]*([ACDMRU?]+).*/\1/' \
    | sort \
    | uniq -c \
    | sort \
    | tr -d '\n' \
    | sed -Ee 's/[ ]*([0-9]+)[ ]+([ACDMRU?]+)[ ]*/ \2:\1/g'
}

export PS1="\[\e[0;33m\][\u] \[\e[32m\]\w/\[\e[35m\]\$(parse_git_branch)\[\e[36m\]\$(parse_git_status) \[\e[0m\]$ "

alias ll='ls -lgF'
alias gs='git status'

export NVM_DIR="/Users/chris/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Create as alias for nuget
alias nuget="mono /usr/local/bin/nuget.exe"
