#!/usr/bin/env bash
kubectl patch --patch-file=prometheus-server-configmap-patch/add-prometheus-server-cm-patch.yaml -n monitoring cm/prometheus-server
