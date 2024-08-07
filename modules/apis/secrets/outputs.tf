output "docker_registry" {
  value = kubernetes_secret_v1.docker_registry.metadata.0.name
}