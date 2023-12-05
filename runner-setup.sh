#!/bin/bash

set -e

USERNAME=maxkratz

# utilities + sudo
apt-get update
apt-get install -yq sudo tmux htop wget grep sed gpg unzip tar
/sbin/adduser $USERNAME sudo

# VirtualBox
wget -O- -q https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmour -o /usr/share/keyrings/oracle_vbox_2016.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle_vbox_2016.gpg] http://download.virtualbox.org/virtualbox/debian bookworm contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

apt-get update
apt-get install -yq virtualbox-7.0

# Vagrant
apt-get install -yq vagrant

echo "=> Prerequisites installed. Ready for GitHub Actions runner installation."
