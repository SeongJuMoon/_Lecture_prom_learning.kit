#!/usr/bin/env bash

helm install prometheus edu/prometheus \
--set pushgateway.enabled=false \
--set nodeExporter.tolerations[0].key="node-role.kubernetes.io/master" \
--set nodeExporter.tolerations[0].effect="NoSchedule" \
--set nodeExporter.tolerations[0].operator="Exists" \
--set nodeExporter.tolerations[1].key="node-role.kubernetes.io/control-plane" \
--set nodeExporter.tolerations[1].effect="NoSchedule" \
--set nodeExporter.tolerations[1].operator="Exists" \
--set server.service.type="LoadBalancer" \
--set server.service.loadBalancerIP="192.168.1.11" \
--set alertmanager.service.type="LoadBalancer" \
--set alertmanager.service.loadBalancerIP="192.168.1.12" \
--set server.extraFlags[0]="storage.tsdb.no-lockfile" \
--namespace=monitoring \
--create-namespace