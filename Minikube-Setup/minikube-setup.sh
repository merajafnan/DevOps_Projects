#!/bin/bash
#Download the latest release with the command
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

#Validate the binary
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

#Install & verify kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
kubectl version --client --output=yaml

#Minikube Installation
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

#----------------------------------------------------------------------------------------------







# Create Key & Install awscli
ssh-keygen
sudo apt update && sudo apt install awscli -y
aws configure

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv kubectl /usr/local/bin/
kubectl --help

#Install kops
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x ./kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops

# check DNS server
nslookup -type=ns kube.eereeda.in

# Create configuration for Kubernetes Cluster in S3 Bucket
kops create cluster --name=kube.eereeda.in --state=s3://eereeda-kops-state --zones=us-east-1a,us-east-1b --node-count=2 --node-size=t3.small --master-size=t3.small --dns-zone=kube.eereeda.in

#Create Cluster
kops update cluster --name kube.eereeda.in --state=s3://eereeda-kops-state --yes
kops export kubecfg --state=s3://eereeda-kops-state --admin

#Validate Cluster
kops validate cluster --state=s3://eereeda-kops-state

cat .kube/config

kops delete cluster --name kube.eereeda.in --state=s3://eereeda-kops-state --yes