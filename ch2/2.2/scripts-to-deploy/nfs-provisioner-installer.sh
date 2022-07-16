#!/usr/bin/env bash
# Main Source - https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner
# default storageClass.name is nfs-client 

# instant shlle cannot read properly env. so temperally full address fixed
/usr/loca/bin/helm install nfs-provisioner edu/nfs-subdir-external-provisioner \
    --set nfs.server=192.168.1.10 \
    --set nfs.path=/nfs_shared/dynamic-vol \
    --set storageClass.name=managed-nfs-storage

# setup default storage class due to no mention later on
kubectl annotate storageclass managed-nfs-storage storageclass.kubernetes.io/is-default-class=true
