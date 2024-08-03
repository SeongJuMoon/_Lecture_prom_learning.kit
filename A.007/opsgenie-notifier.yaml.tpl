data:
  alertmanager.yml: |
    global:
      resolve_timeout: 3m
    receivers:
    - name: default-receiver
    - name: opsgenie
      opsgenie_configs:
      - api_key: api-key
    route:
      group_interval: 30s
      group_wait: 10s
      receiver: opsgenie
      repeat_interval: 2m
