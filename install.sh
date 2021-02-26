#!/bin/bash

set -ex

# Updates
apt-get update
apt-get upgrade -y && apt-get dist-upgrade -y

apt-get install -y curl

# Install virtualbox guest additions
apt-get install -y --no-install-recommends --no-install-suggests virtualbox-guest-additions-iso
mount -o loop /usr/share/virtualbox/VBoxGuestAdditions.iso /mnt
/mnt/VBoxGuestAdditions.run
umount /mnt

# Install git
apt-get install -y git

# Python
## Install pip
apt-get install -y python3-pip

## install virtualenv
pip3 install --system virtualenv

# Install docker
apt-get install -y apt-transport-https ca-certificates gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
pip3 install docker-compose

# Install VSCodium
snap install --classic codium

# Install Sublime Text Editor
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Install PyCharm CE
snap install --classic pycharm-community

# Install jq (CLI JSON Parser)
apt-get install jq

# Add Apps to favorite apps
dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'codium_codium.desktop']"

# Cleanup
apt-get autoremove -y
