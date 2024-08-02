output "project_namespace" {
  value = kubernetes_namespace_v1.egapartnersdevops.metadata.0.name
}