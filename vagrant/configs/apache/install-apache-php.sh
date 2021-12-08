#!/bin/bash
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install libapache2-mod-wsgi-py3 php-mysql php-curl \
																									php-tidy php-gd php-cli php-pear php-pgsql \
																									php-dev libapache2-mod-php php-mbstring

# Configure & enable Virtualhost into Apache2
sudo cp /home/vagrant/data/vagrant/configs/apache/sites.conf /etc/apache2/sites-available/sites.conf
sudo ln -s /etc/apache2/sites-available/sites.conf /etc/apache2/sites-enabled/sites.conf

# Enable Mod Rewrite
sudo ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

sudo /etc/init.d/apache2 restart
