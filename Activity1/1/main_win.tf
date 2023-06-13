provider "local" {
  version = "~> 2.4.0"
}

resource "local_exec" "install_minikube" {
  command = <<-EOF
    minikube start --vm-driver=hyperv
  EOF
}
