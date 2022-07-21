#!/usr/bin/env bash

# helm add env 
PATH=$PATH:/usr/local/bin

helm repo add edu https://k8s-edu.github.io/helm-charts
helm repo update

# helm auto-completion 
helm completion bash >/etc/bash_completion.d/helm
# reload bash shell
exec bash 
