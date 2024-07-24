terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    linode = {
      source = "linode/linode"
    }
  }
}

# create project namespace
resource "kubernetes_namespace_v1" "ega_partner_namespace" {
  metadata {
    name = "egapartnerdevops"
  }
}

