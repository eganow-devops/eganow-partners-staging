resource "vultr_kubernetes" "k8s" {
  region  = var.cluster_region
  label   = var.cluster_label
  version = var.cluster_k8s_version

  node_pools {
    node_quantity = var.cluster_node_quantity
    plan          = var.cluster_node_pool_plan
    label         = "${var.cluster_label}-pool"
    auto_scaler   = true
    min_nodes     = var.cluster_node_autoscale_min_count
    max_nodes     = var.cluster_node_autoscale_max_count
  }
}
