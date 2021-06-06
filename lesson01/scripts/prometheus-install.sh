#!/usr/bin/env bash

sudo -i

useradd --system prometheus
passwd prometheus

curl -LO https://github.com/prometheus/prometheus/releases/download/v2.25.0/prometheus-2.25.0.linux-amd64.tar.gz
tar prometheus-2.25.0.linux-amd64.tar.gz
install -m 755 prometheus /usr/local/bin

pushd /etc/systemd/system

cat > prometheus.service <<EOF

EOF
