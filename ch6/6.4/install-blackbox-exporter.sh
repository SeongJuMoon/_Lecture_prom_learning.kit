#!/usr/bin/env bash

docker run --rm -d --network=host --name blackbox_exporter \
prom/blackbox-exporter:v0.22.0