resource "local_file" "kubeconfig" {
  filename = "${path.module}/eganow-partners-staging.yaml"
  content  = var.k8s_kubeconfig
}