# 0. check list directory files.
ls -rlt
# 1.install-mysql-client.sh  2.mysql  db_scripts

# 1. install denpencies mysql-client 8.0 for connect to mysql pod.
./1.install-mysql-client.sh

# 2. check manifest mysql and mysql exporter.
ls -rlt 2.mysql
# service.yaml
# mysql.yaml

# 3. deploy mysql and mysql exporter.
kubectl apply -f 2.mysql/

# 4. check mysql and mysql exporter.
kubectl get service,deployment mysql

# result
NAME            TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)                         AGE
service/mysql   LoadBalancer   10.99.154.164   192.168.1.73   3306:30935/TCP,9104:30828/TCP   11m

NAME                    READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/mysql   1/1     1            1           11m


# 5. check mysql service annotations
kubectl get services mysql -o yaml | nl
7  prometheus.io/port: "9104"
8  prometheus.io/scrape: "true"

# 6. check target ui on prometheus ui(http://192.168.1.11/targets)
search CTRL + F enter mysql

# 7. prometheus ui(http://192.168.1.11/graph) below query.
mysql_global_variables_max_allowed_packet
# result
mysql_global_variables_max_allowed_packet 67108864

# check max_allowed_packet in mysql.
# connect to mysql pod
mysql -h 192.168.1.73 -u root -p
# password is 'root'

show variables like 'max_allowed_packet';
max_allowed_packet | 67108864 

# 8. add database
source ./db_scripts/1.setup.sql;

# 9. check `world` database added.
show databases;

#result
...
world
...

# 10. change mysql variables `max_allowed_packet` to 1024. 
set global max_allowed_packet=1024;

# 11. check browser on prometheus ui(http://192.168.1.11/graph) enter the below query.
mysql_global_variables_max_allowed_packet 
# result mysql_global_variables_max_allowed_packet 1024

# 12. check `max_allowed_packet` variables at the active client to variables changed.
show variables like 'max_allowed_packet';
max_allowed_packet | 67108864 

# 13. reconnect mysql to max_allowed_packet variable has been updated. 
CTRL + d
# result
mysql> ^DBye
mysql -h 192.168.1.73 -u root -p
# password is 'root'

# 14. check retry max_allowed_packet variables.
show variables like 'max_allowed_packet';
max_allowed_packet | 1024 

# 15. running data migration below command in mysql client.
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

# 16. check max_allowed_packet variables is updated to 67108864.
show variables like 'max_allowed_packet';
# result
max_allowed_packet | 67108864

# 17. check max_allowed_packet variables at prometheus web ui(192.168.1.73) using below query.
mysql_global_variables_max_allowed_packet
# result 
mysql_global_variables_max_allowed_packet 67108864

# 18. retry insert on mysql pod.
source db_scripts/2.insert.sql
# result 
...
Query OK, 4079 rows affected (1.19 sec)
Records: 4079  Duplicates: 0  Warnings: 0
...

# 19. check data is inserted on table is below query.
select count(1) from world.city;
# result
4079

# 20. disconnect mysql to prepare next lecture.
CTRL + D
mysql> ^DBye

# 21. cleanup resource to next lecture.
kubectl delete -f ./2.mysql
