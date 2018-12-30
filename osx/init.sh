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

# homebrew
# https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Installation.md
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

##################
# install docker #
##################

# native mac HyperKit vm
brew cask install docker

#####################
# install dev tools #
#####################

# latest bash
brew install bash
echo $(brew --prefix)/bin/bash | sudo tee -a /etc/shells
chsh -s $(brew --prefix)/bin/bash

brew install bash-completion
echo '[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion' >> ~/.bash_profile

# optional: zsh (instead of bash) 
brew install zsh zsh-completions
# install oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# change default sh: zsh
chsh -s $(which zsh)

# unix command 
brew install coreutils
echo 'PATH="/usr/local/opt/coreutils/libexec/gunbin:$PATH"' >> ~/.bash_profile

# monitor tools:
brew install htop
brew install ctop
# disk i/o not found brew install iotop
# 流量not found brew install iftop

# network tools:
brew install telnet
# 網路診斷
# brew install mtr
# brew install tcping
# 封包截取
# brew cask install wireshark --with-qt
# 封包截取 & 修改
# brew cask install charles
brew cask install ssh-tunnel-manager

# file utils:
brew install tree
brew install truncate
brew install watch

# json parser
brew install jq
# yaml parser (support xml)
brew install yq

# International domain name library
# brew install libidn && idn 賈胖
# brew install libidn2 && idn2 賈胖

# cloud storage rsync util
# brew install rclone

# latest curl
brew install curl --with-nghttp2
brew link curl --force

# version controll: git
brew install git
brew install git-lfs
brew install git-extras
brew cask install sourcetree

# terminal
# brew cask install black-screen # this sucks

# IDE && editor
# brew install nano
brew cask install visual-studio-code
# brew cask install atom
# brew cask install sublime-text
# brew cask install typora # this sucks

# node
brew install node
# npm install -g grunt # please use in project npm i -D grunt
# npm install -g webpack # please use in project npm i -D webpack

# other lang
brew install python
brew cask install java
brew install tidy-html5
brew install ruby # override default old ruby
brew install php71 --with-pear # to override default mac php5.5 (too old and apple recommand do not delete it)
brew install composer

# android
brew install android-sdk
brew install android-ndk
brew install apktool
brew cask install android-studio
brew cask install androidtool
brew cask install android-file-transfer

# db
brew install freetds
brew cask install sqlitebrowser
brew cask install robomongo
brew cask install sequel-pro
# brew cask install mysqlworkbench

# doc
brew cask install dash

# cli for cloud
# brew install awscli # use docker instead
gem install travis --no-rdoc --no-ri
pip install docker-py

# debug wechat inapp webview
brew cask install wechatwebdevtools

# brew install wireshark

######################
# install other apps #
######################

# vpn
brew cask install shadowsocksx-ng

brew cask install the-unarchiver
brew install p7zip

brew cask install filezilla

# ocr tool A_A
brew install tesseract --with-all-languages

# brew cask install 1password

brew cask install google-chrome
brew cask install firefox

# brew cask install dropbox
# https://github.com/caskroom/homebrew-cask/issues/37271#issuecomment-319275948
brew cask install google-backup-and-sync

# social
brew cask install teamviewer
brew cask install skype
# brew cask install electronic-wechat # native wechat upgraded! so...
brew cask install qq
brew cask install slack
brew cask install telegram

# brew cask install libreoffice
# brew cask install openvanilla
# wget https://github.com/lukhnos/openvanilla/raw/master/DataTables/bpmf.cin <= 給繁簡互轉用

# brew cask install evernote

brew cask install anki
brew cask install elmedia-player

# brew cask install coconutbattery 

# backup config.
brew install mackup

# cleanup
# brew cask install cleanmymac
# https://itunes.apple.com/app/id921458519

# giphy
# https://itunes.apple.com/us/app/giphy-capture.-the-gif-maker/id668208984

# 截图 gif 工具
# brew cask install licecap

###########################
# install game essentials #
###########################

brew cask install steam

# brew cask install minecraft
# brew cask install feed-the-beast

# http://www.cabextract.org.uk/
# brew install cabextract

# for dos games
brew cask install dosbox

# for unix* games
# brew cask install xquartz

# for windows games
# https://wiki.winehq.org/MacOSX/Building
# brew install wine
# brew cask install wineskin-winery

# auto clicker
curl 'http://www.beecubu.com/downloads/iMouseTrick' > ~/Desktop/iMouseTrick.zip
unzip ~/Desktop/iMouseTrick.zip
mv ~/Desktop/iMouseTrick.app /Applications/

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

echo 'execute /usr/local/opt/android-sdk/tools/android once to download essential packages.'
echo 'edit the ~/.tmux.conf'
