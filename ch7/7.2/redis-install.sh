#!/usr/bin/env bash
if (command -v redis-cli > /dev/null); then
  yum install -y redis
else
  echo 'redis client is already installed.'
fi