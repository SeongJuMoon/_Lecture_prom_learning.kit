#!/usr/bin/env bash

helm upgrade prometheus-stack edu/kube-prometheus-stack  \
--set defaultRules.create="false" \
--set grafana.enabled="false" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80" \
--set prometheus.prometheusSpec.scrapeInterval="15s" \
--set prometheus.prometheusSpec.evaluationInterval="15s" \
--namespace=monitoring \
-f ~/_Lecture_prom_learning.kit/ch8/8.4/extra-config.yaml 
