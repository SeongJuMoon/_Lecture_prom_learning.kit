# 0.install mssql-client binary 
0.mysql-client-installer.sh

# 1-1.deploy at a once for mysql 
kubectl apply -f 1.mysql-w-exporter.yaml

# check to add the target and promql 
# if promQL is not working properly, please run './3-1-1.change-max-allowed-packet.sh' first
mysql_up 
mysql_global_status_uptime

# 1-2.delete deployed mysql 
kubectl delete -f 1.mysql-w-exporter.yaml 


# 2.practical senario  
# 2-1.deploy mysql only 
kubectl apply -f 2-0.mysql.yaml

# check deployed mysql and svc 
# there is no mysql on prometheus web ui 

# 2-2.deploy mysqld-exporter to scrape from mysql  
kubectl apply -f 2-1.mysqld-exporter.yaml

# 2-3.check to add the target and promql 
mysql_global_variables_max_connections - mysql_global_status_threads_connected
mysql_global_variables_open_files_limit - mysql_global_variables_innodb_open_files


# 3.mysql DEMO
# 3-1 max_allowed_packet
# 3-1-1.check max_allowed_packet on prometheus web ui 
mysql_global_variables_max_allowed_packet
# change max_allowed_packet from default(64MB) to 1GB 
# and check which is changed 
./3-1-1.change-max-allowed-packet.sh
# 3-1-2.restore max_allowed_packet from 1GB to default(64MB).
# and check which is changed 
./3-1-2.rollback-max-allowed-packet.sh

# 3-2.connectivity
# check current metrics value in prometheus ui
# metrics describe 'The number of connection attempts (successful or not) to the MySQL server.'
mysql_global_status_connections 
# call bulk-connect.sh so that increase the metrics of connections
./3-2.mysql-connetion-sustainer.sh
# check again 
mysql_global_status_connections 
# optional 
# rate(mysql_global_status_connections[2m])


# 4.deleted resources for next lab
kubectl delete -f ./2-1.mysqld-exporter.yaml
kubectl delete -f ./2-0.mysql.yaml
