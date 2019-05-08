#!/usr/bin/env bash
# add docker complete commandline
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.24.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
cat bashrc > .bashrc
# install  bashmarks
cd bashmarks
make install >> /dev/null
cd -
cp -i .tmux.conf  $HOME/.tmux.conf
echo "source $HOME/.local/bin/bashmarks.sh" >> .bashrc

echo "please add \"source "$PWD"/.bashrc \" in $HOME/.bashrc"
