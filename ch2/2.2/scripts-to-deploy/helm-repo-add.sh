#!/usr/bin/env bash

# instant shlle cannot read properly env. so temperally full address fixed 
/usr/local/bin/helm repo add edu https://k8s-edu.github.io/helm-charts
/usr/local/bin/helm repo update
/usr/local/bin/helm completion bash >/etc/bash_completion.d/helm

