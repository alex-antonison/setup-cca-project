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

# Setup Elasticsearch

# Setup neo4j
## Presets up so you do not have to acknowledge anything
echo debconf shared/accepted-oracle-license-v1-1 select true | \
sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
sudo debconf-set-selections

## Setup Java
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java8-installer -y

## Setup neo4j
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb http://debian.neo4j.org/repo stable/' | sudo tee -a /etc/apt/sources.list.d/neo4j.list
sudo apt-get update

## Had to go back to 3.0 to get a working version
sudo docker run -d --restart unless-stopped \
    --publish=7474:7474 --publish=7687:7687 \
    --volume=$HOME/neo4j/data:/data \
    --volume=$HOME/neo4j/logs:/logs \
    neo4j:3.0

# Setup Elasticsearch

## Install docker compose
sudo pip install docker-compose

## Compose up elastic search
cd elastic-search-compose
docker-compose up

# Setting up hortonworks vm
chmod 770 setup-cca-project/start-sandbox-hdp-standalone_2-6-4.sh
sudo ./setup-cca-project/start-sandbox-hdp-standalone_2-6-4.sh