#!/usr/bin/env bash

sudo yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
echo "current active mysql version is 8.0"
yum install --nogpgcheck mysql-community-client -y