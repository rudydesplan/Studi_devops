# Terraform Kubernetes Database Secret Configuration

This README explains the Terraform configuration for setting up a Kubernetes secret that holds database credentials.

##Terraform Configuration File

The `db_config_linux.tf` file contains the configuration for creating a Kubernetes secret.

## Explanation

### Variables
```
variable "db_host" {}
variable "db_port" {}
variable "db_name" {}
variable "db_user" {}
variable "db_pass" {}
```

In this block, we declare several Terraform variables. These are used to hold the database credentials that will be stored in the Kubernetes secret.

### Provider
```
provider "kubernetes" {
  config_path = "~/.kube/config"
}
```

In this block, we declare the Kubernetes provider, which is used to manage Kubernetes resources.

The `config_path` attribute specifies the location of the kubeconfig file that Terraform will use to communicate with the Kubernetes cluster.

### Resource
```
resource "kubernetes_secret" "db_credentials" {
  metadata {
    name = "db-credentials"
  }

  data = {
    HOST     = base64encode(var.db_host)
    PORT     = base64encode(var.db_port)
    DATABASE = base64encode(var.db_name)
    USERNAME = base64encode(var.db_user)
    PASSWORD = base64encode(var.db_pass)
  }
}
```

This block declares a Kubernetes secret resource.

The metadata block specifies the name of the secret.

The data block holds the actual database credentials.

Each entry is base64-encoded for security.

## Characteristics of the Secret

The secret created by this configuration has the following characteristics:

#### Name: 

The name of the secret is db-credentials.

#### Data: 

The data in the secret includes the host, port, database name, username, and password for the database. Each of these is base64-encoded.

#### Usage:

The secret can be used by Kubernetes Pods to connect to the database without having to hardcode the credentials into the Pod specification or Docker image.

Instead, the Pods can refer to the secret, and Kubernetes will provide the credentials to the Pod at runtime.
