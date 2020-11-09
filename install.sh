#!/bin/bash
sudo pacman -S python python-pip fontconfig tmux
pip install ansible --user -i https://mirrors.aliyun.com/pypi/simple/
export PATH=$PATH:$HOME/.local/bin
ansible-playbook install.yml
