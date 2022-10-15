#!/usr/bin/env bash

helm --namespace logging uninstall fluent-bit
kubectl delete ns logging
