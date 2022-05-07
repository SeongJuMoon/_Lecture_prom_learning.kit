#!/usr/bin/env bash
yum install -y git

git clone https://github.com/SeongJuMoon/_Lecture_prometheus_learning.kit.git
mv /home/vagrant/_Lecture_prometheus_learning.kit $HOME
find $HOME/_Lecture_prometheus_learning.kit -regex ".*\.\(sh\)" -exec chmod 700 {} \;