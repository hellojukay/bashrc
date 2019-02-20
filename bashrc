parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
append() {
  export PATH=$PATH:$1
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export GOPROXY="https://athens.azurefd.net"
append $GOPATH/bin
export GO111MODULE=on
alias "ll=ls -l"
alisa "help=tldr"
