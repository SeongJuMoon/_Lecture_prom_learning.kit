#!/usr/bin/env bash

kubectl -n monitoring get secret prometheus-prometheus-stack-kube-prom-prometheus \
-o jsonpath="{.data.prometheus\.yaml\.gz}" | base64 -d | gunzip
