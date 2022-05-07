#!/usr/bin/env bash

curl -LO https://github.com/prometheus/prometheus/releases/download/v2.30.0/prometheus-2.30.0.linux-amd64.tar.gz
TMPDIR=$(mktemp -d)
tar xzf prometheus-2.30.0.linux-amd64.tar.gz -C $TMPDIR --strip-components=1
rm -rf prometheus-2.30.0.linux-amd64.tar.gz

install -m 0755 $TMPDIR/prometheus $TMPDIR/promtool /usr/bin/
install -d -o root -g root /var/lib/prometheus
install -m 0644 -D $TMPDIR/prometheus.yml /etc/prometheus/prometheus.yml
install -m 0644 -D $HOME/_Lecture_prometheus_learning.kit/ch2/2.3/config/prometheus.service /etc/systemd/system

systemctl daemon-reload
systemctl enable --now prometheus
systemctl start prometheus