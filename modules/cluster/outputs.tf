output "eganow_cluster_kubeconfig" {
  value = base64decode(linode_lke_cluster.partners_cluster.kubeconfig)
}