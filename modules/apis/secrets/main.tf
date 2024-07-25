terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

resource "kubernetes_secret_v1" "docker_registry" {
  metadata {
    name      = "docker-registry"
    namespace = var.project_namespace
  }
}