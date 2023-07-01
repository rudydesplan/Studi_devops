# Null provider to install helm
provider "null" {
  version = "~> 3.1.0"
}

# Helm provider to interact with the Helm server
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
  depends_on = [
    null_resource.install_helm
  ]
}

# Kubernetes provider to interact with the Kubernetes cluster
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Install Helm
resource "null_resource" "install_helm" {
  provisioner "local-exec" {
    command = <<EOF
      curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
    EOF
  }
}

# Add the Elasticsearch Helm repository
data "helm_repository" "elastic" {
  name = "elastic"
  url  = "https://helm.elastic.co"
}

# Install Elasticsearch using Helm
resource "helm_release" "elasticsearch" {
  name       = "elasticsearch"
  repository = data.helm_repository.elastic.metadata[0].name
  chart      = "elasticsearch"
  version    = "8.8.1"
}
