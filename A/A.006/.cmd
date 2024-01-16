# 1-1. deploy crd for prometheus-operator.
k create -f 1-1.prometheus-operator-crd

# 1-2. deploy admission-controller for prometheus-operator automated configuration.
k apply -f 1-2.prometheus-operator-admission-controller.yaml

# 1-3. deploy prometheus-operator for management and operated application.
k apply -f 1-3.prometheus-operator.yaml

# 1-4. check prometheus-operator is available
k get po,svc -n monitoring 

# 2-1. deploy prometheus-server via kubectl with crd.
k apply -f 2-1.prometheus-server.yaml

# 2-2. check prometheus is available.
# 2-2-1 check crd.
k get prometheus -n monitoring
# 2-2-2 check promtheus pods and services.
k get po,svc -n monitoring

# 2-3.check the targets status on your browser(http://192.168.1.11/targets).

# 2-4. check prometheus web ui go to graph
# <shortcut>: http://192.168.1.11/graph
# search metrics: up

# 2-5. deploy servicemonitor for add targets for prometheus
k apply -f 2-2.prometheus-servicemonitor.yaml

# 2-6. check the targets status on your browser(http://192.168.1.11/targets).

# 2-7. check prometheus web ui go to graph
# <shortcut>: http://192.168.1.11/graph
# search metrics: up

# 2-8. deploy servicemonitor for add targets for prometheus-operator
k apply -f 2-2.prometheus-servicemonitor.yaml

# 2-10. check the targets status on your browser(http://192.168.1.11/targets).

# 2-11. check prometheus web ui go to graph
# <shortcut>: http://192.168.1.11/graph
# search metrics: up

# 3. deploy servicemonitor for controller
k apply -R -f 3-1.control-plane/

# 3-1. check the targets status on your browser(http://192.168.1.11/targets).

# 3-2. check prometheus web ui go to graph
# <shortcut>: http://192.168.1.11/graph
# search metrics: up

# 3-3. run script to initialize control-plane metric scape enabled.
# this script need to a lot of time.
# please stay moment for processing.
./3-2.scraping-control-plane-enabled.sh

# 3-4. check the targets status on your browser(http://192.168.1.11/targets).

# 3-5.  check prometheus web ui go to graph
# <shortcut>: http://192.168.1.11/graph
# search metrics: up

# 4-1. deploy node exporter.
k apply -f 4-1.node-exporter.yaml

# 4-2. check the targets status on your browser(http://192.168.1.11/targets).

# 4-3.  check prometheus web ui go to graph
# <shortcut>: http://192.168.1.11/graph
# search metrics: up

# 4-4. deploy servicemonitor for node-exporter.
k apply -f 4-2.node-exporter-servicemonitor.yaml

# 4-5. check the targets status on your browser(http://192.168.1.11/targets).

# 4-6.  check prometheus web ui go to graph
# <shortcut>: http://192.168.1.11/graph
# search metrics: up

# 4-7. deploy kube-state-metrics.
k apply -f 4-3.kube-state-metrics.yaml

# 4-8. check the targets status on your browser(http://192.168.1.11/targets).

# 4-9.  check prometheus web ui go to graph
# <shortcut>: http://192.168.1.11/graph
# search metrics: up

# 4-10. deploy servicemonitor for kube-state-metrics
k apply -f 4-4.kube-state-metrics-servicemonitor.yaml

# 4-11. check the targets status on your browser(http://192.168.1.11/targets).

# 4-12.  check prometheus web ui go to graph
# <shortcut>: http://192.168.1.11/graph
# search metrics: up

# 5-1. deploy recoding-rule 
k apply -f 5.prometheus-recording-rule.yaml

# 5-2. deploy recoding-rule 
# <shortcut>: http://192.168.1.11/rules

# 6 cleanup lab
6-1.cleanup-prometheus-stack.sh