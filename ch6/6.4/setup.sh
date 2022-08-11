#!/usr/bin/env bash

# install util packages 
yum install epel-release -y
yum install vim-enhanced -y
yum install git -y

yum install yum-utils -y 
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

systemctl enable --now docker
systemctl start docker

yum install docker-ce-$1 docker-ce-cli-$1 containerd.io-$1 -y

# git clone prom code
git clone https://github.com/SeongJuMoon/_Lecture_prom_learning.kit.git
mv /home/vagrant/_Lecture_prom_learning.kit $HOME
find $HOME/_Lecture_prom_learning.kit -regex ".*\.\(sh\)" -exec chmod 700 {} \;

# make rerepo-prom_learning.kit and put permission
cat <<EOF > /usr/local/bin/rerepo-prom_learning.kit
#!/usr/bin/env bash
rm -rf $HOME/_Lecture_prom_learning.kit 
git clone https://github.com/seongjumoon/_Lecture_prom_learning.kit.git $HOME/_Lecture_prom_learning.kit
find $HOME/_Lecture_prom_learning.kit -regex ".*\.\(sh\)" -exec chmod 700 {} \;
EOF
chmod 700 /usr/local/bin/rerepo-prom_learning.kit
