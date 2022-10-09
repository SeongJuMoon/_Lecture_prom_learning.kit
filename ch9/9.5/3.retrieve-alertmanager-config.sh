#!/usr/bin/env bash

kubectl -n monitoring get secret alertmanager-prometheus-stack-kube-prom-alertmanager \
-o jsonpath="{.data.alertmanager\.yaml}" | base64 -d
