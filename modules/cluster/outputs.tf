# output "eganow_cluster_id" {
#   value = vultr_kubernetes.k8s.id
# }
#
# output "eganow_cluster_kubeconfig_host" {
#   value = "https://63e9a861-30be-4c22-b79b-05155b13fb14.vultr-k8s.com:6443"
# }
#
# output "eganow_cluster_kubeconfig_ca_cert" {
#   value = base64decode(vultr_kubernetes.k8s.cluster_ca_certificate)
# }
#
# output "eganow_cluster_kubeconfig_client_cert" {
#   value = base64decode(vultr_kubernetes.k8s.client_certificate)
# }
#
# output "eganow_cluster_kubeconfig_client_key" {
#   value = base64decode(vultr_kubernetes.k8s.client_key)
# }