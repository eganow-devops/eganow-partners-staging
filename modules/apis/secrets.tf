resource "kubernetes_secret_v1" "cloudflare_dns_token" {
  metadata {
    name      = "cloudflare-dns"
    namespace = var.cluster_issuer_name
  }

  data = {
    token = var.cloudflare_global_api_key
  }
}


resource "kubernetes_secret_v1" "onepassword_connect" {
  metadata {
    name      = "onepassword-connect"
    namespace = var.project_namespace
  }

  data = {
    "onepassword-credentials" : base64encode(jsonencode(var.onepassword_credentials_json))
    token = var.onepassword_token
  }
}


resource "kubernetes_secret_v1" "dockerconfigjson" {
  metadata {
    name      = "dockerconfigjson"
    namespace = var.project_namespace
  }
  type = "kubernetes.io/dockerconfigjson"
  data = {
    ".dockerconfigjson" = jsonencode(var.dockerconfigjson)
  }
}

