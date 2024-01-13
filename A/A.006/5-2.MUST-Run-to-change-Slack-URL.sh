#!/usr/bin/env bash

if [ "$#" -lt 1 ]; then 
    echo "please enter your SLACK_URL"
    exit 1
fi

BASE_DIR=$(pwd)
SLACK_URL=$1
cat > /tmp/alertmanager-config.yaml.tpl <<EOF
global:
  resolve_timeout: 10m
  slack_api_url: ${SLACK_URL}
receivers:
- name: default-receiver
- name: slack
  slack_configs:
  - send_resolved: true
    text: |
      *Description:*
      {{ .CommonAnnotations.description }}
    title: '[{{.Status | toUpper}}] {{ .CommonLabels.alertname }}'
route:
  group_interval: 1m
  group_wait: 10s
  receiver: slack
  repeat_interval: 5m
  routes:
  - receiver: slack
templates:
- /etc/alertmanager/config/*.tmpl
EOF

envsubst < /tmp/alertmanager-config.yaml.tpl  > /tmp/alertmanager.yaml
kubectl create secret generic alertmanager-prometheus-stack-kube-prom-alertmanager -n monitoring --from-file=/tmp/alertmanager.yaml --dry-run=client -o yaml > $BASE_DIR/6.alertmanager/secret.yaml
echo "alertmanager config generate from your input slack-url: $SLACK_URL"