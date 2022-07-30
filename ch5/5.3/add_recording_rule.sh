#!/usr/bin/env bash

kubectl patch configmap prometheus-server -n monitoring --patch-file  ~/_Lecture_prom_learning.kit/ch5/5.3/recoding_rule_patch.yaml