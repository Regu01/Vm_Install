#!/bin/bash

#Install Ansible
if dpkg -s ansible | grep -q Status; 
then
    echo -e "\033[1;32m Package ansible is installed! \033[m"
else
    echo -e "\033[31m Package ansible is NOT installed! \033[m"
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
    sudo apt update
    sudo apt -y install ansible
    ansible --version
fi

#Install Terraform
if dpkg -s terraform | grep -q Status; 
then
    echo -e "\033[1;32m Package terraform is installed! \033[m"
else
    echo -e "\033[31m Package terraform is NOT installed! \033[m"
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
if dpkg -s htop | grep -q Status;
then
    echo -e "\033[1;32m Package htop is installed! \033[m"
else
    echo -e "\033[31m Package htop is NOT installed! \033[m"
    apt-get -y install htop
fi


if dpkg -s locate | grep -q Status;
then
    echo -e "\033[1;32m Package locate is installed! \033[m"
else
    echo -e "\033[31m Package locate is NOT installed! \033[m"
    apt-get -y install locate
    apt-get -y install mlocate
    updatedb
fi

if dpkg -s tree | grep -q Status;
then
    echo -e "\033[1;32m Package tree is installed! \033[m"
else
    echo -e "\033[31m Package tree is NOT installed! \033[m"
    apt-get -y install tree
fi

#Update
sudo apt update
echo -e "\033[1;32m Package is update! \033[m"

