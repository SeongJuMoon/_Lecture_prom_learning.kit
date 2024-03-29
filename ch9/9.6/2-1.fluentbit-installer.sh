#!/usr/bin/env bash

helm install fluent-bit edu/fluent-bit \
--set serviceMonitor.enabled="true" \
--set serviceMonitor.selector.release="prometheus-stack" \
--set serviceMonitor.namespace="monitoring" \
--namespace=logging \
--create-namespace
