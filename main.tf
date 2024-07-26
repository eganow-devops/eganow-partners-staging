terraform {
  cloud {
    organization = "eganow-devops-org"
    workspaces {
      name = "eganow-partner"
    }
  }

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 2.24.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.31.0"
    }
  }
}

# configure linode provider
provider "linode" {
  token = var.linode_api_token
}

provider "kubernetes" {

  config_path = module.cluster.lke_cluster_kubeconfig_path
}

# register cluster module
module "cluster" {
  source = "./modules/cluster"

  providers = {
    linode = linode
  }
}

#register apis module
module "apis" {
  source = "./modules/apis"

  depends_on = [module.cluster]

  providers = {
    linode     = linode
    kubernetes = kubernetes
  }
}
