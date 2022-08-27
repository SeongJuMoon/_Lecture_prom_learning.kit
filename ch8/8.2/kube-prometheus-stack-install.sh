#!/usr/bin/env bash

helm install prometheus edu/kube-prometheus-stack -n monitoring --create-namespace \
--set defaultRules.create="false" \
--set grafana.enabled="false" \
--set prometheus.storage.volumeClaimTemplate.spec.storageClassName="managed-nfs-storage" \
--set prometheus.storage.volumeClaimTemplate.spec.accessModes[0]="ReadWriteOnce" \
--set prometheus.storage.volumeClaimTemplate.spec.resources.requests.storage="8Gi" \
--set prometheus.service.type="LoadBalancer" \
--set prometheus.service.port="80"
-f ~/_Lecture_prometheus_learning.kit/ch8/8.2/settings.yaml