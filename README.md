# Kubernetes Ansible Deployment

This project automates the deployment of a Kubernetes cluster using Ansible.

## Cluster Information

- **Master Node**: kube-controller 
- **Worker Node 1**: kube-node-1
- **Worker Node 2**: kube-node-2

## Prerequisites

1. **Ansible installed** on your control machine:
   ```bash
   sudo apt update && sudo apt install ansible -y
   ```

2. **SSH access** to all nodes with sudo privileges
3. **SSH key** configured for passwordless access
4. **Ubuntu 20.04/22.04** on all nodes

## Quick Start

1. **Test connectivity**:
   ```bash
   ansible all -m ping
   ```

2. **Deploy the cluster**:
   ```bash
   ./deploy.sh
   ```
   or single ansible deployment
   ```bash
   ansible-playbook site.yml
   ```


3. **Access your cluster**:
   ```bash
   ssh username@IP
   kubectl get nodes
   ```

## Step-by-Step Deployment

If you prefer to run each step manually:

```bash
./deploy-step-by-step.sh
```

Or run individual playbooks:

```bash
# Prepare all nodes
ansible-playbook playbooks/01-prepare-nodes.yml

# Setup master
ansible-playbook playbooks/02-setup-master.yml

# Setup workers  
ansible-playbook playbooks/03-setup-workers.yml
```

## Configuration

- Edit `inventory/hosts.yml` to modify node settings
- Edit `group_vars/all.yml` to change cluster configuration
- Modify roles in `roles/` directory for custom configurations

## Health Status

Run the health status script:
```bash
./health.sh
```

## File Structure

```
k8s-ansible/
├── inventory/
│   └── hosts.yml
├── playbooks/
│   ├── 01-prepare-nodes.yml
│   ├── 02-setup-master.yml
│   └── 03-setup-workers.yml
├── roles/
│   ├── k8s-common/
│   ├── k8s-master/
│   └── k8s-worker/
├── group_vars/
│   └── all.yml
├── ansible.cfg
├── site.yml
├── deploy.sh
├── deploy-step-by-step.sh
└── troubleshoot.sh
```
