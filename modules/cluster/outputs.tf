output "eganow_cluster_kubeconfig" {
 value = base64decode(linode_lke_cluster.partner_cluster.kubeconfig)
}