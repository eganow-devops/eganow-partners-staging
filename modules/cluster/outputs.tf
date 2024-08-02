output "lke_cluster_kubeconfig_path" {
  value = "https://${linode_object_storage_bucket.staging_storage_bucket.hostname}/${linode_object_storage_object.staging_kubeconfig.key}"
}

output "lke_cluster_id" {
  value = linode_lke_cluster.eganow_partners_staging.id
}