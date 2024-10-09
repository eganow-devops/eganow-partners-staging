resource "local_file" "kubeconfig" {
  filename = "${path.module}/eganow-partner-kubeconfig.yaml"
  content  = var.k8s_kubeconfig
}