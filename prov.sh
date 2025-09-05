#!/bin/bash

#
# Config
#

ECLIPSE_ARCHIVE=eclipse-gips-linux-user

set -e
START_PWD=$PWD

#
# Utils
#

# Displays the given input including "=> " on the console.
log () {
	echo "=> $1"
}

#
# Script
#

log "Start provisioning."

# Updates
log "Installing updates."
sudo apt-get update
# sudo apt-get dist-upgrade -y

# # Java/JDK21
# log "Installing OpenJDK."
# sudo apt-get install -y openjdk-21-jdk
# #java --version

# # Packages for building a new kernel
# sudo apt-get install -y gcc make perl

# # GIPS Eclipse
# log "Installing GIPS Eclipse."
# sudo apt-get install -y graphviz
# mkdir -p ~/eclipse-apps
# cd ~/eclipse-apps

# # Get eclipse
# if [[ ! -f "./$ECLIPSE_ARCHIVE.zip" ]]; then
# 	log "Downloading latest GIPS Eclipse archive from Github."
# 	curl -s --header "Authorization: Bearer ${GITHUB_TOKEN}" \
#         https://api.github.com/repos/Echtzeitsysteme/gips-eclipse-build/releases/latest \
#         | grep "$ECLIPSE_ARCHIVE.zip" \
#         | cut -d : -f 2,3 \
#         | tr -d \" \
#         | wget -q --header="Authorization: Bearer ${GITHUB_TOKEN}" -i - \
#         || :
# fi

# if [[ ! -f "./$ECLIPSE_ARCHIVE.zip" ]]; then
#         log "Download of GIPS Eclipse archive failed."
#         exit 1;
# fi

# unzip -qq -o $ECLIPSE_ARCHIVE.zip
# rm -f $ECLIPSE_ARCHIVE.zip

# # Create desktop launchers
# mkdir -p /home/vagrant/Desktop
# touch /home/vagrant/Desktop/gips.desktop
# printf "
# [Desktop Entry]\n
# Version=1.0\n
# Name=GIPS Eclipse\n
# Comment=Use GIPS Eclipse\n
# GenericName=GIPS Eclipse\n
# Exec=bash -c \"cd /home/vagrant/eclipse-apps/eclipse && ./eclipse\"\n
# Terminal=false\n
# X-MultipleArgs=false\n
# Type=Application\n
# Icon=/home/vagrant/eclipse-apps/eclipse/icon.xpm\n
# StartupNotify=true\n
# " > /home/vagrant/Desktop/gips.desktop
# chmod u+x /home/vagrant/Desktop/gips.desktop

# touch /home/vagrant/Desktop/gips-website.desktop
# printf "
# [Desktop Entry]
# Encoding=UTF-8
# Name=GIPS Website
# Type=Link
# URL=https://gips.dev/
# Icon=web-browser
# " > /home/vagrant/Desktop/gips-website.desktop

# touch /home/vagrant/Desktop/gips-examples.desktop
# printf "
# [Desktop Entry]
# Encoding=UTF-8
# Name=GIPS Examples
# Type=Link
# URL=https://github.com/Echtzeitsysteme/gips-examples
# Icon=web-browser
# " > /home/vagrant/Desktop/gips-examples.desktop

# touch /home/vagrant/Desktop/gips-tests.desktop
# printf "
# [Desktop Entry]
# Encoding=UTF-8
# Name=GIPS Test Suite
# Type=Link
# URL=https://github.com/Echtzeitsysteme/gips-tests
# Icon=web-browser
# " > /home/vagrant/Desktop/gips-tests.desktop

# chmod u+x /home/vagrant/Desktop/*.desktop

# log "Install GLPK ILP solver."
# sudo apt-get install -yq \
#         glpk-utils \
#         libglpk-dev \
#         glpk-doc \
#         libglpk-java \
#         libglpk40
# sudo cp /usr/lib/x86_64-linux-gnu/jni/libglpk_java.* /usr/lib

# sudo mv /home/vagrant/Desktop/*.desktop /usr/share/xubuntu/applications/
# sudo ln -s /usr/share/xubuntu/applications/gips.desktop /home/vagrant/Desktop/gips.desktop
# sudo ln -s /usr/share/xubuntu/applications/gips-website.desktop /home/vagrant/Desktop/gips-website.desktop
# sudo ln -s /usr/share/xubuntu/applications/gips-examples.desktop /home/vagrant/Desktop/gips-examples.desktop
# sudo ln -s /usr/share/xubuntu/applications/gips-tests.desktop /home/vagrant/Desktop/gips-tests.desktop

# # Install additional CLI tools
# log "Install additional CLI tools."
# sudo apt-get install -yq \
#         git \
#         ncdu \
#         htop \
#         tmux \
#         rsync

# # Clean up
# log "Clean-up"
# sudo apt-get remove -yq \
#         libreoffice-* \
#         thunderbird \
#         pidgin \
#         gimp \
#         evolution
# sudo apt-get autoremove -yq
# sudo apt-get clean cache

log "Finished provisioning."
