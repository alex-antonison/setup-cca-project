# Assumes you have run the following command
# git clone https://github.com/alex-antonison/setup-cca-project.git
# Ec2 instance notes
# OS: Ubuntu - ami-43a15f3e
# Size: m5.2xlarge
# Configuration Details - Leave default
# Storage - EBS: 100 GB EBS
# Tags - Key:Name, Label:"cca-project"
# Security Group
# Type            | Protocol | Port Range | Source
# ---------------------------------------------------
# Custom TCP Rule | TCP      | 8080       | Anywhere
# HTTP            | TCP      | 80         | Anywhere
# HTTPS           | TCP      | 443        | Anywhere
# SSH             | TCP      | 22         | Anywhere

# Although you can start off without using a keypair, it is highly recommended to create and use one.

# Updating instance
# git clone https://github.com/alex-antonison/setup-cca-project.git

sudo apt-get update && sudo apt-get upgrade -y
mkdir local-dev

# Installing and starting Docker
sudo apt install docker.io -y

# Setup Python Ubuntu
sudo apt-get install python3-pip -y 
sudo pip3 install --upgrade pip
sudo pip3 install happybase
sudo pip3 install thrift

# Setting up hortonworks vm
chmod 770 setup-cca-project/start-sandbox-hdp-standalone_2-6-4.sh
sudo ./setup-cca-project/start-sandbox-hdp-standalone_2-6-4.sh
