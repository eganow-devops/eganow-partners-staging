resource "kubernetes_secret_v1" "do_dns_token" {
  metadata {
    name      = "digitalocean-dns"
    namespace = var.cluster_issuer_name
  }

  data = {
    token = var.do_token
  }
}
resource "kubernetes_secret_v1" "regcred" {
  metadata {
    name      = "regcred"
    namespace = var.project_namespace
  }
  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode(var.dockerconfigjson)
  }
}