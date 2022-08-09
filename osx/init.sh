#!/bin/bash

# This is about apple silicon (M1) MacBook pro 2021 14-inch
# Justin 有使用到的 (會陸續更新)
# Updated At: 2022/08/09

__DIR__=$( dirname "${BASH_SOURCE[0]}" )

cd ~

############################
# install package manarger #
############################

# install homebrew
# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 需要手動增加此檔案
vi ~/.zshrc
export PATH=$PATH:/opt/homebrew/bin
# vi save

# zsh: use template oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

##################
# install docker #
##################
brew install --cask docker

#######
# IDE #
#######
brew install --cask visual-studio-code


#########################
# Programming language) #
#########################
brew install node # nodejs
# install nvm: https://github.com/nvm-sh/nvm#installing-and-updating
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# nvm install 16 # node16
# nvm use 16

###############
# GAME EDITOR #
###############
brew install --cask unity-hub # unity

###########
# BROWSER #
###########
brew install --cask google-chrome

###############
# CLOUD DRIVE #
###############
brew install --cask google-drive

#################
# COMMUNICATION #
#################
brew install --cask wechat
brew install --cask slack
brew install --cask telegram
brew install --cask discord
# line 要從 app store 安裝

##########
# BACKUP #
##########
brew install mackup # Keep your Mac's application settings in sync
# doc: https://github.com/lra/mackup/tree/master/doc

vi .mackup.cfg
[storage]
engine = icloud
directory = .config/mackup
# save .mackup.cfg

mackup restore

brew install tmux
# set tmux
curl https://raw.githubusercontent.com/justintien/justin-tool/master/home/.tmux.conf > ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
# Press prefix + I (capital i, as in Install) to fetch the plugin.


# brew install curl (已內建)
# brew install git (已內建)
