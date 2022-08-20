kubectl apply -f ~/_Lecture_prom_learning.kit/ch8/8.7/alertmanager.yaml

kubectl apply -f ~/_Lecture_prom_learning.kit/ch8/8.7/alertmanager.yaml

kubectl patch prometheus prometheus -n monitoring --patch-file ~/_Lecture_prom_learning.kit/ch8/8.7/configuration/prometheus.yaml

sed -i s,Slack-URL,<yourslackurl>,gi ~/_Lecture_prom_learning.kit/ch8/8.7/configuration/alertmanager.yaml

kubectl apply -f ~/_Lecture_prom_learning.kit/ch8/8.7/configuration/alertmanager.yaml

kubectl apply -f f ~/_Lecture_prom_learning.kit/ch8/8.7/nginx

kubectl apply -f ~/_Lecture_prom_learning.kit/ch8/8.7/configuration/nginx-alertrule.yaml

kubectl scale deployment nginx --replicas=0
kubectl scale deployment nginx --replicas=1

kubectl delete -f ~/_Lecture_prom_learning.kit/ch8/8.7/nginx
