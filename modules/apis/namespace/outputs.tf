output "project_namespace" {
  value = kubernetes_namespace_v1.egapartnerdevops.metadata.0.name
}