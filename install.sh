#!/bin/bash

#Install Ansible
if [ dpkg -s ansible &> /dev/null -eq 0 ]; then
    echo "Package ansible is installed!"
else
    echo "Package ansible is NOT installed!"
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
    sudo apt update
    sudo apt -y install ansible
    ansible --version
fi

#Install Terraform
if [ dpkg -s terraform &> /dev/null -eq 0 ]; then
    echo "Package terraform is installed!"
else
    echo "Package terraform is NOT installed!"
    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
    wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update
    sudo apt-get -y install terraform
    touch ~/.bashrc
    terraform -install-autocomplete
    terraform -version
fi

#Qualité de vie
if [ dpkg -s htop &> /dev/null -eq 0 ]; then
    echo "Package htop is installed!"
else
    echo "Package htop is NOT installed!"
    apt-get -y install htop
fi

#Update
sudo apt update


