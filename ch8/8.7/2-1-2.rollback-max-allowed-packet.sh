#!/usr/bin/env bash

MYSQL_HOST=$(kubectl get service mysql -o jsonpath="{.spec.clusterIP}")

mysql -h $MYSQL_HOST -uroot -proot < db_scripts/max_allowed_packet/default > /dev/null
echo "mysql max_allowed_packet restore to default(64MB)!"

