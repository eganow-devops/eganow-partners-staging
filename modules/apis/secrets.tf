resource "kubernetes_secret_v1" "do_dns_token" {
  metadata {
    name      = "digitalocean-dns"
    namespace = module.cert_manager.namespace
  }

  data = {
    token = var.do_token
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

