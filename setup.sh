#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export INSTALL_ZSH=true
export USERNAME=`whoami`

# Install & Configure Zsh
if [ "$INSTALL_ZSH" = "true" ]
then
    chsh -s /usr/bin/zsh $USERNAME
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

sudo ln -fs /usr/share/zoneinfo/Europe/London /etc/localtime
sudo dpkg-reconfigure --frontend noninteractive tzdata
