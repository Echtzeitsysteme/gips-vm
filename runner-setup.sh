#!/bin/bash

set -e

USERNAME=maxkratz

# utilities + sudo
apt-get update
apt-get install -yq sudo tmux htop wget grep sed gpg unzip tar curl
/sbin/adduser $USERNAME sudo

# VirtualBox
wget -O- -q https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmour -o /usr/share/keyrings/oracle_vbox_2016.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle_vbox_2016.gpg] http://download.virtualbox.org/virtualbox/debian bookworm contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

apt-get update
apt-get install -yq virtualbox-7.0

usermod -a -G vboxusers $USERNAME

# Vagrant
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
apt-get update && apt-get install -yq vagrant

echo "=> Prerequisites installed. Ready for GitHub Actions runner installation."
