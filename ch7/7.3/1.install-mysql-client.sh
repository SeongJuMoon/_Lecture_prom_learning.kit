#!/usr/bin/env bash

# add yum repository 
sudo yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
# download mysql-client 8.0 compatible client. 
yum install --nogpgcheck mysql-community-client -y
echo "mysql client installed"
