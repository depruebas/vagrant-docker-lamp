#!/bin/bash

sudo echo '## Vagrant LAMP config' | sudo tee -a /etc/hosts
sudo echo '127.0.0.1 test-web.local' | sudo tee -a /etc/hosts
sudo echo '127.0.0.1 End Vagrant LAMP config' | sudo tee -a /etc/hosts

sudo apt-get -y install net-tools gcc perl make build-essential linux-headers-$(uname -r) 