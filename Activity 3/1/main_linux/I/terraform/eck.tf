# Install ECK and deploy resources
resource "null_resource" "install_eck" {
  provisioner "local-exec" {
    command = <<-EOF
      kubectl create -f https://download.elastic.co/downloads/eck/2.8.0/crds.yaml
      kubectl apply -f https://download.elastic.co/downloads/eck/2.8.0/operator.yaml
    EOF
  }
}
