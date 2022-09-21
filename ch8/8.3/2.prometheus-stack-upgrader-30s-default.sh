#!/usr/bin/env bash
# scrape default is 30s for kube-prometheus-stack

helm upgrade prometheus-stack edu/kube-prometheus-stack  \
--set defaultRules.create="false" \
--set alertmanager.enabled="false" \
--set grafana.enabled="false" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80" \
--namespace=monitoring \
-f ~/_Lecture_prom_learning.kit/ch8/8.3/+kube-etcd.yaml 
