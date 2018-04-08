# Ec2 instance notes
# Size: m5.2xlarge
# EBS: 30 GB EBS
# 



# Updating instance
sudo yum update

# Installing and starting Docker
sudo yum install docker
sudo service docker start

# Setting up hortonworks vm
wget https://s3.amazonaws.com/antonison-shared-hortonworks-for-project/start-sandbox-hdp-standalone_2-6-4.sh
chmod 770 start-sandbox-hdp-standalone_2-6-4.sh
sudo ./start-sandbox-hdp-standalone_2-6-4.sh


