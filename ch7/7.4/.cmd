# 0-1.deploy istio and sample application.
./0.deploy-MSA-apps-w-istio.sh 

# 0-2.run 'load-generator.sh' to view service related diagram.
./istio/load-generator-5s.sh

##### new terminal #####
# 1.deploy prometheus-blackbox-exporter 
kubectl apply -f 1.prometheus-blackbox-exporter

# 2.chagne prometheus configmap so that add blackbox job 
kubectl patch configmap -n monitoring prometheus-server --patch-file 2.add-blackbox-exporter-target.yaml

# check blackbox target which is registed 

# 3.make a sudden issue that is 'replicas 0'
kubectl scale -n bookinfo deployment details-v1 --replicas=0

# 4. check status on kiali dashbard and query on prometheus web ui
probe_http_status_code

# 5 delete blackbox configmap & uninstall all of applications 
kubectl patch -n monitoring configmap prometheus-server --patch-file ./3.abort-blackbox-exporter-target.yaml
./uninstall-all.sh 
