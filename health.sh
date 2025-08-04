#!/bin/bash

echo "🔍 Kubernetes Cluster Health Status"
echo "===================================="

# Check connectivity
echo "1. Testing node connectivity..."
ansible all -m ping

# Check cluster status
echo "2. Checking cluster status..."
ansible masters -m shell -a "kubectl get nodes -o wide"

# Check pod status
echo "3. Checking system pods..."
ansible masters -m shell -a "kubectl get pods --all-namespaces"

# Check logs if needed
echo "4. Checking kubelet status on all nodes..."
ansible all -m shell -a "systemctl status kubelet --no-pager -l"

echo "✅ Health Status completed!"
