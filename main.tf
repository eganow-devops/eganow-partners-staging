terraform {
  cloud {
    organization = "eganow-devops-org"
    workspaces {
      name = "eganow-partners-staging-ws"
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

module "ingress" {
  source = "./modules/ingress"

  project_namespace = "egapartnersdevops"
}