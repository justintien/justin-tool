#!/bin/bash

__DIR__=$( dirname "${BASH_SOURCE[0]}" )

cd ~

#################
# install xcode #
#################

xcode-select --install
sudo xcodebuild -license

############################
# install package manarger #
############################

# install homebrew
# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

##################
# install docker #
##################

# native mac HyperKit vm
brew install --cask docker

# A simple terminal UI for both docker and docker-compose, written in Go with the gocui library.
brew install lazydocker

#####################
# install dev tools #
#####################

# latest bash
brew install bash bash-completion
echo $(brew --prefix)/bin/bash | sudo tee -a /etc/shells
echo '[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion' >> ~/.bash_profile
chsh -s $(which bash)

###################################
# optional: zsh (instead of bash) # use template oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh
###################################
# brew install zsh zsh-completions
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# chsh -s $(which zsh)

# unix command 
brew install coreutils
echo 'PATH="/usr/local/opt/coreutils/libexec/gunbin:$PATH"' >> ~/.bash_profile

#################
# monitor tools #
#################
brew install htop # Improved top (interactive process viewer)
brew install ctop # Top-like interface for container metrics
# disk i/o not found brew install iotop
brew install iftop # Display an interface's bandwidth usage
# brew install gotop # Terminal based graphical activity monitor inspired by gtop and vtop

#################
# network tools #
#################
# brew install telnet
brew install mtr # 'traceroute' and 'ping' in a single tool
brew install tcping # TCP connect to the given IP/port combo
brew install --cask wireshark # Graphical network analyzer and capture tool
brew install --cask charles # Web debugging Proxy application
# brew install --cask ssh-tunnel-manager
# brew install autossh
# brew install --cask vnc-viewer # vnc viewer

##############
# file tools #
##############
brew install tree
brew install truncate
brew install watch
brew install rclone # Rsync for cloud storage

###############
# data parser #
###############
# json parser
brew install jq
# yaml parser (support xml)
brew install yq

# International domain name library
# brew install libidn && idn 賈胖
# brew install libidn2 && idn2 賈胖

# latest curl
brew install curl
brew install wget

# version controll: git
brew install git
brew install git-lfs
brew install git-extras
# brew install --cask sourcetree

#######
# IDE #
#######
# brew install nano
brew install --cask visual-studio-code
# brew install --cask atom
# brew install --cask sublime-text
# brew install --cask typora # this sucks
# brew install --cask typora # 付費版
# brew install --cask intellij-idea-ce # 免費版
# markdown cli viewer

#########################
# Programming language) #
#########################
brew install node # nodejs
brew install python
# brew install rust
# brew install java
# brew install maven # Java-based project management

# brew install tidy-html5
# brew install ruby # override default old ruby
# brew install php
# brew install composer # Dependency Manager for PHP
# brew install gcc # c/c++ compiler

# android
# brew install android-sdk
# brew install android-ndk
# brew install apktool
# brew install --cask android-studio
# brew install --cask androidtool
# brew install --cask android-file-transfer

############
# Database #
############
# brew install freetds # Libraries to talk to Microsoft SQL Server and Sybase databases
# brew install --cask db-browser-for-sqlite # Browser for SQLite databases
# brew install --cask robo-3t # MongoDB management tool
# brew install --cask sequel-pro # MySQL/MariaDB database management platform
# brew install --cask dbeaver-community # Universal database tool and SQL client
# brew install --cask mysqlworkbench # Visual tool to design, develop and administer MySQL servers

# brew install --cask dash # API documentation browser and code snippet manager

# brew install --cask wechatwebdevtools # debug wechat inapp webview

######################
# install other apps #
######################

# vpn
# brew install --cask shadowsocksx-ng
# brew install --cask shadowsocksx-ng-r # not support AEAD chipers

brew install --cask the-unarchiver # Unpacks archive files
brew install p7zip # 7-Zip (high compression file archiver) implementation
brew install tesseract # OCR (Optical Character Recognition) engine
brew install tesseract-lang # Enables extra languages support for Tesseract

# brew install --cask 1password # Password manager that keeps all passwords secure behind one password

# browser
brew install --cask google-chrome
brew install --cask firefox
# brew install --cask tor-browser

# cloud drive
# brew install --cask dropbox
brew install --cask google-drive

# social
# brew install --cask teamviewer
# brew install --cask skype
# brew install --cask wechat
# brew install --cask qq
brew install --cask slack
brew install --cask telegram
# brew install --cask microsoft-teams

# brew install --cask libreoffice

brew install --cask anki
brew install --cask elmedia-player
# brew install --cask coconutbattery # Tool to show live information about the batteries in various devices

brew install mackup # Keep your Mac's application settings in sync

# cleanup
# brew install --cask cleanmymac
# https://itunes.apple.com/app/id921458519

# giphy
# https://itunes.apple.com/us/app/giphy-capture.-the-gif-maker/id668208984

# 截图 gif 工具
# brew install --cask licecap

###########################
# install game essentials #
###########################

brew install --cask steam

# brew install --cask minecraft
# brew install --cask feed-the-beast

# http://www.cabextract.org.uk/
# brew install cabextract

# for dos games
# brew install --cask dosbox

# for unix* games
# brew install --cask xquartz

# for windows games
# https://wiki.winehq.org/MacOSX/Building
# brew install wine
# brew install --cask wineskin-winery

# auto clicker
# curl 'http://www.beecubu.com/downloads/iMouseTrick' > ~/Desktop/iMouseTrick.zip
# unzip ~/Desktop/iMouseTrick.zip
# mv ~/Desktop/iMouseTrick.app /Applications/

# 樹莓派 刻錄 image to sd card 需要的 
# brew install --cask balenaetcher

##########
# config #
##########

# mac main config.
defaults write com.apple.finder AppleShowAllFiles YES

# use mackup to backup
mackup backup

###########
# cleanup #
###########

brew cleanup -n

###############
# manual memo #
###############

# echo 'execute /usr/local/opt/android-sdk/tools/android once to download essential packages.'
echo 'edit the ~/.bash_profile'
echo 'edit the ~/.czrc'
echo 'edit the ~/.gitconfig'
echo 'edit the ~/.gitignore_global'
echo 'edit the ~/.tmux.conf'
echo 'edit the ~/.zshrc'
