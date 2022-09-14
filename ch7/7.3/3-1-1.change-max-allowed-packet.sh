#!/usr/bin/env bash

mysql -h 192.168.1.73 -uroot -proot < db_scripts/max_allowed_packet/1gb > /dev/null
echo "mysql max_allowed_packet is 1GB now!"

