#!/usr/bin/env bash
# create namespace again so that user could start from here 
# scrape default is 30s 

helm install prometheus-stack edu/kube-prometheus-stack  \
--set defaultRules.create="false" \
--set grafana.enabled="false" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80" \
--set prometheus.prometheusSpec.scrapeInterval="1m" \
--set prometheus.prometheusSpec.evaluationInterval="1m" \
--namespace=monitoring \
--create-namespace \
-f ~/_Lecture_prom_learning.kit/ch8/8.2/extra-config.yaml 
