output "lke_cluster_kubeconfig_path" {
  value = "" # todo: assign bucket object reference here
}

output "lke_cluster_id" {
  value = linode_lke_cluster.eganow_partner_staging.id
}