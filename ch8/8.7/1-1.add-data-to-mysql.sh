#!/usr/bin/env bash

MYSQL_HOST=$(kubectl get service mysql -o jsonpath="{.spec.clusterIP}")

mysql -h $MYSQL_HOST -uroot -proot < db_scripts/data/add_data