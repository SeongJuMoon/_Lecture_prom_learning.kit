# install prometheus-alertmanager 
./1.prometheus-alertmanager-installer.sh 

# deploy nginx and nginx exporter to collect nginx app metrics 
kubectl apply -f 2.nginx-w-exporter

# register slack receiver on alertmanager 
# change slack API Address ()
sed -i \
's,Slack-URL,<MUST Change> https://hooks.slack.com/services/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,g' \
3.MUST-Change-alertmanager-add-slack-receivers.yaml 

# apply changed slack receiver on prometheus's alertmanager 
kubectl patch configmap prometheus-server -n monitoring --patch-file 3.MUST-Change-alertmanager-add-slack-receivers.yaml

# apply alert configuration for prometheus's alert trigger  
kubectl patch configmap prometheus-server -n monitoring --patch-file 4.nginx-status.alerting.rules.yaml

# check alert tab(192.168.1.11) and alertmanager(192.168.1.65) 

# if you want to init alert rules all 
# run this 
# kubectl patch configmap prometheus-server -n monitoring --patch-file 5.init.alertmanager-alerting.rules.yaml
