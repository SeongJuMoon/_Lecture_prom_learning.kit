#!/usr/bin/env bash

helm repo add edu https://k8s-edu.github.io/helm-charts
helm repo update
helm completion bash >/etc/bash_completion.d/helm