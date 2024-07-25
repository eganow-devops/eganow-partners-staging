terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}