#!/bin/bash

set -ex

# Updates
apt update
apt upgrade -y && apt dist-upgrade -y

apt-get install -y curl

# Install virtualbox guest additions
apt install gcc make perl
apt install -y --no-install-recommends --no-install-suggests virtualbox-guest-additions-iso
mount -o loop /usr/share/virtualbox/VBoxGuestAdditions.iso /mnt
/mnt/VBoxLinuxAdditions.run
umount /mnt

# Install git
apt install -y git

# Python
## Install pip
apt install -y python3-pip

## install virtualenv
pip3 install --system virtualenv

## install ipython
pip3 install --system ipython

# Install docker
apt install -y apt-transport-https ca-certificates gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install docker-ce docker-ce-cli containerd.io
pip3 install docker-compose

# Install VSCodium
snap install --classic codium

# Install Sublime Text Editor
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text

# Install PyCharm CE
snap install --classic pycharm-community

# Install jq (CLI JSON Parser)
apt install jq

# Add Apps to favorite apps
dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'codium_codium.desktop']"

# Cleanup
apt autoremove -y
apt clean -y

# Reboot
reboot
