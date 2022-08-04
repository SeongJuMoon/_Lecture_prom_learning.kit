#!/usr/bin/env bash

PODIP=$(kubectl get pod $1  -o jsonpath="{.status.podIP}")

COUNTER = 0
while true
do
  COUNTER=$((COUNTER + 1))
  echo -ne "$COUNTER - " ; curl $PODIP
done

