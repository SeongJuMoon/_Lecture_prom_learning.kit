#!/usr/bin/env bash

kubectl -n monitoring get secret prometheus-stack-kube-prom-prometheus-scrape-config \
-o jsonpath="{.data.additional-scrape-configs\.yaml}" | base64 -d