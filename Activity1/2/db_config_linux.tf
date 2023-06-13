variable "db_host" {}
variable "db_port" {}
variable "db_name" {}
variable "db_user" {}
variable "db_pass" {}

# Kubernetes provider to manage kubernetes resources
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Kubernetes secret to store DB credentials
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
