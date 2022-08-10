#!/usr/bin/env bash

sudo yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
echo "current active mysql version is 8.0"
# workaround 
sed s,gpgcheck=1,gpgcheck=0,gi /etc/yum.repos.d/mysql-community.repo
yum repolist all | grep mysql
yum install mysql-community-client -y