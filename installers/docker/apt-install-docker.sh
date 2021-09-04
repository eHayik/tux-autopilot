#!/bin/bash

:'
If add-apt-repository command is not found, install it first with:

sudo apt-get install software-properties-common python-software-properties
'

# older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them:
sudo apt-get remove docker docker-engine docker.io containerd runc -y

# 1. Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    -y

# 2. Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


#Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.
sudo apt-key fingerprint 0EBFCD88

# set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

 # 3. Install docker engine

 sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd.io -y

 # Verify that Docker Engine is installed correctly by running the hello-world image.
 sudo docker run hello-world




 # 4. Install Docker Compose
 sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 
 sudo chmod +x /usr/local/bin/docker-compose

 docker-compose --version


# Run Docker as non root user without sudo command
# https://www.configserverfirewall.com/docker/run-docker-without-sudo/