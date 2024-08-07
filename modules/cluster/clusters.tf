resource "vultr_kubernetes" "k8s" {
  region  = "ewr"
  label   = var.cluster_label
  version = "v1.30.0+1"

  node_pools {
    node_quantity = 1
    plan          = "vc2-1c-2gb"
    label         = "vke-nodepool"
    auto_scaler   = true
    min_nodes     = 1
    max_nodes     = 3
  }
}
