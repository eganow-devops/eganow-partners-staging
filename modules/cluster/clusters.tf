resource "linode_lke_cluster" "partner_cluster" {
  label       = var.cluster_label
  k8s_version = var.cluster_k8s_version
  region      = var.cluster_region
  tags        = var.cluster_tags

  pool {
    type  = "g6-standard-2"

    autoscaler {
      min = 1
      max = 3
    }
    count = 1
  }
}