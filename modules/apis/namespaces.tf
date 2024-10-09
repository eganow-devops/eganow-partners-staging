resource "kubernetes_namespace_v1" "pay_partners_ns" {
  metadata {
    name = var.project_namespace
  }
}