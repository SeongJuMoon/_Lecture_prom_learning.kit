#!/usr/bin/env bash

kubectl create -f ~/_Lecture_prometheus_learning.kit/ch7/7.3/kubernetesControlPlane-serviceMonitorApiserver.yaml
kubectl create -f ~/_Lecture_prometheus_learning.kit/ch7/7.3/kubernetesControlPlane-serviceMonitorCoreDNS.yaml
kubectl create -f ~/_Lecture_prometheus_learning.kit/ch7/7.3/kubernetesControlPlane-serviceMonitorKubeControllerManager.yaml
kubectl create -f ~/_Lecture_prometheus_learning.kit/ch7/7.3/kubernetesControlPlane-serviceMonitorKubelet.yaml
kubectl create -f ~/_Lecture_prometheus_learning.kit/ch7/7.3/kubernetesControlPlane-serviceMonitorKubeScheduler.yaml