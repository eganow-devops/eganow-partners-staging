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

resource "kubernetes_namespace_v1" "ega_partner_devops" {
  metadata {
    name = var.project_namespace
  }
}