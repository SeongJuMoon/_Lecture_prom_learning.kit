#!/usr/bin/env bash

# install util packages 
yum install epel-release -y
yum install vim-enhanced -y
yum install git -y

yum install yum-utils -y 
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

systemctl enable --now docker
yum install docker-ce-$2 docker-ce-cli-$2 containerd.io-$3 -y