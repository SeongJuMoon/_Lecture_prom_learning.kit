#!/usr/bin/env bash

helm install prometheus-stack edu/kube-prometheus-stack  \
--set defaultRules.create="false" \
--set alertmanager.enabled="false" \
--set grafana.enabled="false" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80" \
--set prometheus.prometheusSpec.scrapeInterval="15s" \
--set prometheus.prometheusSpec.evaluationInterval="15s" \
--namespace=monitoring \
--create-namespace \
-f ~/_Lecture_prom_learning.kit/ch8/8.2/prom-operator-config/set-sc-8Gi.yaml
