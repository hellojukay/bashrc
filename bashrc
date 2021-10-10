parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
append() {
  export PATH=$PATH:$1
}
# git 仓库自动显示当前分支
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export VISUAL=vim
# 命令行记录保存执行时间
export HISTTIMEFORMAT='%F %T '
export EDITOR="$VISUAL"
export GOPROXY=https://goproxy.cn
export TERM=xterm-256color
export PATH=$PATH:$HOME/.local/bin
export GO111MODULE=on
alias "ll=ls -l"
alias "help=tldr"
alias "pdf=zathura"
alias open="/usr/bin/xdg-open"
alias bat="bat -n"
alias silicon='silicon -b=\#FFFFFF'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

append $GOPATH/bin
append $HOME/bin
append $HOME/.cargo/bin
append /home/hellojukay/github/bashrc/tools
append $HOME/.local/bin
append $HOME/go/bin
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
# 通过代理的方式执行某个命令
with_proxy(){
    https_proxy=http://127.0.0.1:7890  http_proxy=http://127.0.0.1:7890 "$@"
}
