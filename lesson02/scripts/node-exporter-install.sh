#!/usr/bin/env bash

sudo -i

useradd --system exporteradm
passwd exporteradm

curl -LO https://github.com/prometheus/prometheushttps://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz
tar node_exporter-1.1.2.linux-amd64.tar.gz
install -m 755 prometheus /usr/local/bin

pushd /etc/systemd/system

cat > prometheus.service <<EOF

EOF

popd