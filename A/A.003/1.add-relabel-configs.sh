#!/usr/bin/env bash
kubectl patch --patch-file=prometheus-server-configmaps/add-relabel-confings.yaml -n monitoring cm/prometheus-server
