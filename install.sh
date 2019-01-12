#!/usr/bin/env bash

# install  bashmarks
cd bashmarks
make install
echo "source $HOME/.local/bin/bashmarks.sh" >> $HOME/.bashrc
source $HOME/.bashrc
cd -
