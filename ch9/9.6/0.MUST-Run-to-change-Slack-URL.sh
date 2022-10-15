#!/usr/bin/env bash

sed s,Slack-URL,$1,g -i ~/_Lecture_prom_learning.kit/ch9/9.5/prom-operator-config/prom-operator-config-merged.yaml
