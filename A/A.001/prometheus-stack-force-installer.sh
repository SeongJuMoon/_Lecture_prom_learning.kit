#!/usr/bin/env bash

helm uninstall -n monitoring prometheus > /dev/null 2>&1
helm uninstall -n monitoring prometheus-stack > /dev/null 2>&1
kubectl -n monitoring delete pvc prometheus-prometheus-stack-kube-prom-prometheus-db-prometheus-prometheus-stack-kube-prom-prometheus-0 > /dev/null 2>&1
echo "waiting for deleting prometheus componentes in 5 Seconds"; sleep 5
echo "Delete all prometheus components successfully!"
echo "----------------------------------------------"

echo "Start to deploy prometheus operator with scraping 15s interval"
echo "=============================================================="
sh ~/_Lecture_prom_learning.kit/ch8/8.2/prometheus-stack-installer-15s.sh
echo "--------------------------------------------------------------"
echo "enable to srape control-plane componentes"
sh ~/_Lecture_prom_learning.kit/ch8/8.3/1.scraping-control-plane-enabled.sh
echo "waiting for enabling prometheus componentes in 15 Seconds"; sleep 15
echo "--------------------------------------------------------------"
echo "change etcd exposed port for insecure mode"
sh ~/_Lecture_prom_learning.kit/ch8/8.3/2.prometheus-stack-upgrader-15s.sh
