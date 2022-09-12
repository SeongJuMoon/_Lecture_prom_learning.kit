#!/usr/bin/env bash
echo "mysql max_allowed_packet scale to 64MB."
mysql -h 192.168.1.73 -uroot -proot < db_scripts/max_allowed_packet/default > /dev/null