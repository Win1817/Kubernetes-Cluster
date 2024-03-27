#!/bin/bash

# Update package list
sudo apt-get update

# Disable swap
sudo swapoff -a

# Install Docker
sudo apt-get install -y docker.io

# Install Kubernetes components
sudo apt-get update && sudo apt-get install -y apt-transport-https curl

# Add Kubernetes GPG key
# sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Add Kubernetes repository
# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Install Kubernetes packages
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# Enable the kubelet service before running kubeadm-Optional
sudo systemctl enable --now kubelet

echo "Setup complete!"
