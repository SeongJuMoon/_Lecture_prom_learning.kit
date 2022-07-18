#!/usr/bin/env bash

helm install prometheus edu/prometheus \
--set pushgateway.enabled=false \
--set nodeExporter.tolerations[0].key="node-role.kubernetes.io/control-plane" \
--set nodeExporter.tolerations[0].effect="NoSchedule" \
--set nodeExporter.tolerations[0].operator="Exists" \
--set server.service.type="LoadBalancer" \
--namespace=monitoring \
--create-namespace