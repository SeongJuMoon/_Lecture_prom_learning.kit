# 0.install mssql-client binary 
0.mysql-client-installer.sh

# 1.practical senario  

# check deployed mysql and svc 
# there is no mysql on prometheus web ui 

# 1. deploy completed mysql stack provisioned by statefulset.
kubectl apply -f 1.sts-mysql.yaml

# 1-1 add data when check after configured data will be not deleted.
./1-1.add-data-to-mysql.sh
# result 
Database
information_schema
mysql
performance_schema
services
sys
id      name
1       martin
2       anthon


# 2 configure podmonitor for prometheus scrape mysql metrics.
kubectl apply -f 2.podmonitor-mysql.yaml

2-1 check target on your browser
# shortcut (http://192.168.1.10/targets).
# chceck podmonitor registered successfully. but doesn't scrape mysql metrics

3. configure mysql exporter statefulset to prometheus scrape mysql metrics.
kubectl apply -f 3.sts-mysql-w-exporter.yaml

3-1. check after updated does mysql data being deleted.
./3-1 3-1.retrieve-data-from-mysql.sh

# you've seen data print console as well

3-2 check again target on your browser
# shortcut (http://192.168.1.10/targets).
# chceck podmonitor registered successfully. let's check promql metrics is available.

3-3.check to add the target and promql 
mysql_global_variables_max_connections - mysql_global_status_threads_connected
mysql_global_variables_open_files_limit - mysql_global_variables_innodb_open_files

# 4.mysql DEMO
# 4-1 max_allowed_packet
# 4-1-1.check max_allowed_packet on prometheus web ui 
mysql_global_variables_max_allowed_packet
# change max_allowed_packet from default(64MB) to 1GB 
# and check which is changed 
./4-1-1.change-max-allowed-packet.sh
# 4-1-2.restore max_allowed_packet from 1GB to default(64MB).
# and check which is changed 
./4-1-2.rollback-max-allowed-packet.sh

# 4-2.connectivity
# check current metrics value in prometheus ui
# metrics describe 'The number of connection attempts (successful or not) to the MySQL server.'
mysql_global_status_connections 
# call mysql-connection-sustainer.sh so that increase the metrics of connections
./4-2.mysql-connection-sustainer.sh
# check again 
mysql_global_status_connections 
# optional 
# rate(mysql_global_status_connections[2m])

# 5.deleted resources for next lab
kubectl delete -f 3.sts-mysql-w-exporter.yaml
kubectl delete pvc data-mysql-0
