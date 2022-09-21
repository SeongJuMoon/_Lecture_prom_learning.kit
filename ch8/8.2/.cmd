
# decode secret for prometheus-operator which is same as cm on native-prometheus 
k get -n monitoring secrets prometheus-prometheus-stack-kube-prom-prometheus -o jsonpath='{.data.prometheus\.yaml\.gz}' | base64 -d | gunzip

# install kube-prometheus-stack
# it operate by prometheus operator

# if as you not uninsall prometheus. execute below shell.
./1.prometheus-uninstaller.sh
# result
release "prometheus" uninstalled

# check pv, pvc was deleted.
kubectl get pv, pvc
# result
error: arguments in resource/name form must have a single resource and name

# install kube-prometheus-stack release to use after lab environments.
./prometheus-stack-installer-15s.sh

# check helm release resource at deployed kubernetes environments.
kubectl get pods -n monitoring

NAME                                                   READY   STATUS    RESTARTS   AGE
prometheus-prometheus-stack-kube-prom-prometheus-0     2/2     Running   0          116s
prometheus-stack-kube-prom-operator-6c94f66664-dgkjh   1/1     Running   0          2m5s
prometheus-stack-kube-state-metrics-75dd467dd7-5pfgl   1/1     Running   0          2m5s
prometheus-stack-prometheus-node-exporter-cn27s        1/1     Running   0          2m5s
prometheus-stack-prometheus-node-exporter-sq8ln        1/1     Running   0          2m5s
prometheus-stack-prometheus-node-exporter-thvkd        1/1     Running   0          2m5s
prometheus-stack-prometheus-node-exporter-tjkkb        1/1     Running   0          2m5s
kubectl get sts -n monitoring
# check statefulset resource.
NAME                                                   READY   AGE
alertmanager-prometheus-stack-kube-prom-alertmanager   1/1     4m15s
prometheus-prometheus-stack-kube-prom-prometheus       1/1     4m15s
# check pv,pvc

# check service resource for as exposed prometheus ui ip address.
# 192.168.1.11

# check prometheus ui(http://192.168.1.11/targets) does target well registry current prometheus
# execurse
# doesn't scrape target
- redirect to 8.4. we fixed them to scrape well.
- 4.7 proxy => talk to pod, service. preconfigured reference on kube-proxy.

# check below promql on your browser(http://192.168.1.11/graph).
node_memory_MemFree_bytes # node-exporter metric
kube_deployment_created  # kube_state-metric metric

# check servicemonitor resource for how does target registerd in prometheus.
 kubectl get servicemonitor -A
