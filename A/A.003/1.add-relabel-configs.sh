#!/usr/bin/env bash
kubectl patch --patch-file=prometheus-server-configmaps/add-replace-n-keep.yaml -n monitoring cm/prometheus-server
