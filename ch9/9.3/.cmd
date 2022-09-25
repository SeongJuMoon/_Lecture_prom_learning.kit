# prepare lab dependencies. install bookinfo
./0.deploy-MSA-apps-w-istio.sh

# install blackbox exporter
kubectl apply -f ./1.prometheus-blackbox-exporter/

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

# 3.delete blackbox & configmap, uninstall all of istio applications, prometheus itself too
kubectl delete -f 1.prometheus-blackbox-exporter 
./3.istio-uninstaller.sh
