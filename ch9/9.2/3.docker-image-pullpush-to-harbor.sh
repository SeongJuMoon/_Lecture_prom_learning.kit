#!/usr/bin/env bash

# Docker version 
docker_V='5:24.0.6-1~ubuntu.22.04~jammy' 

# install & enable docker 
apt-get update 
apt-get install docker-ce=$docker_V docker-ce-cli=$docker_V -y 

# upload to harbor 
docker login 192.168.1.92 --username admin --password admin
docker pull nginx
docker tag nginx 192.168.1.92/library/nginx
docker push 192.168.1.92/library/nginx
