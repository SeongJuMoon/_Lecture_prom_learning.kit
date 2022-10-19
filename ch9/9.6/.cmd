./0.MUST-Run-to-change-Slack-URL.sh < Web-hook URL >
./1.prometheus-stack-upgrader-15s.sh

kubectl get prometheusrules -n monitoring
NAME                                      AGE
kube-prometheus-stack-alert               108s
kube-prometheus-stack-container-metrics   108s
kube-prometheus-stack-node-metrics        108s

kubectl get cm -n monitoring
NAME                                                           DATA   AGE
kube-root-ca.crt                                               1      10d
prometheus-prometheus-stack-kube-prom-prometheus-rulefiles-0   3      2m8s  <<<

-=-=-=-

./2-1.fluentbit-installer.sh
./2-2.fluentbit-uninstaller.sh

