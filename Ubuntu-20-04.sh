#! /bin/bash

#add update alias to "~/.bashrc" file
sudo echo -e "\n#Alias scripts\nalias update='sudo apt --fix-broken install -y && sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y'" >> ~/.bashrc
source ~/.bashrc

#update system section ---
#use alias
sudo apt --fix-broken install -y && sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y

#Hardware drivers drivers
sudo ubuntu-drivers autoinstall
sudo apt --fix-broken install -y && sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
sudo ubuntu-drivers autoinstall

#build essentials
sudo apt-get install build-essential -y
sudo apt-get install libz-dev -y
sudo apt-get install chrome-gnome-shell -y


#Software section
#install yt-download
sudo apt-get install ffmpeg -y
sudo snap install youtube-dl

#install R
sudo apt update -qq

sudo apt install --no-install-recommends software-properties-common dirmngr -y

sudo wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

sudo apt install --no-install-recommends r-base -y

#add packages
sudo add-apt-repository ppa:c2d4u.team/c2d4u4.0+ -y
#install dependency packages
sudo apt-get install libcurl4-openssl-dev libssl-dev libxml2-dev libgit2-dev libpq-dev -y
sudo apt install --no-install-recommends r-cran-tidyverse -y

#install git
sudo apt install git -y

#install anydesk
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
sudo apt install anydesk -y

#install docker
sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

sudo echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt --fix-broken install -y && sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y

sudo apt-get install docker-ce docker-ce-cli containerd.io -y

#docker perms
sudo groupadd docker
sudo usermod -aG docker $USER
sudo newgrp docker 

#install Rstudio
cd ~/Downloads/
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-2022.02.2-485-amd64.deb
sudo dpkg -i rstudio-2022.02.2-485-amd64.deb

#install vscode
sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/

sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

sudo rm -f packages.microsoft.gpg

sudo apt install apt-transport-https -y

sudo apt --fix-broken install -y && sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y

sudo apt install code -y
