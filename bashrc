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
export GOPROXY=https://goproxy.io
export TERM=xterm-256color
export PATH=$PATH:$HOME/.local/bin
append $GOPATH/bin
export GO111MODULE=on
alias "ll=ls -l"
alias "help=tldr"
alias wget="wget -c"
alias 2gif='docker run --rm -v $PWD:/data asciinema/asciicast2gif '
alias open="/usr/bin/xdg-open"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# 关闭 pc 喇叭
xset -b 
# bash 使用 vi 输入模式

append /home/hellojukay/.cargo/bin
append /home/hellojukay/github/bashrc/tools
si() {
    xclip -selection clipboard -t image/png -i $1
}
sf() {
    cat $1 | xclip -selection clipboard
}
sc() {
    tmpfile=$(mktemp /tmp/screent-XXXXXXXXXXXXXXXXXXX.png)
    import ${tmpfile}
    si ${tmpfile}
    echo ${tmpfile}
}
rgif(){
	tmpfile=$(mktemp -u /tmp/asciinema-XXXXXXXXXXXX.cast)
	gif=$(mktemp -u XXXXXX.gif)
	asciinema rec $tmpfile
	echo "save recording file to $tmpfile"
	cp $tmpfile .
	2gif -s 1 $(basename $tmpfile) $gif 
	echo "save gif file to $gif"
	sudo chown $USER:$USER $gif
	rm $(basename $tmpfile)
}

clear-container(){
    docker ps -a | grep Exit | awk '{print $1}' | xargs -I {} docker rm {}
}
genpasswd() {
    local l=$1
        [ "$l" == "" ] && l=20
        tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
