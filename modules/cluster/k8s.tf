resource "linode_lke_cluster" "eganow_partner_staging" {
  k8s_version = var.cluster_k8s_version
  label       = var.cluster_label
  region      = var.cluster_region
  tags        = var.cluster_tags

  dynamic "pool" {
    for_each = var.cluster_pools
    content {
      type  = pool.value["type"]
      count = pool.value["count"]
    }
  }
}