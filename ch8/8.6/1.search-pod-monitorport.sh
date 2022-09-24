#!/usr/bin/env bash

kubectl get pods -n metallb-system -o jsonpath="{range .items[*]}{.metadata.name}{'\t'}{range @.spec.containers[*].ports[*]}{@.name}{'/'}{@.protocol}{'-'}{@.containerPort}{','}{end}{'\n'}{end}"
