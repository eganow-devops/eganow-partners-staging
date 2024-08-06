terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.14.0"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = "~> 2.0.4"
    }
  }
}

provider "kubernetes" {
  cluster_ca_certificate = var.k8s_ca_certificate
  client_certificate     = var.k8s_cert
  client_key             = var.k8s_key
  host                   = var.k8s_host
}
provider "kubectl" {
  host                   = var.k8s_host
  token                  = var.k8s_key
  cluster_ca_certificate = var.k8s_ca_certificate
  load_config_file       = false
}

provider "helm" {
  kubernetes {
    host                   = var.k8s_host
    token                  = var.k8s_key
    cluster_ca_certificate = var.k8s_ca_certificate
  }
}

module "deployments_svc" {
  source = "./deployment-svc"

  providers = {
    kubernetes = kubernetes
  }
}