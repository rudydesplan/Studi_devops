# Install ECK and deploy resources
resource "null_resource" "install_eck" {
  provisioner "local-exec" {
    command = <<-EOF
      kubectl create -f https://download.elastic.co/downloads/eck/2.8.0/crds.yaml
      kubectl apply -f https://download.elastic.co/downloads/eck/2.8.0/operator.yaml
    EOF
  }
}

resource "local_exec" "deploy_elasticsearch" {
  command = <<-EOF
    cat <<EOF | kubectl apply -f -
    apiVersion: elasticsearch.k8s.elastic.co/v1
    kind: Elasticsearch
    metadata:
      name: elasticsearch
    spec:
      version: 8.8.1
      nodeSets:
      - name: default
        count: 1
        config:
          node.master: true
          node.data: true
          node.ingest: true
          node.store.allow_mmap: false
    EOF
  EOF
}
