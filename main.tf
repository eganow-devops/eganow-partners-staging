terraform {
  cloud {
    organization = "eganow-devops-org"
    workspaces {
      name = "eganow-partners-uat-ws"
    }
  }
}

# register cluster module
module "cluster" {
  source        = "./modules/cluster"
  linode_api_key = var.linode_api_key
}

# module "apis" {
#   source                       = "./modules/apis"
#   k8s_ca_certificate           = module.cluster.eganow_cluster_kubeconfig_ca_cert
#   k8s_id                       = module.cluster.eganow_cluster_id
#   k8s_host                     = module.cluster.eganow_cluster_kubeconfig_host
#   k8s_client_cert              = module.cluster.eganow_cluster_kubeconfig_client_cert
#   k8s_client_key               = module.cluster.eganow_cluster_kubeconfig_client_key
#   cluster_issuer_email         = var.cluster_issuer_email
#   cloudflare_token             = var.cloudflare_token
#   dockerconfigjson             = var.dockerconfigjson
#   partners_domain_name         = var.partners_domain_name
#   onepassword_token            = var.onepassword_token
#   onepassword_credentials_json = var.onepassword_credentials_json
# }