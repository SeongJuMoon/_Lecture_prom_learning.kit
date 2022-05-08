#!/usr/bin/env bash

helm install metallb edu/metallb \
     --create-namespace \
     --namespace=metallb-system \
     --set controller.image.tag=v0.10.2 \
     --set speaker.image.tag=v0.10.2 \
     -f ~/_Lecture_prometheus_learning.kit/ch2/2.2/provisionning/l2-metallb-config.yaml