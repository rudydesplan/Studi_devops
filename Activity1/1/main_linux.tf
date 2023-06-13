# Local provider to start minikube
provider "local" {
  version = "~> 2.4.0"
}

# Start minikube
resource "local_exec" "install_minikube" {
  command = <<-EOF
    minikube start --vm-driver=none
  EOF
}
