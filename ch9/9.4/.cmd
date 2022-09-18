# 1. prepare istio and sample application.
./prepare.sh

# 2. check istio-ingressgateway is active.
kubectl get svc istio-ingressgateway -n istio-system

# 3. check kiali dashboard to check application status is active.
# http://192.168.1.20:20001/kiali/console/applications

# 4. check kiali dashboard to see inter application related diagram
# http://192.168.1.20:20001/kiali/console/graph/

# 4. call load-generator.sh to view service related diagram.
./load-generator.sh

# cancel load-generator.sh for execute after task.
CTRL+C

# 4. check blackbox-exporter directory items.
ls -rlt 2.blackbox-exporter/
service.yaml deployment.yaml configmap.yaml


# 5. deploy blackbox-exporter
kubectl apply -f ./2.blackbox-exporter
# result
configmap/prometheus-blackbox-exporter created
deployment.apps/prometheus-blackbox-exporter created
service/prometheus-blackbox-exporter created

# check blackbox-exporter-config.yaml
# new job blackbox-kubernetes-healthcheck-services appends

cat 3.add-blackbox-exporter-config.yaml | nl
     1  data:
     2    prometheus.yml: |
     3      global:
     4        evaluation_interval: 1m
     5        scrape_interval: 1m
     6        scrape_timeout: 15s
     7      rule_files:
     8      - /etc/config/recording_rules.yml
     9      - /etc/config/alerting_rules.yml
    10      - /etc/config/rules
    11      - /etc/config/alerts
    12      scrape_configs:
    13      - job_name: "blackbox-kubernetes-healthcheck-services"
    14        metrics_path: /probe
    15        params:
    16          module: [http_2xx]
    17          target:
    18           - health
    19        kubernetes_sd_configs:
    20        - role: service
    21        relabel_configs:
    22          - source_labels: [__meta_kubernetes_service_annotation_prometheus_io_should_be_probed]
    23            action: keep
    24            regex: true
    25          - source_labels:
    26            - __address__
    27            - __meta_kubernetes_service_annotation_prometheus_io_healthcheck_path
    28            regex: (.*);(.*)
    29            replacement: http://$1$2
    30            target_label: __param_target
    31          - target_label: __address__
    32            replacement:  prometheus-blackbox-exporter.monitoring.svc.cluster.local:9115
    33          - source_labels: [__param_target]
    34            target_label: instance
    35          - action: labelmap
    36            regex: __meta_kubernetes_service_label_(.+)
    37          - source_labels: [__meta_kubernetes_namespace]
    38            target_label: kubernetes_namespace
    39          - source_labels: [__meta_kubernetes_service_name]
    40            target_label: kubernetes_service_name
    +++

# check target service annotation.
kubectl get service -n bookinfo
# result
details       ClusterIP   10.101.1.84      <none>        9080/TCP   50m
productpage   ClusterIP   10.102.55.5      <none>        9080/TCP   50m
ratings       ClusterIP   10.108.154.181   <none>        9080/TCP   50m
reviews       ClusterIP   10.106.153.64    <none>        9080/TCP   50m

kubectl get service -n bookinfo details -o yaml | nl
# result
7 prometheus.io/healthcheck_path: /health
8 prometheus.io/should_be_probed: "true"

kubectl get service -n bookinfo productpage -o yaml | nl
# result
7 prometheus.io/healthcheck_path: /health
8 prometheus.io/should_be_probed: "true"

kubectl get service -n bookinfo ratings -o yaml | nl
# result
7 prometheus.io/healthcheck_path: /health
8 prometheus.io/should_be_probed: "true"

kubectl get service -n bookinfo reviews -o yaml | nl
# result
7 prometheus.io/healthcheck_path: /health
8 prometheus.io/should_be_probed: "true"

# patch prometheus config to add job blackbox-kubernetes-healthcheck-service.
kubectl patch configmap -n monitoring prometheus-server --patch-file ./3.add-blackbox-exporter-config.yaml

# check prometheus ui (http://192.168.1.11/targets)  blackbox-kubernetes-healthcheck-service target target count
# you seen 4 item below 'blackbox-kubernetes-healthcheck-service target' job.


# scale down deployment detail-v1 to test probe is possiable.
kubectl scale -n bookinfo deployment details-v1 --replicas=0

# call load-generator.sh to view graph diagram.
././load-generator.sh

# check kiali dashboard to see inter application related diagram
# you seen the detail diagram border red color
# http://192.168.1.20:20001/kiali/console/graph

# check prometheus web ui(http://192.168.1.11/graph) enter query below.
# you seen details service status code is not measured.

probe_http_status_code
# result 

probe_http_status_code{app="details", instance="http://details.bookinfo.svc:9080/health", job="blackbox-kubernetes-healthcheck-services", kubernetes_namespace="bookinfo", kubernetes_service_name="details", service="details"}
0
probe_http_status_code{app="productpage", instance="http://productpage.bookinfo.svc:9080/health", job="blackbox-kubernetes-healthcheck-services", kubernetes_namespace="bookinfo", kubernetes_service_name="productpage", service="productpage"}
200
probe_http_status_code{app="ratings", instance="http://ratings.bookinfo.svc:9080/health", job="blackbox-kubernetes-healthcheck-services", kubernetes_namespace="bookinfo", kubernetes_service_name="ratings", service="ratings"}
200
probe_http_status_code{app="reviews", instance="http://reviews.bookinfo.svc:9080/health", job="blackbox-kubernetes-healthcheck-services", kubernetes_namespace="bookinfo", kubernetes_service_name="reviews", service="reviews"}
200

# cancel load_generator.sh for next steps.
CTRL + C

# restore deployment scale for correct metrics.
kubectl scale -n bookinfo deployment details-v1 --replicas=1

# call load-generator.sh to view graph diagram.
# checkout http://192.168.1.20:20001/kiali/console/graph/namespaces
./load-generator.sh

# check prometheus web ui(http://192.168.1.11/graph) enter query below.
# you seen all service http_status_code return 200.

probe_http_status_code
# result 

probe_http_status_code{app="details", instance="htt://details.bookinfo.svc:9080/health", job="blackbox-kubernetes-healthcheck-services", kubernetes_namespace="bookinfo", kubernetes_service_name="details", service="details"}
200
probe_http_status_code{app="productpage", instance="http://productpage.bookinfo.svc:9080/health", job="blackbox-kubernetes-healthcheck-services", kubernetes_namespace="bookinfo", kubernetes_service_name="productpage", service="productpage"}
200
probe_http_status_code{app="ratings", instance="http://ratings.bookinfo.svc:9080/health", job="blackbox-kubernetes-healthcheck-services", kubernetes_namespace="bookinfo", kubernetes_service_name="ratings", service="ratings"}
200
probe_http_status_code{app="reviews", instance="http://reviews.bookinfo.svc:9080/health", job="blackbox-kubernetes-healthcheck-services", kubernetes_namespace="bookinfo", kubernetes_service_name="reviews", service="reviews"}
200

# delete 
./5.uninstall.sh
kubectl patch -n monitoring configmap prometheus-server --patch-file ./4.delete-blackbox-exporter-config.yaml