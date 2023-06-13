terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "0.1.1"
    }
  }
}

# Configure the Kind Provider
provider "kind" {
  # Configuration options
}

# Create a cluster
resource "kind_cluster" "default" {
    name = "test-cluster"
}
