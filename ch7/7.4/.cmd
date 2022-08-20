~/_Lecture_prom_learning.kit/ch7/7.4/install-istio.sh
istioctl install --set profile=demo -y

kubectl create namespace bookinfo
kubectl apply -f ~/_Lecture_prom_learning.kit/ch7/7.4/sample/bookinfo

kubectl apply ~/_Lecture_prom_learning.kit/ch7/7.4/blackbox-exporter.yaml
kubectl apply ~/_Lecture_prom_learning.kit/ch7/7.4/blackbox-exporter-service.yaml

kubectl patch configmap -n monitoring prometheus-server --patch-file bookinfo-probe-monitoring.yaml
kubectl delete -f ~/_Lecture_prom_learning.kit/ch7/7.4/sample/bookinfo