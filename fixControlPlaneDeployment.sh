#!/bin/bash

# Create the .kube directory in the user's home directory
mkdir -p $HOME/.kube

# Copy the Kubernetes admin configuration to the user's .kube directory
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

# Change the ownership of the copied config file to the user
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#add Calico object to kubesystem to ready all nodes 
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

echo "Control plane deployment fixed!"
