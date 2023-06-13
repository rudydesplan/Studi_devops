# Terraform Configuration for Kind Cluster ( Without VM )

This README explains the Terraform configuration for a single-node Kubernetes cluster using Kind.

## Terraform Configuration File

The main.tf file contains the configuration for setting up a Kind cluster.

### Explanation

#### Provider
```
terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "0.1.1"
    }
  }
}
```

In this block, we're defining the providers that our Terraform configuration will rely on.

We're requiring the kind provider, sourced from "tehcyx/kind", and specifying that we need version "0.1.1".

#### Provider Block
```
provider "kind" {
  #Configuration options
}
```

This block is where we'd configure the kind provider. 

At the moment, no configuration options are specified.

#### Resource Block

```
resource "kind_cluster" "default" {
    name = "test-cluster"
}
```

Here, we're defining a kind_cluster resource, which represents a kind cluster.

We're naming the resource "default", and we're specifying that the cluster's name should be "test-cluster".

With this configuration, Terraform will ensure that a kind cluster with this name exists when it applies the configuration.

### Characteristics of the Cluster and Node

This configuration sets up a single-node Kind cluster on the local machine where the configuration is applied.

It has the following characteristics:

#### Cluster Type
kind creates a Kubernetes cluster that is meant to be used for local testing and development.

The cluster is fully conformant, meaning it passes the same tests that validate functionality for real production clusters.

#### Cluster Size
By default, a kind cluster created using the basic configuration has a single node, which serves as both the control plane and the worker node.

However, the size and composition of the cluster can be customized based on your specific requirements. 


#### Node Types
Each kind node runs within a Docker container on your local machine.

The node can play either the control plane role (running components like the API server, scheduler, and etcd), the worker role (running your applications), or both.

#### Runtime
The container runtime for each node is containerd, which is embedded inside the node's Docker container.

#### Networking

By default, all nodes in a kind cluster can communicate with each other, and the nodes can be accessed from your host machine.

The networking is provided by Docker.

#### Storage

The nodes use the local storage within their Docker containers, but it is possible to configure persistent storage using a local PersistentVolume.

#### Lifespan

kind clusters are ephemeral and meant to be easily created and deleted, making them ideal for CI/CD testing scenarios.
