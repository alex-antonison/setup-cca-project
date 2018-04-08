# Assumes you have run the following command
# git clone https://github.com/alex-antonison/setup-cca-project.git
# Ec2 instance notes
# OS: Ubuntu - ami-e7d9038c
# Size: m4.2xlarge
# EBS: 30 GB EBS
# Default security with all ports open

# Updating instance
git clone https://github.com/alex-antonison/setup-cca-project.git
sudo apt-get update && sudo apt-get upgrade -y
mkdir local-dev

# Installing and starting Docker
sudo apt install docker.io -y

# Setting up hortonworks vm
# Works
chmod 770 setup-cca-project/start-sandbox-hdp-standalone_2-6-4.sh
sudo ./setup-cca-project/start-sandbox-hdp-standalone_2-6-4.sh

# Setup Python Ubuntu
sudo apt-get install python3-pip -y 
sudo pip3 install --upgrade pip
sudo pip3 install happybase
sudo pip3 install thrift

# Lets try cloudera
# Putting on hold for now
# sudo docker pull cloudera/quickstart:latest
# sudo docker run --hostname=quickstart.cloudera --privileged=true \
# -t -i -v /home/ubuntu/local-dev:/local-dev \
# --publish-all=true \
# -p 8888 \
# cloudera/quickstart /usr/bin/docker-quickstart

# Setup Python CDH
# CDH is being a pain, going back to HDP
# sudo yum -y update
# sudo yum -y install yum-utils
# sudo yum -y groupinstall development
# sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
# sudo yum -y install python36u
# sudo yum -y install python36u-pip




