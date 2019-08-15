#!/usr/bin/env python

import os
import sys
import logging


install_flag = '#BASHRC'
home=os.environ['HOME']

# append string to $HOME/.bashrc        
def install_bashrc():
    profile = home + '/' +  '.bashrc'
    bashrc_content = open(profile).read().strip().split()
    if install_flag not in bashrc_content:
        # install 
        script_dir = os.path.dirname(os.path.realpath(__file__))
        source_command = 'source' + ' ' +  script_dir + '/' + 'bashrc' + ' ' + install_flag
        with open(profile, "a") as f:
            f.write(source_command)
    else:
        print('skip install bashrc')

def install_tmux():
    tmux_config = '.tmux.conf'
    tmux_config_content = open(tmux_config).read().strip()
    with open(home + '/' + '.tmux.conf','w') as f:
        f.write(tmux_config_content)
        f.close()

def main():

    install_bashrc()  # install bash config
    install_tmux()    # install tmux config
    print('done')
    return 0

main()

