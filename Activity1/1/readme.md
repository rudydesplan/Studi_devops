# Terraform Configuration for Minikube Cluster

This README explains the Terraform configuration for a single-node Kubernetes cluster using Minikube.

## Terraform Configuration File

The main.tf file contains the configuration for setting up a Minikube cluster.

### Explanation

#### Provider
`
provider "local" {
  version = "~> 2.4.0"
}
`

In this block, we declare a local provider, which is used for local operations like executing shell scripts or commands.

The version attribute specifies the version of the provider to be used.

In this case, we're targeting any version in the 2.4.x series.

#### Resource
`
resource "local_exec" "install_minikube" {
  command = <<-EOF
    minikube start --vm-driver=none
  EOF
}
`

This block declares a local_exec resource, which represents a command executed on the local machine.

The command attribute specifies the actual command to be executed.

Here, we're running minikube start --vm-driver=none, which starts a Minikube cluster with the none VM driver.

The none driver runs the Kubernetes components on the host and not in a VM, so it requires a Linux host and cannot be used on a Windows or a Mac host.

### Characteristics of the Cluster and Node

This configuration sets up a single-node Minikube cluster on the local machine where the configuration is applied.

It has the following characteristics:

#### Single Node:
The cluster consists of a single node that functions as both the control plane and the worker node.

#### Control Plane:
The control plane, including components like the API server, scheduler, controller manager, and etcd, is hosted on the single node.

#### Worker Node:
The worker node (which is also the control plane node in this case) is responsible for running the actual workloads.
These are managed by the Kubelet, the primary node agent.
