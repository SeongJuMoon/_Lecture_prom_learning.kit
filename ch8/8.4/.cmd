kubectl apply -f ~/_Lecture_prom_learning.kit/ch8/8.4/prometheus
kubectl apply -f ~/_Lecture_prom_learning.kit/ch8/8.4/apiserver
kubectl apply -f ~/_Lecture_prom_learning.kit/ch8/8.4/node-exporter
kubectl apply -f ~/_Lecture_prom_learning.kit/ch8/8.4/kube-state-metrics
kubectl patch prometheus prometheus -n monitoring --type merge --patch-file ~/_Lecture_prom_learning.kit/ch8/8.4/prometheusMetricsPatch.yaml

