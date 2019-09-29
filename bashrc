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
alias 2gif='docker run --rm -v $PWD:/data asciinema/asciicast2gif '
alias open="/usr/bin/xdg-open"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# 关闭 pc 喇叭
xset -b 

dvwa() {
    docker run --rm -it -d --name dvwa -p 80:80 vulnerables/web-dvwa
}
append /home/hellojukay/.cargo/bin
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
	echo "save gif file t $gif"
	sudo chown $USER:$USER $gif
	rm $(basename $tmpfile)
}
