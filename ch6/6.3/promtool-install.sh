#!/usr/bin/env bash

curl -LO https://github.com/prometheus/prometheus/releases/download/v2.37.0/prometheus-2.37.0.linux-amd64.tar.gz
tar -xzf prometheus-2.37.0.linux-amd64.tar.gz
install -m 755 prometheus-2.37.0.linux-amd64/promtool /usr/local/bin
rm -rf prometheus-2.37.0*
