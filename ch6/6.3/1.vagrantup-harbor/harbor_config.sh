#!/usr/bin/env bash

# avoid 'dpkg-reconfigure: unable to re-open stdin: No file or directory'
export DEBIAN_FRONTEND=noninteractive

# add docker-ce repo with containerd
curl -fsSL \
  https://download.docker.com/linux/ubuntu/gpg \
  -o /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.asc] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
  | tee /etc/apt/sources.list.d/docker.list > /dev/null

# install & enable docker containerd  
apt-get update
#apt-get install docker-ce=$1 docker-ce-cli=$1 containerd.io=$2 -y
apt-get install docker-ce=$1 docker-ce-cli=$1 -y

# install docker-compose 
curl -L https://github.com/docker/compose/releases/download/v2.10.0/docker-compose-linux-x86_64 -o docker-compose
chmod +x docker-compose
mv docker-compose /usr/local/bin

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

# add execution for prepare script
chmod +x $HOME/_Lecture_prom_learning.kit/ch6/6.3/3.harbor-app/prepare

