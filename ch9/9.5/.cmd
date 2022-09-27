# 1. configure slack webhook url.
./1.MUST-Run-to-change-Slack-URL.sh <your slack webhookurl>
# 2. configure alertmanager 
./2.prometheus-stack-upgrader-15s.sh
# 3. add alerting rule. to monitor prometheus operator.
kubectl apply -f 3.prometheusOperatorDown.yaml
# 4. check prometheusrule on browser
# shortcut http://192.168.1.10/targets 
# check prometheus alert menu
# 5. mutate deployment state.
kubectl scale deploy -n monitoring prometheus-stack-kube-prom-operator --replicas=0
# 6. check slack message.
# you've seen alert
# 7. mutate deployment state.
kubectl scale deploy -n monitoring prometheus-stack-kube-prom-operator --replicas=1
# 8. check slack message.
# you've seen alert resolved