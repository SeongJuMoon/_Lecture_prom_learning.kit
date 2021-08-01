#!/usr/bin/env bash

sudo -i
useradd --system prometheus --shell /bin/false

cd /tmp
curl -s -LO https://github.com/prometheus/prometheus/releases/download/v2.25.0/prometheus-2.25.0.linux-amd64.tar.gz
tar prometheus-2.25.0.linux-amd64.tar.gz
install -m 755 prometheus /usr/local/bin
install -m 755 promtool /usr/local/bin

mkdir /etc/prometheus
mkdir /var/lib/prometheus

chown prometheus:prometheus /etc/prometheus
chown prometheus:prometheus /var/lib/prometheus

pushd /etc/systemd/system

cat > prometheus.service <<EOF

[Service]


EOF
