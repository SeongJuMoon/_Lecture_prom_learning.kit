# 1-1.deploy at a once for mysql 
kubectl apply -f 1.mysql-w-exporter.yaml

# check to add the target and promql 
# mysql uptime.
mysql_global_status_uptime
# get db available connect percent.
100 * mysql_global_status_threads_connected / mysql_global_variables_max_connections

# 1-2.delete deployed mysql 
kubectl delete -f 1.mysql-w-exporter.yaml 

# 2.actual enviroment 
# 2-1.deploy mysql only 
kubectl apply -f 2-0.mysql.yaml

# check deployed mysql and svc 
# there is no mysql on prometheus web ui 

# 2-2.deploy mysqld-exporter to scrape from mysql  
kubectl apply -f 2-1.mysqld-exporter.yaml

# 3. deploy mysql and mysqld exporter.
kubectl apply -f 2.mysql/

# 4. check mysql and mysqld exporter.
kubectl get service,deployment mysql

# result
NAME            TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)                         AGE
service/mysql   LoadBalancer   10.99.154.164   192.168.1.73   3306:30935/TCP,9104:30828/TCP   11m

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/mysql   1/1     1            1           11m

# 5. install mysql client tool.
./3.install-mysql-client.sh

# 6. check mysql service annotations
kubectl get services mysql -o yaml | nl
7  prometheus.io/port: "9104"
8  prometheus.io/scrape: "true"

# 7. check target ui on prometheus ui(http://192.168.1.11/targets)
search CTRL + F enter mysql

# 8. prometheus ui(http://192.168.1.11/graph) below query.
mysql_global_variables_max_allowed_packet
# result
mysql_global_variables_max_allowed_packet 67108864

# 9. check max_allowed_packet in mysql.
# connect to mysql pod
mysql -h 192.168.1.73 -u root -p
# password is 'root'

show variables like 'max_allowed_packet';
max_allowed_packet | 67108864 

# 10. add database
source ./db_scripts/1.setup.sql;

# 11. check `world` database added.
show databases;

#result
...
world
...

# 12. change mysql variables `max_allowed_packet` to 1024. 
set global max_allowed_packet=1024;

# 13. check browser on prometheus ui(http://192.168.1.11/graph) enter the below query.
mysql_global_variables_max_allowed_packet 
# result mysql_global_variables_max_allowed_packet 1024

# 14. check `max_allowed_packet` variables at the active client to variables changed.
show variables like 'max_allowed_packet';
max_allowed_packet | 67108864 

# 15. reconnect mysql to max_allowed_packet variable has been updated. 
CTRL + d
# result
mysql> ^DBye
mysql -h 192.168.1.73 -u root -p
# password is 'root'

# 16. check retry max_allowed_packet variables.
show variables like 'max_allowed_packet';
max_allowed_packet | 1024 

# 17. running data migration below command in mysql client.
source db_scripts/2.insert.sql
...
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
Query OK, 0 rows affected (0.00 sec)

ERROR 1153 (08S01): Got a packet bigger than 'max_allowed_packet' bytes
ERROR 2013 (HY000): Lost connection to MySQL server during query
No connection. Trying to reconnect...
Connection id:    94
Current database: world

Query OK, 0 rows affected (0.02 sec)

# initialize max_allowed_packet variables 
# and reconnect mysql client to apply variables value updated.
set global max_allowed_packet=64 * 1024 * 1024;
CTRL + d
# result
mysql> ^DBye
mysql -h 192.168.1.73 -u root -p
# password is 'root'

# 18. check max_allowed_packet variables is updated to 67108864.
show variables like 'max_allowed_packet';
# result
max_allowed_packet | 67108864

# 19. check max_allowed_packet variables at prometheus web ui(192.168.1.73) using below query.
mysql_global_variables_max_allowed_packet
# result 
mysql_global_variables_max_allowed_packet 67108864

# 20. retry insert on mysql pod.
source db_scripts/2.insert.sql
# result 
...
Query OK, 4079 rows affected (1.19 sec)
Records: 4079  Duplicates: 0  Warnings: 0
...

# 21. check data is inserted on table is below query.
select count(1) from world.city;
# result
4079

# 22. disconnect mysql to prepare next lecture.
CTRL + D
mysql> ^DBye

# 23. cleanup resource to next lecture.
kubectl delete -f ./2-1.mysqld-exporter.yaml
kubectl delete -f ./2-0.mysql.yaml
