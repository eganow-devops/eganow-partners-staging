output "lke_cluster_kubeconfig_path" {
  value = local_file.lke_cluster_kubeconfig_raw.filename
}

output "lke_cluster_id" {
  value = linode_lke_cluster.eganow_partner_staging.id
}