# 0. Settings and verify opsgenie.
shoutcut: https://www.atlassian.com/software/opsgenie
- sign up
- profile settings: enter your phone number and verify
- Install Opsgenie app on your phone. <iOS, Android>

# 0-1. Create teams for active opsgenie on-call.
shortcut: https://<youropsgenie>.app.opsgenie.com/teams/list
0-2. Click [Add team] button.
0-3. Fill in the form below.
  * Name: SRE
  * Description: SRE Team
0-4. Click [Add team] button.

# 0-2. Create API Integration for prometheus alertmanager.
0-2-1. Click SRE team at team list. 
0-2-2. Click [ Integrations ] tab on left side.
0-2-3. Click [ Add Integration ] button.
0-2.4. Search [ Prometheus ] and click.
0-2-5. Fill in the form below.
  * Name: alertmanager
  * Assignee team: SRE
0-2-6. Click [ Coutinue ] button.
0-2-7. Click [Steps to configure the integration] accordion menu.
0-2-8. Check your API key at 3rd steps and copy it.
0-2-9. Click [ Turn on integration ] button.

# 1. Setup prometheus environment
./1.prometheus-alertmanager-upgrader.sh
# 1-1. Confirm deploy and service deployed as well.
k get po,svc -n monitoring
- alertmanager
- prometheus
... etc 
# 1-2. Checkout prometheus ui
shortcut: < http://192.168.1.11 >

# 2-1. deploy nginx-w-exporter for send alert to opsgenie.
k apply -f ./2-1.nginx-w-exporter
# Confirm deploy and service deployed as well.
k get po,svc

# 3. Apply alert configuration for trigger opsgenie.
kubectl patch configmap prometheus-server -n monitoring --patch-file 3.nginx-status.alerting.rules.yaml

# 4. change slack API Address
# 4-1. generate alertmanager configuration which send message to opsgenie.
./4-1.generate-alertmanager-config.sh
# apply changed opsgenie receiver on prometheus's alertmanager 
kubectl patch configmap prometheus-alertmanager -n monitoring --patch-file 4-2.opsgenie-notifier.yaml

# 5. Trigger on-call to opsgenie via kubectl scale command.
kubectl scale deployment nginx --replicas=0
# 5-1. Confirm alert on opsgenie.
shoutcut: https://<youropsgenie>.app.opsgenie.com/alert/list
Or
Opsgenie app on your phone.
# 5-2. Resolve triggered alert via kubectl scale command.
kubectl scale deployment nginx --replicas=2
