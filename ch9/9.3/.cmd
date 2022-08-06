kubectl apply -f ~/_Lecture_prometheus_learning.kit/ch8/8.2/mysql.yaml
kubectl exec -it mysql-7cdc7c8c8d-vjt4j -- mysql -u root -p
1234

CREATE USER 'exporter'@'%' IDENTIFIED BY '1234' WITH MAX_USER_CONNECTIONS 3;
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'%';
^D

kubectl apply -f ~/_Lecture_prometheus_learning.kit/ch8/8.2/mysqld-exporter.yaml
kubectl apply -f ~/_Lecture_prometheus_learning.kit/ch8/8.2/serviceMonitor.yaml
