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
    HOST     = base64encode("dpg-ci45mrliuie031g7mung-a")
    PORT     = base64encode("5432")
    DATABASE = base64encode("studi")
    USERNAME = base64encode("studi")
    PASSWORD = base64encode("QDMumdIe37s4NJ4H94WelWLalKzJQ9dF")
  }
}
