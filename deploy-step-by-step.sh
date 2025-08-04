#!/bin/bash

set -e

echo "🚀 Step-by-step Kubernetes deployment..."

read -p "Step 1: Prepare all nodes? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ansible-playbook playbooks/01-prepare-nodes.yml
fi

read -p "Step 2: Setup master node? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ansible-playbook playbooks/02-setup-master.yml
fi

read -p "Step 3: Setup worker nodes? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ansible-playbook playbooks/03-setup-workers.yml
fi

echo "✅ Deployment completed!"
