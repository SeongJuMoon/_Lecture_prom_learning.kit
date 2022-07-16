#!/usr/bin/env bash

# main scripfiles dir 
SCRIPTSDIR=$HOME/_Lecture_prometheus_learning.kit/ch2/2.2/essential-k8s-pkgs

# helm 3.9.1 installer
sh $SCRIPTSDIR/get-helm-3.9.1.sh

# metallb v0.13.3
sh $SCRIPTSDIR/metallb-installer-0.13.3-w-CRD.sh

# metrics server v0.6.1
sh $SCRIPTSDIR/metrics-server-0.6.1.sh

# NFS dir configuration
sh $SCRIPTSDIR/nfs-exporter.sh dynamic-vol

# nfs-provsioner installer 
sh $SCRIPTSDIR/nfs-provisioner-installer.sh

# storageclass installer & set default storageclass
sh $SCRIPTSDIR/storageclass-intaller.sh

