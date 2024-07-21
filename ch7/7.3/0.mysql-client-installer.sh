#!/usr/bin/env bash

if (command -v mysql > /dev/null); then
    echo 'mysql client already installed.'
else
# add mysql repository 
    wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
    sudo dpkg -i mysql-apt-config_0.8.22-1_all.deb
    # Install MySQL client
    sudo apt-get install mysql-client -y
    echo "mysql client installed."
fi
