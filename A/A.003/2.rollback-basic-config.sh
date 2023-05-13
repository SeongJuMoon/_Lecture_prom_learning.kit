#!/usr/bin/env bash

kubectl patch --patch-file=prometheus-server-configmaps/rollback-to-basic-config.yaml -n monitoring cm/prometheus-server
