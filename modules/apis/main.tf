terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
    }
  }
}

# register deployment modules
module "deployments" {
  source            = "./deployments"
  project_namespace = module.namespace.project_namespace
  docker_registry   = module.secrets.docker_registry

  providers = {
    kubernetes = kubernetes
  }
}

#register namespace module
module "namespace" {
  source = "./namespace"

  providers = {
    kubernetes = kubernetes
  }
}

#register secrets module
module "secrets" {
  source = "./secrets"
  project_namespace = module.namespace.project_namespace

  providers = {
    kubernetes = kubernetes
  }
}