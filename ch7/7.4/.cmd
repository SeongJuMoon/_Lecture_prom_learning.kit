kubectl apply -f ~/_L 
kubectl patch cm -n monitoring prometheus-server --patch-file bookinfo-probe-monitoring.yaml

