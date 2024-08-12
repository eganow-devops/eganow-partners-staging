resource "helm_release" "nginx_ingress" {
  chart      = "ingress-nginx"
  name       = "partners-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = var.nginx_ingress_version
  namespace  = "ns-partners-ingress"

  create_namespace = true
  cleanup_on_fail  = true
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}

#################################
# HTTP INGRESS                  #
#################################
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
      hosts = ["*.dev.egadevapi.com"]
      secret_name = "ingress-eganow-http-tls"
    }
    ingress_class_name = "nginx"
    rule {
      host = "voda-egapay.dev.egadevapi.com"
      http {
        path {
          path      = "/api/v1"
          path_type = "Prefix"
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
    }

    rule {
      host = "dev-credentials.dev.egadevapi.com"
      http {
        path {
          path      = "/api/v1"
          path_type = "Prefix"
          backend {
            service {
              name = "dev-onepassword-connect-svc"
              port {
                name = "uat-capi"
              }
            }
          }
        }
      }
    }

    rule {
      host = "voda-blupay.dev.egadevapi.com"
      http {
        path {
          path      = "/api/v1"
          path_type = "Prefix"
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
    }

    rule {
      host = "voda-pospay.dev.egadevapi.com"
      http {
        path {
          path      = "/api/v1"
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
    }

    rule {
      host = "mtngh-egapay.dev.egadevapi"
      http {
        path {
          path = "/api/v1"
          path_type = "Prefix"
          backend {
            service {
              name = "egapay-mtn-svc"
              port {
                name = "http"
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
          path = "/api/v1"
          path_type = "Prefix"
          backend {
            service {
              name = "eganow-merchant"
              port {
                name = "http"
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
          path = "/api/v1"
          path_type = "Prefix"
          backend {
            service {
              name = "egapay-atmoney-svc"
              port {
                name = "http"
              }
            }
          }
        }
      }
    }

    rule {
      host = "eganow-merchant-dashboard.dev.egadevapi.com"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "eganow-dashboard-svc"
              port {
                name = "http"
              }
            }
          }
        }
      }
    }

    rule {
      host = "eganow-merchant.dev.egadevapi.com"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "eganow-developers-api-svc"
              port {
                name = "http"
              }
            }
          }
        }
      }
    }
    rule {
      host = "ghipss-egapay.dev.egadevapi.com"
      http {
        path {
          path = "/api/v1"
          path_type = "Prefix"
          backend {
            service {
              name = "egapay-ghipss-svc"
              port {
                name = "http"
              }
            }
          }
        }
      }
    }
  }
}

################################
# gRPC INGRESS                 #
################################
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
