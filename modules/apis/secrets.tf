resource "kubernetes_secret_v1" "do_dns_token" {
  metadata {
    name      = "digitalocean-dns"
    namespace = var.cluster_issuer_name
  }

  data = {
    token = var.do_token
  }
}