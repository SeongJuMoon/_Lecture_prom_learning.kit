#!/usr/bin/env bash

helm install metallb edu/metallb \
     --create-namespace \
     --namespace=metallb-system \
     --set controller.image.tag=v0.13.3 \
     --set speaker.image.tag=v0.13.3 \
     -f ~/_Lecture_prometheus_learning.kit/ch2/2.2/scripts-by-helm/l2-metallb-config.yaml
