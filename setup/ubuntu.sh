#!/bin/bash

# install common tools needed on a *buntu dev machine

# Ask for the administrator password upfront
sudo -v

#make install noninteractive just in case
export DEBIAN_FRONTEND=noninteractive

# basics
sudo apt-get -q -y install build-essential libssl-dev curl wget libxml2-dev imagemagick

# console tools
sudo apt-get -q -y install htop mc tmux python-pygments whois unrar

# git related stuff
sudo apt-get -q -y install git-core git-flow
sudo chmod +x /usr/share/doc/git/contrib/subtree/git-subtree.sh
sudo ln -s /usr/share/doc/git/contrib/subtree/git-subtree.sh /usr/lib/git-core/git-subtree

# Java (used for all IntelliJ IDEs)
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -q -y install oracle-java8-installer
sudo apt-get -q -y install install oracle-java8-set-default

# chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable
sudo apt-get install google-chrome-beta

# GUI apps
sudo apt-get -q -y install krusader yakuake gnome-web-photo	shutter vlc firefox browser-plugin-vlc

# skype
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update
sudo apt-get install skype -y --force-yes


# sublime text 3
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get -q -y install sublime-text-installer
curl https://sublime.wbond.net/Package%20Control.sublime-package -o ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package


# sublimte text 2
#sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
#sudo apt-get update
#sudo apt-get -q -y install sublime-text 


#reset DEBIAN_FRONTEND
export DEBIAN_FRONTEND=