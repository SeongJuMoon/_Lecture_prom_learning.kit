#!/usr/bin/env bash

sudo yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
yum install --nogpgcheck mysql-community-client -y
echo "mysql client installed"