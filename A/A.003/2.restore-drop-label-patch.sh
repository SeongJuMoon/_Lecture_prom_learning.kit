#!/usr/bin/env bash

kubectl patch --patch-file=prometheus-server-configmap-patch/restore-prometheus-server-cm-patch.yaml -n monitoring cm/prometheus-server
