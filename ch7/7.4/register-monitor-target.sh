#!/usr/bin/env bash

kubectl create -f ~/_Lecture_prometheus_learning.kit/ch7/7.4/kubernetesControlPlane-serviceMonitorApiserver.yaml
kubectl create -f ~/_Lecture_prometheus_learning.kit/ch7/7.4/kubernetesControlPlane-serviceMonitorCoreDNS.yaml
kubectl create -f ~/_Lecture_prometheus_learning.kit/ch7/7.4/kubernetesControlPlane-serviceMonitorKubeControllerManager.yaml
kubectl create -f ~/_Lecture_prometheus_learning.kit/ch7/7.4/kubernetesControlPlane-serviceMonitorKubelet.yaml
kubectl create -f ~/_Lecture_prometheus_learning.kit/ch7/7.4/kubernetesControlPlane-serviceMonitorKubeScheduler.yaml