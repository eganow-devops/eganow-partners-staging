output "project_namespace" {
  value = kubernetes_namespace_v1.ega_partner_namespace.metadata.0.name
}