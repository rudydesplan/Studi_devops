resource "kubernetes_namespace" "elasticsearch" {
  metadata {
    name = "elasticsearch"
  }
}

resource "kubernetes_deployment" "elasticsearch" {
  metadata {
    name = "elasticsearch"
    namespace = kubernetes_namespace.elasticsearch.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "elasticsearch"
      }
    }

    template {
      metadata {
        labels = {
          app = "elasticsearch"
        }
      }

      spec {
        container {
          image = "docker.elastic.co/elasticsearch/elasticsearch:8.8.1"
          name  = "elasticsearch"

          env {
            name = "discovery.type"
            value = "single-node"
          }

          port {
            container_port = 9200
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "elasticsearch" {
  metadata {
    name = "elasticsearch"
    namespace = kubernetes_namespace.elasticsearch.metadata[0].name
  }

  spec {
    selector = {
      app = "elasticsearch"
    }

    port {
      port        = 9200
      target_port = 9200
    }
  }
}
