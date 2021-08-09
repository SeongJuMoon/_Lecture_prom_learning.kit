#!/usr/bin/env bash

# install packages 
yum install epel-release -y
yum install vim-enhanced -y
yum install git -y

# install kubernetes cluster 
yum install kubectl-$1 kubelet-$1 kubeadm-$1 -y

# install docker 
yum install docker-ce-$2 docker-ce-cli-$2 \
    containerd.io-$2 -y

# triggered
systemctl enable --now kubelet
systemctl enable --now docker
