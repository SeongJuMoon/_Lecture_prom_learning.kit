#!/usr/bin/env bash

helm install prometheus edu/kube-prometheus-stack -n monitoring --create-namespace \
--set defaultRules.create="false" \
--set grafana.enabled="false" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80" \
-f ~/_Lecture_prom_learning.kit/ch8/8.2/settings.yaml