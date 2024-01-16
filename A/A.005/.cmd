# 0. uninstall prometheus && related matters. 
 ~/_Lecture_prom_learning.kit/A/A.001/prometheus-uninstaller.sh
 ~/_Lecture_prom_learning.kit/A/A.001/prometheus-stack-uninstaller.sh



# 0. run script to initialize control-plane metric scape enabled.
# this script need to a lot of time.
# please stay moment for processing.
./0.scraping-control-plane-enabled.sh

# 1. create namespace for prometheus environment.
k create ns monitoring

# 2. deploy server
k apply -f 1.prometheus-server/

# 3. check prometheus-server via kubectl.
k get po,svc -n monitoring -l component=server

# 4. check prometheus web ui go to config
# <shortcut>: http://192.168.1.11/config

# 5. check metric on prometheus web ui.
# <shortcut>: http://192.168.1.11/graph
# search metrics: node_cpu_seconds_total # not found
# search metrics: kube_deployment_status_replicas_available # not found
# search metrics: kubeproxy_sync_proxy_rules_iptables_total # found

# 6. deploy node exporter.
k apply -f 2.node-exporter/

# 7. check node-exporter via kubectl.
k get po,svc -n monitoring -l component=node-exporter

# 8.check the targets status on your browser(http://192.168.1.11/targets).

# 9. check metric on prometheus web ui (node-exporter).
# <shortcut>: http://192.168.1.11/graph
# search metrics: node_cpu_seconds_total # found

# 10. deploy kube-state-metrics.
k apply -f 3.kube-state-metrics/

# 11. check kube-state-metrics via kubectl.
k get po,svc -n monitoring -l app.kubernetes.io/name=kube-state-metrics

# 12.check the targets status on your browser(http://192.168.1.11/targets).
# <shortcut>: http://192.168.1.11/targets

# 13. check metric on prometheus web ui (kube-state-metrics).
# <shortcut>: http://192.168.1.11/graph
# search metrics: kube_deployment_status_replicas_available # found

# 14. check alertrule on prometheus web ui
# <shortcut>: http://192.168.1.11/alerts

# 15. register slack receiver on alertmanager 
# change slack API Address
./3-2.MUST-Run-to-change-Slack-URL.sh "https://hooks.slack.com/services/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"

# 16. deploy node exporter.
k apply -f 4.alertmanager/

# 17. check alertmanager via kubectl
k get po,svc -n monitoring -l component=alertmanager

# 18. deploy sample-app(nginx) for trigger alert test.
k apply -f 5.test-alertmanager-sendalert/1.nginx-w-exporter/

# 19 check application deploy successfully.
k get po,svc -l app=nginx

# 20. Add alert-rule for trigger alert test.
k patch configmap prometheus-server -n monitoring --patch-file 5.test-alertmanager-sendalert/2.nginx-status.alerting.rules.yaml

# 21. check alertrule on prometheus web ui
# <shortcut>: http://192.168.1.11/alerts

# 22 adjust replicas to trigger alert test
k scale deploy nginx --replicas=0

# 23 rollback replicas to snooze alert test
k scale deploy nginx --replicas=2

# 24 cleanup lab
./6.cleanup-native-prometheus.sh
