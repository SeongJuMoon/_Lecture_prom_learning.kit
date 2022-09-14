# 0.deploy istio and sample application.
./0.deploy-MSA-apps-w-istio.sh 

# 1.deploy prometheus-blackbox-exporter 
kubectl apply -f 1.prometheus-blackbox-exporter

# 2.blackbox 
# 2-1.chagne prometheus configmap so that add blackbox job 
kubectl patch configmap -n monitoring prometheus-server --patch-file 2.add-blackbox-exporter-target.yaml

# check blackbox target which is registed 

# check status on kiali dashbard and query on prometheus web ui
# check for average on probe duration time by instance. 
avg(probe_duration_seconds) by (instance)

# 2-2.make a sudden issue that is 'replicas'
kubectl scale -n bookinfo deployment details-v1 --replicas=0

# check and query on prometheus web ui
# check details-v1 service value is 0 that mean details-v1 service got incident.
sum(probe_success) by (kubernetes_service_name) != 1

# check query on prometheus web ui
# check details-v1 service value is 0
probe_http_status_code

# 2-3.chagne prometheus configmap to be default 
kubectl patch -n monitoring configmap prometheus-server --patch-file ./3.del-blackbox-exporter-target.yaml

# 3.delete blackbox & configmap, uninstall all of istio applications, prometheus itself too
kubectl delete -f 1.prometheus-blackbox-exporter 
./4.istio-uninstaller.sh
./5.prometheus-uninstaller.sh

