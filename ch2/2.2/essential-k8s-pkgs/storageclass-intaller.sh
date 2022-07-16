#!/usr/bin/env bash
# Main Source - https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner
# default storageClass.name is nfs-client 

cat <<EOF | kubectl apply -f -
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: managed-nfs-storage
# or choose another name, must match deployment's env PROVISIONER_NAME'
provisioner: k8s-sigs.io/nfs-subdir-external-provisioner
parameters:
  # waits for nfs.io/storage-path annotation, if not specified will accept as empty string.
  pathPattern: "${.PVC.namespace}/${.PVC.annotations.nfs.io/storage-path}"
  onDelete: delete
EOF

# setup default storage class due to no mention later on
kubectl annotate storageclass managed-nfs-storage storageclass.kubernetes.io/is-default-class=true
