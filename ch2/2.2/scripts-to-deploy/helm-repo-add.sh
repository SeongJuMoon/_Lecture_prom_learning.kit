#!/usr/bin/env bash

# instant shlle cannot read properly env. so temperally full address fixed 
export PATH=$PATH:/usr/local/bin/
helm repo add edu https://k8s-edu.github.io/helm-charts
helm repo update
helm completion bash >/etc/bash_completion.d/helm

