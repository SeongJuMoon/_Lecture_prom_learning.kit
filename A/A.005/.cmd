# 0. uninstall prometheus && related matters. 
 ~/_Lecture_prom_learning.kit/A/A.001/prometheus-uninstaller.sh
 ~/_Lecture_prom_learning.kit/A/A.001/prometheus-stack-uninstaller.sh



# 0. run script to initialize control-plane metric scape enabled.

# 1-1 deploy prometheus-server
k apply -f 1-1.prometheus-server.yaml

# 1-2 check prometheus-server is available
watch -n 2 kubectl get pods -n monitoring

# 1-3 check pods describe for what's matter in prometheus-server.
k describe -n monitoring pods prometheus-server-<tab>
#   MountVolume.SetUp failed for volume "config-volume" : configmap "prometheus-server" not found

# 1-4 add deploy initial prometheus-configmap.
k apply -f 1-2-prometheus-server-configmap.yaml

# 1-5 check prometheus-server is available
watch -n 2 kubectl get pods -n monitoring

# 1-6 rollout prometheus-server deployment.
k rollout restart -n monitoring deploy prometheus-server

# 2-1 deploy node-exporter
k apply -f 2-1.node-exporter.yaml

# 2-2 check node-exporter metrics via curl
curl http://192.168.1.10:9100/metrics
curl http://192.168.1.102:9100/metrics

# 2-3 deploy configmap for scraping the metrics
k apply -f 2-2.config-w-annotations.yaml

# 2-4 deploy kube-state-metrics 
k apply -f 2-3.kube-state-metrics.yaml

# 3. recording-rule 설정
kubectl patch configmap prometheus-server -n monitoring --patch-file 3.prometheus-recording.rules-container-memory-topk3.yaml

# 4 cleanup lab
./4.cleanup-native-prometheus.sh
