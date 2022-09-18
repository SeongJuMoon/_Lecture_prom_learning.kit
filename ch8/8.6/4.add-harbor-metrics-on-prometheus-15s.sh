#!/usr/bin/env bash

helm upgrade -i prometheus edu/kube-prometheus-stack -n monitoring --create-namespace \
--set defaultRules.create="false" \
--set grafana.enabled="false" \
--set alertmanager.enabled="false" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80" \
--set prometheus.prometheusSpec.scrapeInterval="15s" \
--set prometheus.prometheusSpec.evaluationInterval="15s" \
-f ~/_Lecture_prom_learning.kit/ch8/8.6/settings.yaml
