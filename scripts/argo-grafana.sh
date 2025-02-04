#!/bin/bash
# Update the system and install Docker
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user

# Run Argo CD container (exposed on port 8080)
docker run -d --restart always --name argocd -p 8080:8080 argoproj/argocd

# Run Grafana container (exposed on port 3000)
docker run -d --restart always --name grafana -p 3000:3000 grafana/grafana
