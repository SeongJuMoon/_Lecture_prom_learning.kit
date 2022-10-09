#!/usr/bin/env bash
# scrape default is 30s for kube-prometheus-stack

helm upgrade prometheus-stack edu/kube-prometheus-stack \
--set defaultRules.create="false" \
--set grafana.enabled="false" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80" \
--namespace=monitoring \
-f ~/_Lecture_prom_learning.kit/ch9/9.5/prom-operator-config/set-sc-8Gi.yaml \
-f ~/_Lecture_prom_learning.kit/ch9/9.5/prom-operator-config/upt-kube-etcd.yaml \
-f ~/_Lecture_prom_learning.kit/ch9/9.5/prom-operator-config/add-alertmanager.yaml 
