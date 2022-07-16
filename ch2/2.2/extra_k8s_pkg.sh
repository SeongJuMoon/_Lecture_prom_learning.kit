#!/usr/bin/env bash

# main scripfiles dir 
SCRIPTSDIR=$HOME/_Lecture_prometheus_learning.kit/ch2/2.2/scripts-to-deploy

# helm 3.9.1 installer
source $SCRIPTSDIR/get-helm-3.9.1.sh

# edu purpose repo add & update
source $SCRIPTSDIR/helm-repo-add.sh

# metallb v0.13.3
source $SCRIPTSDIR/metallb-installer-0.13.3-w-CRD.sh

# metrics server v0.6.1
source $SCRIPTSDIR/metrics-server-0.6.1.sh

# NFS dir configuration
source $SCRIPTSDIR/nfs-exporter.sh dynamic-vol

# nfs-provsioner installer & set default storageclass
source $SCRIPTSDIR/nfs-provisioner-installer.sh
