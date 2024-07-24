terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}


variable "project_namespace" {
  default = "egapartnerdevops"
}
resource "kubernetes_secret_v1" "docker_registry" {
  metadata {
    name = "docker-registry"
    namespace = var.project_namespace

  }
}

#data = {
  #  ".dockerconfigjson" = jsonencode(var.dockerconfigjson)

 # type = "kubernetes.io/dockerconfigjson"