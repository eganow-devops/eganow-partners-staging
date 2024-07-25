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

  project_namespace = "egapartnerdevops"
  docker_registry   = module.secrets.docker_registry

  providers = {
    kubernetes = kubernetes
  }
}


#register secrets module
module "secrets" {
  source = "./secrets"

  providers = {
    kubernetes = kubernetes
  }
}