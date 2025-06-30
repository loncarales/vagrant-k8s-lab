# Vagrant Kubernetes Lab

A local Kubernetes cluster lab environment using Vagrant, VirtualBox, and Ansible.

## Repository

**Repository Name**: DevSecOps

## Description

This project provides an automated setup for a local Kubernetes cluster using Vagrant and VirtualBox. It creates one Kubernetes control plane node and two worker nodes, all provisioned using Ansible.

## Requirements

- [Vagrant](https://www.vagrantup.com/) (for VM management)
- [VirtualBox](https://www.virtualbox.org/) (as the VM provider)
- [uv](https://github.com/astral-sh/uv) (Python package manager)
- [make](https://www.gnu.org/software/make/) (for running commands)
- Python 3.13 or higher

## Architecture

The lab creates the following VMs:
- 1 Kubernetes control plane node (2 CPUs, 2GB RAM)
- 2 Kubernetes worker nodes (2 CPUs, 4GB RAM each)

All VMs are based on Debian 12 (using the `celavi/debian12-k8s` box).

## Getting Started

### Installation

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd DevSecOps
   ```

2. Install all dependencies and start the cluster:
   ```bash
   make
   ```

   This will:
   - Download required Ansible roles and collections
   - Start the Vagrant VMs
   - Provision the Kubernetes cluster

### Available Commands

```bash
make                      # Download dependencies and start the cluster
make download-galaxy-roles # Download Ansible roles from Galaxy
make download-galaxy-collections # Download Ansible collections
make lint                 # Run ansible-lint
make up                   # Start the Vagrant VMs
make provision            # Run the provisioning again
make halt                 # Stop the Vagrant VMs
make destroy              # Destroy the Vagrant VMs
make help                 # Show available commands
```

## Accessing the Cluster

Once the cluster is up and running, you can SSH into the control plane node:

```bash
vagrant ssh k8s
```

From there, you can use `kubectl` to interact with your Kubernetes cluster.

## Project Structure

- `Vagrantfile`: Defines the VM configuration
- `Makefile`: Contains commands for managing the environment
- `ansible/`: Contains Ansible playbooks and configurations
  - `provision.yml`: Main provisioning playbook
  - `playbooks/bootstrap/`: Basic system setup
  - `playbooks/k8s/`: Kubernetes installation and configuration

## License

[Add license information here]

## Contributing

[Add contribution guidelines here]
