#!/usr/bin/env bash

kubectl delete -f ~/_Lecture_prom_learning.kit/ch9/9.3
kubectl delete -f ~/_Lecture_prom_learning.kit/ch9/9.2
kubectl delete -f ~/_Lecture_prom_learning.kit/ch8/8.3/prometheus/
kubectl delete -f ~/_Lecture_prom_learning.kit/ch8/8.2/prometheus-operator/
kubectl delete -f ~/_Lecture_prom_learning.kit/ch8/8.2/crds