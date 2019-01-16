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
glide mirror set https://golang.org/x/mobile https://github.com/golang/mobile --vcs git
glide mirror set https://golang.org/x/crypto https://github.com/golang/crypto --vcs git
glide mirror set https://golang.org/x/net https://github.com/golang/net --vcs git
glide mirror set https://golang.org/x/tools https://github.com/golang/tools --vcs git
glide mirror set https://golang.org/x/text https://github.com/golang/text --vcs git
glide mirror set https://golang.org/x/image https://github.com/golang/image --vcs git
glide mirror set https://golang.org/x/sys https://github.com/golang/sys --vcs git
