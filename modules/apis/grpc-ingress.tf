resource "kubernetes_ingress_v1" "ingress_eganow_grpc" {
  metadata {
    name = "ingress-eganow-grpc"
    namespace = var.project_namespace
    labels = {
      scope = var.label_scope
      env = var.label_env
    }
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
      "nginx.ingress.kubernetes.io/force-ssl-redirect" = "true"
      "nginx.ingress.kubernetes.io/backend-protocol" = "GRPC"
      "cert-manager.io/cluster-issuer" = "letsencrypt-dns01-digitalocean"
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    tls {
      hosts = ["*.dev.egadevapi.com"]
      secret_name = "ingress-eganow-grpc-tls"
    }
    ingress_class_name = "nginx"

    rule {
      host = "ghipss-egapay.dev.egadevapi.com"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "egapay-ghipss-svc"
              port {
                name = "grpc"
              }
            }
          }
        }
      }
    }

    rule {
      host = "eganowcoredev.dev.egadevapi.com"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "egacore-api-for-developer-api-svc"
              port {
                name = "grpc"
              }
            }
          }
        }
      }
    }

    rule {
      host = "eganowcoredev.dev.egadevapi.com"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "egacore-api-for-developer-api-svc"
              port {
                name = "grpc"
              }
            }
          }
        }
      }
    }

    rule {
      host = "atgh-egapay.dev.egadevapi.com"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "egapay-atmoney-svc"
              port {
                name = "grpc"
              }
            }
          }
        }
      }
    }

    rule {
      host = "mtngh-egapay.dev.egadevapi.com"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "egapay-mtn-svc"
              port {
                name = "grpc"
              }
            }
          }
        }
      }
    }

    rule {
      host = "merchant.dev.egadevapi.com"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "eganow-merchant-svc"
              port {
                name = "grpc"
              }
            }
          }
        }
      }
    }

    rule {
      host = "eganowmtngh.com"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "egapay-mtn-openapi-svc"
              port {
                name = "grpc"
              }
            }
          }
        }
      }
    }
  }
}
