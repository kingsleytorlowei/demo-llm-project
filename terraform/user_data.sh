
#!/bin/bash

sudo yum update -y
sudo yum install ecs-init
sudo yum install realmd
echo "ECS_CLUSTER=demo-llm-cluster" >> /etc/ecs/ecs.config
sudo service docker start
sudo systemctl status ecs

#Adding cluster name in ecs config
cat /etc/ecs/ecs.config | grep "ECS_CLUSTER"