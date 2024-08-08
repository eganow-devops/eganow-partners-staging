resource "kubernetes_ingress_v1" "ingress_eganow_http" {
  metadata {
    name      = "ingress-eganow-http"
    namespace = var.project_namespace
    labels = {
      scope       = var.label_scope
      environment = var.label_env
    }
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect"       = "true"
      "nginx.ingress.kubernetes.io/force-ssl-redirect" = "true"
      "nginx.ingress.kubernetes.io/ssl-passthrough"    = "true"
      "cert-manager.io/cluster-issuer"                 = "letsencrypt-dns01-digitalocean"
      "kubernetes.io/ingress.class"                    = "nginx"
      "nginx.ingress.kubernetes.io/enable-cors"        = "true"
    }
  }
  spec {
    tls {
      hosts       = "*.uat.egadevapi.com"
      secret_name = "ingress-eganow-http-tls"
    }
    ingress_class_name = "nginx"
    rule {
      http {
        path {
          path      = "voda-egapay.uat.egadevapi.com"
          path_type = "prefix"
          backend {
            service {
              name = "egapay-voda-svc"
              port {
                name = "http"
              }
            }
          }
        }
      }
      http {
        path {
          path      = "voda-blupay.uat.egadevapi.com"
          path_type = "prefix"
          backend {
            service {
              name = "blupay-voda-svc"
              port {
                name = "http"
              }
            }
          }
        }
      }
      http {
        path {
          path      = "voda-pospay.uat.egadevapi.com"
          path_type = "Prefix"
          backend {
            service {
              name = "pospay-voda-svc"
              port {
                name = "http"
              }
            }
          }
        }
      }
      http {
        path {
          path = "dev-credentials.uat.egadevapi.com"
          path_type = "Prefix"
          backend {
            service {
              name = "uat-onepassword-connect-svc"
              port {
                name = "uat-capi"
              }
            }
          }
        }
      }
    }
  }
}
