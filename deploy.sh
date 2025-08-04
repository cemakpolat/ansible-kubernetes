#!/bin/bash

set -e

echo "🚀 Starting Kubernetes cluster deployment..."

# Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    echo "❌ Ansible is not installed. Please install it first:"
    echo "   sudo apt update && sudo apt install ansible -y"
    exit 1
fi

# Test connectivity to all nodes
echo "🔍 Testing connectivity to all nodes..."
ansible all -m ping

# Run the full deployment
echo "📦 Running complete Kubernetes installation..."
ansible-playbook site.yml

echo ""
echo "✅ Kubernetes cluster deployment completed!"
echo ""
echo "🔧 To access your cluster:"
echo "   ssh username@IP"
echo "   kubectl get nodes"
echo ""
echo "📋 To get the kubeconfig file:"
echo "   scp username@IP:~/.kube/config ~/.kube/config"

echo "🔍 Verifying cluster..."
ansible masters -m shell -a "kubectl get nodes -o wide"
echo ""
echo "✅ Cluster ready! Access with:"
echo "   ssh username@${CONTROLLER_IP}"
echo "   kubectl get nodes"