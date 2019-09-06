parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
append() {
  export PATH=$PATH:$1
}
# git 仓库自动显示当前分支
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export VISUAL=vim
export EDITOR="$VISUAL"
export GOPROXY=https://gocenter.io
append $GOPATH/bin
export GO111MODULE=on
alias "ll=ls -l"
alias "help=tldr"
alias asciicast2gif='docker run --rm -v $PWD:/data asciinema/asciicast2gif'
alias open="/usr/bin/xdg-open"

 [ -f ~/.fzf.bash ] && source ~/.fzf.bash

 append /home/hellojukay/.cargo/bin
