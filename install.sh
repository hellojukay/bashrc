#!/usr/bin/env bash
cat bashrc > .bashrc
# install  bashmarks
cd bashmarks
make install >> /dev/null
cd -
echo "source $HOME/.local/bin/bashmarks.sh" >> .bashrc

echo "please add \"source "$PWD"/.bashrc \" in $HOME/.bashrc"
