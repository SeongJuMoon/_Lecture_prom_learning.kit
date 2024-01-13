# 0. run script to initialize control-plane metric scape enabled.
# this script need to a lot of time.
# please stay moment for processing.
./0.scraping-control-plane-enabled.sh

# 1. create namespace for prometheus environment.
k create ns monitoring

# 1. deploy crd for prometheus-operator.
k create -f 1-1.operator-crd/

# 2. deploy admission-controller for prometheus-operator automated configuration.
k apply -f 1-2.operator-admission-controller/

# 3. deploy prometheus-operator configuration for operated and automated prometheus, alertmanager, configuration etc.
k apply -f 1-3.operator-webhook-configuration/

# 4. deploy prometheus-operator for management and operated application.
k apply -f 1-4.operator

# 5. check prometheus-operator is available
k get po,svc -n monitoring -l app=kube-prometheus-stack-operator 

# 6. deploy prometheus-server via kubectl with crd.
k apply -f 2.prometheus-server

# 7 check prometheus is available.
# 7-1 check crd.
k get prometheus -n monitoring
# 7-2 check promtheus pods and services.
k get po,svc -n monitoring -l app=kube-prometheus-stack-prometheus

# 8. check prometheus web ui go to config
# <shortcut>: http://192.168.1.11/config

# 9. check metric on prometheus web ui.
# <shortcut>: http://192.168.1.11/graph
# search metrics: node_cpu_seconds_total # not found
# search metrics: kube_deployment_status_replicas_available # not found
# search metrics: kubeproxy_sync_proxy_rules_iptables_total # not found

# 10. Add using non-prometheus-ecosystem by servicemonitor 
k apply -R -f 3.exporter-non-prom-ecosystem/

# 11.check the targets status on your browser(http://192.168.1.11/targets).

# 12. check metric on prometheus web ui (kube-proxy).
# <shortcut>: http://192.168.1.11/graph
# search metrics: kubeproxy_sync_proxy_rules_iptables_total # found

# 13. deploy node exporter.
k apply -f 4.node-exporter/

# 14. check node-exporter via kubectl.
k get po,svc -n monitoring -l app=prometheus-node-exporter

# 15. check the targets status on your browser(http://192.168.1.11/targets).

# 16. check metric on prometheus web ui (node-exporter).
# <shortcut>: http://192.168.1.11/graph
# search metrics: node_cpu_seconds_total # found

# 17. deploy kube-state-metrics.
k apply -f 5.kube-state-metrics/

# 18. check kube-state-metrics via kubectl.
k get po,svc -n monitoring -l app.kubernetes.io/name=kube-state-metrics

# 19.check the targets status on your browser(http://192.168.1.11/targets).
# <shortcut>: http://192.168.1.11/targets

# 20. check metric on prometheus web ui (kube-state-metrics).
# <shortcut>: http://192.168.1.11/graph
# search metrics: kube_deployment_status_replicas_available # found

# 21. check alertrule on prometheus web ui
# <shortcut>: http://192.168.1.11/alerts

# 22. register slack receiver on alertmanager 
# change slack API Address
./5-2.MUST-Run-to-change-Slack-URL.sh "https://hooks.slack.com/services/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"

# 23. deploy alertmanager.
k apply -f 6.alertmanager/

# 24. check alertmanager via kubectl
k get po -n monitoring -l alertmanager=prometheus-stack-kube-prom-alertmanager
k get svc -n monitoring -l app=kube-prometheus-stack-alertmanager

# 25. Add alert-rule for trigger alert test.
k apply -f 7.prometheus-alert-rule.yaml

# 26. check alertrule on prometheus web ui
# <shortcut>: http://192.168.1.11/alerts

# 27 adjust replicas to trigger alert test
k scale deploy prometheus-stack-kube-prom-operator -n monitoring --replicas=0

# 28 rollback replicas to snooze alert test
k scale deploy prometheus-stack-kube-prom-operator -n monitoring --replicas=1

# 29 cleanup lab
./8.cleanup-native-prometheus.sh