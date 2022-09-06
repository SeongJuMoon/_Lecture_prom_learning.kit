# install prometheus-alertmanager 
./prometheus-alertmanager-installer.sh

#
kubectl patch configmap prometheus-alertmanager --patch-file ~/_Lecture_prom_learning.kit/ch6/6.6/server-binding-alertmanager.yaml
sed s,Slack-URL,<yourslackurl>,gi ~/_Lecture_prom_learning.kit/ch6/6.6/alertmanager-config.yaml
kubectl patch configmap prometheus-server --patch-file ~/_Lecture_prom_learning.kit/ch6/6.6/alertmanager-config.yaml

kubectl apply -f ~/_Lecture_prom_learning.kit/ch6/6.6/nginx

kubectl scale deployment nginx --replicas=0

kubectl delete -f ~/_Lecture_prom_learning.kit/ch6/6.6/nginx
