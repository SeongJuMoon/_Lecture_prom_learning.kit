#!/usr/bin/env bash

MYSQL_HOST=$(kubectl get service mysql -o jsonpath="{.spec.clusterIP}")

for i in {1..150}
do
  mysql -h $MYSQL_HOST -uroot -proot -e 'select sleep(299);' > /dev/null &
  sleep 2
done
