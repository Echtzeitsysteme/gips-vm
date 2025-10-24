#!/bin/bash

set -e

USERNAME=maxkratz

# utilities + sudo
apt-get update
apt-get install -yq sudo tmux htop wget grep sed gpg unzip tar curl
/sbin/adduser $USERNAME sudo

# VirtualBox
# https://linuxiac.com/how-to-install-virtualbox-on-debian-13-trixie/
wget -O- -q https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmour -o /usr/share/keyrings/oracle_vbox_2016.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle_vbox_2016.gpg] http://download.virtualbox.org/virtualbox/debian trixie contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

apt-get update
apt-get install -yq virtualbox-7.2

usermod -a -G vboxusers $USERNAME

# Vagrant
# https://developer.hashicorp.com/vagrant/install#linux
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant

# Disable KVM
# https://superuser.com/a/1874448
modprobe -r kvm_intel
modprobe -r kvm_amd
cat > /etc/modprobe.d/blacklist.conf<< EOF
blacklist kvm_intel
blacklist kvm_amd
EOF

echo "=> Prerequisites installed. Ready for GitHub Actions runner installation."
